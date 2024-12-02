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

router.post('/insertData', async (req, res) => {
  console.log('Hello From insert')
  const { databaseName, table } = req.query;
  const { data } = req.body;
  console.log(databaseName)
  console.log(table)
  console.log(data)

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
      const rescueCenterCount = countRows(databaseName, table)

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
