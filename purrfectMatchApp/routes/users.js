var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/data', (req, res) =>{
  if (req.query.view === 'admin') {
      res.json ({ data: 'Admin-data'});
  }
  else {
    res.json ({data: 'user-data'});
  }
})

module.exports = router;
