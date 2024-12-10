var express = require("express");
var router = express.Router();

let provinceOfOuluDB = require('../db/ProvinceOfOuluDB');
let southernFinlandProvinceDB = require('../db/SouthernFinlandProvinceDB');
let easternFinlandProvinceDB = require('../db/EasternFinlandProvinceDB');
let mainDB = require('../db/MainDB');

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

router.get('/login', (req, res) => {

})

router.get('/getTable', async (req,res) => {
  const { databaseName, table } = req.query;
  let data = ""
  
  try {
    const db = getDatabaseConnection(databaseName);
    data = await db.query('SELECT * FROM '+ table);

    let dataset = data.rows;
    res.json(dataset);  // Send the query result to the frontend as JSON
    } catch (err) {
        console.error("Postgre database error:", err.message);
        res.status(500).send("Postgre database error: " + err.message);
    } 
  //res.json({'message': 'finished'})
})

router.post('/removeData', async (req, res) => {
  console.log("hello from remove");
  const { databaseName, table } = req.query;
  console.log(databaseName)
  console.log(table)
  const { itemData } = req.body;
  console.log(itemData);

  try {
    const db = getDatabaseConnection(databaseName);
    
    if (table === 'animals'){
      console.log(table)

      const queryText = `
        DELETE FROM ${table} WHERE animal_id = $1 and animal_name = $2
      `;
      const values = [itemData[0], itemData[1]];
      const result = await db.query(queryText, values);
      console.log(result.rowCount)
      await mainDB.query(queryText, values);
      
      //Check if any was removed
      if (result.rowCount != 0){
        return res.json({ success: true }); 
      }
      
      return res.json({ success: false }); 
    }
    else if (table === 'rescue_centers'){
      console.log(table)
      
      //Find correct contact person
      const correctPerson = await db.query(
        `SELECT contact_person_id FROM contact_persons WHERE rescue_center_id = $1`, 
        [itemData[0]]
      );
      
      if (!correctPerson.rows[0]) {
        return res.json({ success: false, message: "No contact person found for this rescue center." });
      }
      console.log(correctPerson);
      let personID = correctPerson.rows[0].contact_person_id;
      console.log(personID)

      //Remove all animals in center
      const queryTextAnimal = `DELETE FROM animals WHERE rescue_center_id = $1`;
      const valuesAnimal = [itemData[0]];
      await db.query(queryTextAnimal, valuesAnimal);
      await mainDB.query(queryTextAnimal, valuesAnimal);

      console.log("animals removed");

      // set null to donations made to center
      const queryTextDonation =  `
      UPDATE donations SET rescue_center_id = NULL WHERE rescue_center_id = $1
    `;
      const donationValues = [itemData[0]];
      await db.query(queryTextDonation,donationValues);
      await mainDB.query(queryTextDonation,donationValues);

      console.log("Donations modified");

      //Remove correct contact person
      const queryTextPerson = `DELETE FROM contact_persons WHERE contact_person_id = $1`;
      const valuesPerson = [personID];
      await db.query(queryTextPerson, valuesPerson);
      await mainDB.query(queryTextPerson, valuesPerson);

      console.log("Contact person removed");

      const queryTextRescue = `
        DELETE FROM ${table} WHERE rescue_center_id = $1 and rescue_center_name = $2
      `;
      const valuesRescue = [itemData[0], itemData[1]];
      await db.query(queryTextRescue, valuesRescue);
      const result = await mainDB.query(queryTextRescue, valuesRescue);
      
      //Check if any was removed
      if (result.rowCount != 0){
        return res.json({ success: true }); 
      }
      return res.json({ success: false }); 
    }
    else if (table === 'customers'){
      console.log(table)

      // set null to donations made by customer
      const queryTextDonation =  `
      UPDATE donations SET customer_id = NULL WHERE customer_id = $1
    `;
      const donationValues = [itemData[0]];
      await db.query(queryTextDonation,donationValues);
      await mainDB.query(queryTextDonation,donationValues);

      //Remove custoemr
      const queryText = `
        DELETE FROM ${table} WHERE customer_id = $1 and customer_name = $2
      `;
      const values = [itemData[0], itemData[1]];
      const result = await db.query(queryText, values);
      console.log(result.rowCount)
      await mainDB.query(queryText, values);
      
      //Check if any was removed
      if (result.rowCount != 0){
        return res.json({ success: true }); 
      }
      
      return res.json({ success: false }); 
    }
  }catch (err) {
        console.error("Postgre database error:", err.message);
        res.status(500).send("Postgre database error: " + err.message);
    }
})

