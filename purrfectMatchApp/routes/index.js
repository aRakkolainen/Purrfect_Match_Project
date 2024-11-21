var express = require('express');
var router = express.Router();

let provinceOfOuluDB = require('../db/ProvinceOfOuluDB');
let southernFinlandProvinceDB = require('../db/SouthernFinlandProvinceDB');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


router.get('/list/rescueCenters', async (req, res) => {
    //Fetching data about all rescue centers and their contact persons..
    let query = 'SELECT * FROM rescue_centers INNER JOIN contact_persons ON contact_persons.rescue_center_id = rescue_centers.rescue_center_id';

    let ouluResults = await provinceOfOuluDB.query(query);
    let rescueCentersOulu = ouluResults.rows;

    let southernFinlandResults = await southernFinlandProvinceDB.query(query);
    let rescueCentersSouthernFinland = southernFinlandResults.rows;

    let allRescueCenters = rescueCentersOulu.concat(rescueCentersSouthernFinland)
    let result = {
      rescueCenters: allRescueCenters
    }
    res.json(result);

  




});

module.exports = router;
