var express = require('express');
var router = express.Router();

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

    if (databaseName === "Itasuomen laani"){
      data = await easternFinlandProvinceDB.query('SELECT * FROM '+ table);
    }
    else if (databaseName === "Etelasuomen laani"){
      data = await southernFinlandProvinceDB.query('SELECT * FROM '+ table);
    }
    else if (databaseName === "Oulun laani"){
      data = await provinceOfOuluDB.query('SELECT * FROM '+ table);
    }

    let dataset = data.rows;
    res.json(dataset);  // Send the query result to the frontend as JSON
    } catch (err) {
        console.error("Postgre database error:", err.message);
        res.status(500).send("Postgre database error: " + err.message);
    } 



  //res.json({'message': 'finished'})



})


module.exports = router;