router.post('/modifyData', async (req, res) => {
  const {databaseName, table} = req.query;
  const {oldData} = req.body;
  let newData = req.body.newData;
  console.log(oldData);
  console.log(newData);

  const db = getDatabaseConnection(databaseName);
  let modified;

  if( table === 'animals'){
    if (newData[1] === ''){
      newData[1]=oldData[0];
    }
    if (newData[0] === ''){
      const searchQuery = `
        SELECT species from ${table} WHERE animal_id = $1 AND animal_name = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].species;
      newData[0] = sameData;
    }
    if (newData[2] === ''){
      const searchQuery = `
        SELECT animal_description from ${table} WHERE animal_id = $1 AND animal_name = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].animal_description;
      newData[2] = sameData;
    }
    if (newData[3] === ''){
      const searchQuery = `
        SELECT age from ${table} WHERE animal_id = $1 AND animal_name = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].age;
      newData[3] = sameData;
    }
    if (newData[4] === ''){
      const searchQuery = `
        SELECT requirement_description from ${table} WHERE animal_id = $1 AND animal_name = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].requirement_description;
      newData[4] = sameData;
    }
    if (newData[5] != ""){
      result = await db.query(`SELECT rescue_center_id FROM rescue_centers WHERE rescue_center_name = '${newData[5]}'`)
      centerID = result.rows[0].rescue_center_id;
      console.log(centerID);
      newData[5] = centerID;
    }
    if (newData[5] === ''){
      const searchQuery = `
        SELECT rescue_center_id from ${table} WHERE animal_id = $1 AND animal_name = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].rescue_center_id;
      newData[5] = sameData;
    }

    
    console.log(newData)
     //Updateing queries
    const updateQueryText = `
    UPDATE animals SET species = $1, animal_name = $2, animal_description = $3, age = $4, requirement_description = $5, rescue_center_ID = $6  WHERE animal_id = $7 AND animal_name = $8
    `;
    const values = [newData[0], newData[1], newData[2], newData[3], newData[4], newData[5], oldData[1], oldData[0]];
    await db.query(updateQueryText, values);
    modified = await mainDB.query(updateQueryText, values);
  }
  else if (table === 'rescue_centers'){
    if (newData[0] === ''){
      newData[0]=oldData[0];
    }
    if (newData[1] === ''){
      const searchQuery = `
        SELECT center_location from ${table} WHERE rescue_center_ID = $1 AND rescue_center_name = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].center_location;
      newData[1] = sameData;
    }

    console.log(newData)
    //Updateing queries
    const updateQueryText = `
    UPDATE rescue_centers SET rescue_center_name = $1, center_location = $2 WHERE rescue_center_id = $3 AND rescue_center_name = $4
   `;
    const values = [newData[0], newData[1], oldData[1], oldData[0]];
    await db.query(updateQueryText, values);
    modified = await mainDB.query(updateQueryText, values);
  }
  else if (table === 'contact_persons'){
    if (newData[0] === ''){
      newData[0]=oldData[0];
    }
    if (newData[1] === ''){
      const searchQuery = `
        SELECT email from ${table} WHERE contact_person_id = $1 AND contact_person = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].email;
      newData[1] = sameData;
    }
    if (newData[2] === ''){
      const searchQuery = `
        SELECT phone from ${table} WHERE contact_person_id = $1 AND contact_person = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].phone;
      newData[2] = sameData;
    }
    if (newData[3] != ""){
      result = await db.query(`SELECT rescue_center_id FROM rescue_centers WHERE rescue_center_name = '${newData[3]}'`)
      centerID = result.rows[0].rescue_center_id;
      console.log(centerID);
      newData[3] = centerID;
    }
    if (newData[3] === ''){
      const searchQuery = `
        SELECT rescue_center_id from ${table} WHERE contact_person_id = $1 AND contact_person = $2
      `;
      const values = [oldData[1], oldData[0]];
      const result = await db.query(searchQuery, values);
      const sameData = result.rows[0].rescue_center_id;
      newData[3] = sameData;
    }
    
    console.log(newData)
    //Updateing queries
    const updateQueryText = `
    UPDATE contact_persons SET contact_person = $1, email = $2, phone = $3, rescue_center_id = $4 WHERE contact_person_id = $5 AND contact_person = $6
   `;
    const values = [newData[0], newData[1], newData[2], newData[3], oldData[1], oldData[0]];
    await db.query(updateQueryText, values);
    modified = await mainDB.query(updateQueryText, values);
  }
  //Check if any was modif
  if (modified.rowCount != 0){
    return res.json({ success: true }); 
  }
    
    return res.json({ success: false }); 
})

