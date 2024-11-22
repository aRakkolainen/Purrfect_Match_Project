var express = require("express");
var router = express.Router();

let provinceOfOuluDB = require('../db/ProvinceOfOuluDB');
let southernFinlandProvinceDB = require('../db/SouthernFinlandProvinceDB');
let easternFinlandProvinceDB = require('../db/EasternFinlandProvinceDB');

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

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
    let query = 'SELECT * FROM rescue_centers INNER JOIN contact_persons ON contact_persons.rescue_center_id = rescue_centers.rescue_center_id';
    
    let southernFinlandResults = await southernFinlandProvinceDB.query(query);
    let rescueCentersSouthernFinland = southernFinlandResults.rows;

    let easternFinlandResults = await easternFinlandProvinceDB.query(query);
    let rescueCentersEasternFinland = easternFinlandResults.rows;

    let ouluResults = await provinceOfOuluDB.query(query);
    let rescueCentersOulu = ouluResults.rows;

    let southernAndEast = rescueCentersSouthernFinland.concat(rescueCentersEasternFinland);
    let allRescueCenters = southernAndEast.concat(rescueCentersOulu);
    let result = {
      rescueCenters: allRescueCenters
    }
    res.json(result);

  




});

module.exports = router;
