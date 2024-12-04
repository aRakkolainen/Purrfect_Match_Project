var express = require('express');
var router = express.Router();

let mainDB = require('../db/mainDB');
let provinceOfOuluDB = require('../db/ProvinceOfOuluDB');
let southernFinlandProvinceDB = require('../db/SouthernFinlandProvinceDB');
let easternFinlandProvinceDB = require('../db/EasternFinlandProvinceDB');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
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

      
      //Remove correct contact person
      const queryTextPerson = `DELETE FROM contact_persons WHERE contact_person_id = $1`;
      const valuesPerson = [personID];
      await db.query(queryTextPerson, valuesPerson);
      await mainDB.query(queryTextPerson, valuesPerson);

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
    const rowCount = await countRows(db, table);

    if (table === 'animals'){

      result = await db.query(`SELECT rescue_center_id FROM rescue_centers WHERE rescue_center_name = '${data[5]}'`)
      centerID = result.rows[0].rescue_center_id;
      console.log(centerID);

      const queryText = `
        INSERT INTO ${table} 
        (animal_ID, species, animal_name, animal_description, age, requirement_description, rescue_center_ID) 
        VALUES ($1, $2, $3, $4, $5, $6, $7)
      `;
      const values = [`${databaseName[0]}_ANI_${rowCount}`, data[0], data[1], data[2], data[3], data[4], centerID];
      await db.query(queryText, values);
      await mainDB.query(queryText, values);
    } else if (table === 'rescue_centers') {
      //const rescueCenterCount = countRows(databaseName, table)

      const queryTextResCenter = `
        INSERT INTO ${table} 
        (rescue_center_ID, rescue_center_name, center_location) 
        VALUES ($1, $2, $3)
        `;
      const rescueValues = [`${databaseName[0]}_RES_${rowCount}`, data[0], data[1]];

      const quarytextConPerson = `
      INSERT INTO contact_persons 
      (contact_person_ID, contact_person, email, phone, rescue_center_ID ) 
      VALUES ($1, $2, $3, $4, $5)
      `;

      const personValues = [`${databaseName[0]}_CON_${rowCount}`, data[2], data[3], data[4], `${databaseName[0]}_RES_${rowCount}`];

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
async function countRows(db, table){
  const rowCount = await db.query(`SELECT COUNT(*) AS row_count FROM ${table}`);
  //Help from ChatGPT to form this line correctly
  const count = parseInt((rowCount.rows[0] && rowCount.rows[0].row_count) || 0, 10) + 1;
  console.log(`New count for table ${table}: ${count}`);
  return count;

};

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

module.exports = router;