router.post('/insertData', async (req, res) => {
  const { databaseName, table } = req.query;
  const { data } = req.body;

  try {
    //Connect to ringht database
    const db = getDatabaseConnection(databaseName);
    //Get number for id
    //const rowCount = await countRows(db, table);

    if (table === 'animals'){

      const newID = await findUniqueID(db, table, "animal_id");

      result = await db.query(`SELECT rescue_center_id FROM rescue_centers WHERE rescue_center_name = '${data[5]}'`)
      centerID = result.rows[0].rescue_center_id;
      console.log(centerID);

      const queryText = `
        INSERT INTO ${table} 
        (animal_ID, species, animal_name, animal_description, age, requirement_description, rescue_center_ID) 
        VALUES ($1, $2, $3, $4, $5, $6, $7)
      `;
      const values = [`${databaseName[0]}_ANI_${newID}`, data[0], data[1], data[2], data[3], data[4], centerID];
      await db.query(queryText, values);
      await mainDB.query(queryText, values);
    } else if (table === 'rescue_centers') {
      //const rescueCenterCount = countRows(databaseName, table)

      const newID = await findUniqueID(db, table, "rescue_center_id");

      const queryTextResCenter = `
        INSERT INTO ${table} 
        (rescue_center_ID, rescue_center_name, center_location) 
        VALUES ($1, $2, $3)
        
        `;
      const rescueValues = [`${databaseName[0]}_RES_${newID}`, data[0], data[1]];

      const quarytextConPerson = `
      INSERT INTO contact_persons 
      (contact_person_ID, contact_person, email, phone, rescue_center_ID ) 
      VALUES ($1, $2, $3, $4, $5)
      
      `;

      const personValues = [`${databaseName[0]}_CON_${newID}`, data[2], data[3], data[4], `${databaseName[0]}_RES_${newID}`];

      await db.query(queryTextResCenter, rescueValues);
      await db.query(quarytextConPerson, personValues);

      await mainDB.query(queryTextResCenter, rescueValues);
      await mainDB.query(quarytextConPerson, personValues);
    }
    res.json({ success: true });  // Send the query result to the frontend as JSON
    } catch (err) {
        console.error("Postgre database error:", err.message);
        res.status(500).send("Postgre database error: " + err.message);
    }
});

//Function to count rows for id
/*async function countRows(db, table){
  const rowCount = await db.query(`SELECT COUNT(*) AS row_count FROM ${table}`);
  //Help from ChatGPT to form this line correctly
  const count = parseInt((rowCount.rows[0] && rowCount.rows[0].row_count) || 0, 10) + 1;
  console.log(`New count for table ${table}: ${count}`);
  return count;

};*/

//Find uniqu id, ChatGPT helps to create this function
async function findUniqueID(db, table, column){
  const result = await db.query(
   `SELECT MAX(CAST(REGEXP_REPLACE(${column},  '[^0-9]', '', 'g') AS INTEGER)) AS max_id FROM ${table}`
  );
  const maxId = parseInt(result.rows[0] && result.rows[0].max_id ? result.rows[0].max_id : 0, 10) + 1;
  console.log(`New ID for table ${table}: ${maxId}`);
  return maxId;
}

//Function to  get correct database connection
function getDatabaseConnection(databaseName) {
  if (databaseName === "Itasuomen laani") {
    return easternFinlandProvinceDB;
  } else if (databaseName === "Etelasuomen laani") {
    return southernFinlandProvinceDB;
  } else if (databaseName === "Oulun laani") {
    return provinceOfOuluDB;
  }
  return null;
}
router.get("/data", (req, res) => {
  if (req.query.view === "admin") {
    res.json({ data: "Admin-data" });
  } else {
    res.json({ data: "user-data" });
  }
});

//New user creates an account
router.post("/register", async (req, res) => {
  const { name, email, phone, selectedArea } = req.body;

  if (selectedArea === "Etelasuomen laani") {
    try {
      const maxIDQuery = await southernFinlandProvinceDB.query(
        "SELECT MAX(CAST(SUBSTRING(customer_ID, 7) AS INTEGER)) as max_id FROM customers"
      );
      const lastID = maxIDQuery.rows[0].max_id || 0;
      const newId = selectedArea.charAt(0) + "_CUS_" + (parseInt(lastID) + 1);

      const query =
        "INSERT INTO customers (customer_id, customer_name, email, phone) VALUES ($1, $2, $3, $4)";
      const values = [newId, name, email, phone];
      await southernFinlandProvinceDB.query(query, values);
      res.status(200).json({ success: true, message: "Account created" });
    } catch (err) {
      res.status(500).json({ error: "Failed to create an account" });
    }
  } else if (selectedArea === "Oulun laani") {
    try {
      const maxIDQuery = await provinceOfOuluDB.query(
        "SELECT MAX(CAST(SUBSTRING(customer_ID, 7) AS INTEGER)) as max_id FROM customers"
      );
      const lastID = maxIDQuery.rows[0].max_id || 0;
      const newId = selectedArea.charAt(0) + "_CUS_" + (parseInt(lastID) + 1);

      const query =
        "INSERT INTO customers (customer_id, customer_name, email, phone) VALUES ($1, $2, $3, $4)";
      const values = [newId, name, email, phone];
      await provinceOfOuluDB.query(query, values);
      res.status(200).json({ success: true, message: "Account created" });
    } catch (err) {
      res.status(500).json({ error: "Failed to create an account" });
    }
  } else {
    try {
      const maxIDQuery = await easternFinlandProvinceDB.query(
        "SELECT MAX(CAST(SUBSTRING(customer_ID, 7) AS INTEGER)) as max_id FROM customers"
      );
      const lastID = maxIDQuery.rows[0].max_id || 0;
      const newId = selectedArea.charAt(0) + "_CUS_" + (parseInt(lastID) + 1);

      const query =
        "INSERT INTO customers (customer_id, customer_name, email, phone) VALUES ($1, $2, $3, $4)";
      const values = [newId, name, email, phone];
      await easternFinlandProvinceDB.query(query, values);
      res.status(200).json({ success: true, message: "Account created" });
    } catch (err) {
      res.status(500).json({ error: "Failed to create an account" });
    }
  }
});

//Customer update their information
router.put("/update", async (req, res) => {
  const { name, email, phone, selectedArea, newName, newEmail, newPhone } =
    req.body;
  try {
    const query =
      "UPDATE customers SET customer_name = $1, email=$2, phone=$3 WHERE customer_name = $4 and email = $5 and phone =$6 ";
    const values = [newName, newEmail, newPhone, name, email, phone];

    if (selectedArea === "Etelasuomen laani") {
      const result = await southernFinlandProvinceDB.query(query, values);
      if (result.rowCount > 0) {
        res.status(200).json({ success: true, message: "Account updated" });
      }
    } else if (selectedArea === "Oulun laani") {
      const result = await provinceOfOuluDB.query(query, values);
      if (result.rowCount > 0) {
        res.status(200).json({ success: true, message: "Account updated" });
      }
    } else {
      const result = await easternFinlandProvinceDB.query(query, values);
      if (result.rowCount > 0) {
        res.status(200).json({ success: true, message: "Account updated" });
      }
    }
  } catch (err) {
    res.status(500).json({ error: "Failed to update account information" });
  }
});

//Customer's donations
router.post("/usersDonation", async (req, res) => {
  const { name, email, selectedArea } = req.body;

  try {
    const customerQuery =
      "SELECT customer_ID FROM customers WHERE customer_name = $1 and email = $2";

    if (selectedArea === "Etelasuomen laani") {
      const customerResult = await southernFinlandProvinceDB.query(
        customerQuery,
        [name, email]
      );
      if (customerResult.rowCount === 0) {
        res.status(404).json({ error: "Customer not found." });
      }
      const customerID = customerResult.rows[0].customer_id;
      try {
        const donationQuery =
          "SELECT rescue_centers.rescue_center_name, donations.amount FROM donations JOIN rescue_centers ON donations.rescue_center_ID = rescue_centers.rescue_center_ID WHERE donations.customer_ID = $1";
        const donationResults = await southernFinlandProvinceDB.query(
          donationQuery,
          [customerID]
        );

        res.json(donationResults.rows);
      } catch (err) {
        res.status(500).json({ error: "Failed to find donations" });
      }
    } else if (selectedArea === "Oulun laani") {
      const customerResult = await provinceOfOuluDB.query(customerQuery, [
        name,
        email,
      ]);

      if (customerResult.rowCount === 0) {
        res.status(404).json({ error: "Customer not found." });
      }
      const customerID = customerResult.rows[0].customer_id;

      try {
        const donationQuery =
          "SELECT rescue_centers.rescue_center_name, donations.amount FROM donations JOIN rescue_centers ON donations.rescue_center_ID = rescue_centers.rescue_center_ID WHERE donations.customer_ID = $1";
        const donationResults = await provinceOfOuluDB.query(donationQuery, [
          customerID,
        ]);

        res.json(donationResults.rows);
      } catch (err) {
        res.status(500).json({ error: "Failed to find donations" });
      }
    } else {
      const customerResult = await easternFinlandProvinceDB.query(
        customerQuery,
        [name, email]
      );

      if (customerResult.rowCount === 0) {
        res.status(404).json({ error: "Customer not found." });
      }
      const customerID = customerResult.rows[0].customer_id;

      try {
        const donationQuery =
          "SELECT rescue_centers.rescue_center_name, donations.amount FROM donations JOIN rescue_centers ON donations.rescue_center_ID = rescue_centers.rescue_center_ID WHERE donations.customer_ID = $1";
        const donationResults = await easternFinlandProvinceDB.query(
          donationQuery,
          [customerID]
        );

        res.json(donationResults.rows);
      } catch (err) {
        res.status(500).json({ error: "Failed to find donations" });
      }
    }
  } catch (err) {
    res.status(500).json({ error: "Failed to find donations" });
  }
});

//Account check and connect right database
router.post("/accountCheck", async (req, res) => {
  const { name, email, selectedArea } = req.body;
  const customerQuery =
    "SELECT customer_ID FROM customers WHERE customer_name = $1 and email = $2";
  try {
    if (selectedArea === "Etelasuomen laani") {
      const customerResult = await southernFinlandProvinceDB.query(
        customerQuery,
        [name, email]
      );

      if (customerResult.rowCount === 0) {
        res.status(404).json({ error: "Customer not found. Register first." });
      }
      const customerID = customerResult.rows[0].customer_id;

      try {
        const rescueCenterList = southernFinlandProvinceDB.query(
          "SELECT rescue_center_ID, rescue_center_name FROM rescue_centers"
        );
        const [listResult] = await Promise.all([rescueCenterList]);
        res.json({ customerID, listResult: listResult.rows });
      } catch (err) {
        res.status(500).json({ error: err.message });
      }
    } else if (selectedArea === "Oulun laani") {
      const customerResult = await provinceOfOuluDB.query(customerQuery, [
        name,
        email,
      ]);

      if (customerResult.rowCount === 0) {
        res.status(404).json({ error: "Customer not found. Register first." });
      }
      const customerID = customerResult.rows[0].customer_id;

      try {
        const rescueCenterList = provinceOfOuluDB.query(
          "SELECT rescue_center_ID, rescue_center_name FROM rescue_centers"
        );
        const [listResult] = await Promise.all([rescueCenterList]);
        res.json({ customerID, listResult: listResult.rows });
      } catch (err) {
        res.status(500).json({ error: err.message });
      }
    } else {
      const customerResult = await easternFinlandProvinceDB.query(
        customerQuery,
        [name, email]
      );

      if (customerResult.rowCount === 0) {
        res.status(404).json({ error: "Customer not found. Register first." });
      }
      const customerID = customerResult.rows[0].customer_id;

      try {
        const rescueCenterList = easternFinlandProvinceDB.query(
          "SELECT rescue_center_ID, rescue_center_name FROM rescue_centers"
        );
        const [listResult] = await Promise.all([rescueCenterList]);
        res.json({ customerID, listResult: listResult.rows });
      } catch (err) {
        res.status(500).json({ error: err.message });
      }
    }
  } catch (err) {
    res.status(500).json({ error: "Failed to make donation" });
  }
});

//Making donation
router.post("/donation", async (req, res) => {
  const { rescueCenterID, customerID, donAmount, selectedArea } = req.body;

  try {
    if (selectedArea === "Etelasuomen laani") {
      const maxIDQuery = await southernFinlandProvinceDB.query(
        "SELECT MAX(CAST(SUBSTRING(donation_ID, 7) AS INTEGER)) as max_id FROM donations"
      );
      const lastID = maxIDQuery.rows[0].max_id || 0;
      const newId = customerID.charAt(0) + "_DON_" + (parseInt(lastID) + 1);

      const donationQuery =
        "INSERT INTO donations (donation_ID, customer_ID, rescue_center_ID, amount) VALUES ($1, $2, $3, $4)";

      await southernFinlandProvinceDB.query(donationQuery, [
        newId,
        customerID,
        rescueCenterID,
        donAmount,
      ]);

      res.status(200).json({ success: true, message: "Donation was success" });
    } else if (selectedArea === "Oulun laani") {
      const maxIDQuery = await provinceOfOuluDB.query(
        "SELECT MAX(CAST(SUBSTRING(donation_ID, 7) AS INTEGER)) as max_id FROM donations"
      );
      const lastID = maxIDQuery.rows[0].max_id || 0;
      const newId = customerID.charAt(0) + "_DON_" + (parseInt(lastID) + 1);

      const donationQuery =
        "INSERT INTO donations (donation_ID, customer_ID, rescue_center_ID, amount) VALUES ($1, $2, $3, $4)";

      await provinceOfOuluDB.query(donationQuery, [
        newId,
        customerID,
        rescueCenterID,
        donAmount,
      ]);

      res.status(200).json({ success: true, message: "Donation was success" });
    } else {
      const maxIDQuery = await easternFinlandProvinceDB.query(
        "SELECT MAX(CAST(SUBSTRING(donation_ID, 7) AS INTEGER)) as max_id FROM donations"
      );
      const lastID = maxIDQuery.rows[0].max_id || 0;
      const newId = customerID.charAt(0) + "_DON_" + (parseInt(lastID) + 1);

      const donationQuery =
        "INSERT INTO donations (donation_ID, customer_ID, rescue_center_ID, amount) VALUES ($1, $2, $3, $4)";

      await easternFinlandProvinceDB.query(donationQuery, [
        newId,
        customerID,
        rescueCenterID,
        donAmount,
      ]);

      res.status(200).json({ success: true, message: "Donation was success" });
    }
  } catch (err) {
    res.status(500).json({ error: "Failed to make donation" });
  }
});


router.get('/list/rescueCenters', async (req, res) => {
    //Fetching data about all rescue centers and their contact persons..
    let query = 'SELECT * FROM rescue_centers INNER JOIN contact_persons ON contact_persons.rescue_center_id = rescue_centers.rescue_center_id ORDER BY rescue_center_name ASC';
    
    let allResults = await mainDB.query(query);
    let allRescueCenters = allResults.rows;
    let result = {
      rescueCenters: allRescueCenters
    }
    res.json(result);

});

router.get('/list/rescueCenters/southernFinland', async (req, res) => {
    console.log("Fetching data only from Southern Finland..");
    let southernQuery = 'SELECT * FROM "Etelasuomen laanin rescue centers" INNER JOIN "Etelasuomen laanin contact persons" ON "Etelasuomen laanin contact persons".rescue_center_id = "Etelasuomen laanin rescue centers".rescue_center_id ORDER BY rescue_center_name ASC'
    let southernFinlandResults = await mainDB.query(southernQuery);
    let southernRescueCenters = southernFinlandResults.rows;
    let result = {
      rescueCenters: southernRescueCenters
    }
    res.json(result);
})

router.get('/list/rescueCenters/easternFinland', async (req, res) => {
    let easternQuery = 'SELECT * FROM "Itasuomen laanin rescue centers" INNER JOIN "Itasuomen laanin contact persons" ON "Itasuomen laanin contact persons".rescue_center_id = "Itasuomen laanin rescue centers".rescue_center_id ORDER BY rescue_center_name ASC'
    let easternFinlandResults = await mainDB.query(easternQuery);
    let easternFinlandRescueCenters = easternFinlandResults.rows;
    let result = {
      rescueCenters: easternFinlandRescueCenters
    }
    res.json(result);
})

router.get('/list/rescueCenters/provinceOfOulu', async (req, res) => {
  let ouluQuery = 'SELECT * FROM "Oulun laanin rescue centers" INNER JOIN "Oulun laanin contact persons" ON "Oulun laanin contact persons".rescue_center_id = "Oulun laanin rescue centers".rescue_center_id ORDER BY rescue_center_name ASC'
  let provinceOfOuluResults = await mainDB.query(ouluQuery);
  let provinceOfOuluRescueCenters = provinceOfOuluResults.rows;
  let result = {
    rescueCenters: provinceOfOuluRescueCenters
  }
  res.json(result);
})


//Fetches animals and their rescue centers based on given area
router.get('/list/rescueCenters/animals/:area', async(req, res) => {
  let area = req.params.area;
  let result = {};
  
  let animalsQuery = '';
  switch(area){
      case ("southernFinlandProvince"):
          animalsQuery = 'SELECT "Etelasuomen laanin animals".rescue_center_id, rescue_center_name, animal_id, species, animal_name, animal_description, age, requirement_description FROM "Etelasuomen laanin rescue centers" INNER JOIN "Etelasuomen laanin animals" ON "Etelasuomen laanin animals".rescue_center_id = "Etelasuomen laanin rescue centers".rescue_center_id ORDER BY rescue_center_name ASC';
          break;
      case("easternFinlandProvince"):
          animalsQuery = 'SELECT "Itasuomen laanin animals".rescue_center_id, rescue_center_name, animal_id, species, animal_name, animal_description, age, requirement_description FROM "Itasuomen laanin rescue centers" INNER JOIN "Itasuomen laanin animals" ON "Itasuomen laanin animals".rescue_center_id = "Itasuomen laanin rescue centers".rescue_center_id ORDER BY rescue_center_name ASC';
          break;
      case("provinceOfOulu"):
          animalsQuery = 'SELECT "Oulun laanin animals".rescue_center_id, rescue_center_name, animal_id, species, animal_name, animal_description, age, requirement_description FROM "Oulun laanin rescue centers" INNER JOIN "Oulun laanin animals" ON "Oulun laanin animals".rescue_center_id = "Oulun laanin rescue centers".rescue_center_id ORDER BY rescue_center_name ASC';
          break;
      default:
          animalsQuery = 'SELECT animal_id, species, animal_name, animal_description, age, requirement_description, animals.rescue_center_id, rescue_center_name FROM public.animals INNER JOIN rescue_centers ON rescue_centers.rescue_center_id = animals.rescue_center_id ORDER BY rescue_center_name ASC;';
          break;
  }
  try {
    let results = await mainDB.query(animalsQuery);
    result = {
      rescueCenterAnimals: results.rows
    }
  } catch(error){
    console.error(error);
    result = {
      rescueCenterAnimals: [],
      errorMsg: 'Error occured: ' + error
    }
  }
  console.log(result);
  res.json(result);


})

module.exports = router;
