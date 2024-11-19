var express = require("express");
var router = express.Router();

const { Client } = require("pg");

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

const client = new Client({
  user: "postgres",
  host: "localhost",
  database: "Etelasuomen laani",
  password: "1234",
  port: "5432",
});

client
  .connect()
  .then(() => console.log("connected"))
  .catch((err) => console.log(err.message));

//New user creates an account
router.post("/register", async (req, res) => {
  const { name, email, phone, selectedArea } = req.body;

  const client = new Client({
    user: "postgres",
    host: "localhost",
    database: selectedArea,
    password: "1234",
    port: "5432",
  });

  client
    .connect()
    .then(() => console.log("connected"))
    .catch((err) => console.log(err.message));

  try {
    const maxIDQuery = await client.query(
      "SELECT MAX(CAST(SUBSTRING(customer_ID, 7) AS INTEGER)) as max_id FROM customers"
    );
    const lastID = maxIDQuery.rows[0].max_id || 0;
    const newId = selectedArea.charAt(0) + "_CUS_" + (parseInt(lastID) + 1);

    const query =
      "INSERT INTO customers (customer_id, customer_name, email, phone) VALUES ($1, $2, $3, $4)";
    const values = [newId, name, email, phone];
    await client.query(query, values);
    res.status(200).json({ success: true, message: "Account created" });
  } catch {}
  client.end();
});

//Customer update their information
router.put("/update/customer", async (req, res) => {
  const { name, email, newName, newEmail, newPhone } = req.body;
  try {
    const query =
      "UPDATE customer SET customer_name = $1, email=$2, phone=$3 WHERE customer_name = $4 and email = $5";
    const values = [newName, newEmail, newPhone, name, email];
    const result = await client.query(query, values);
    if (result.rowCount > 0) {
      res.status(200).json({ success: true, message: "Account updated" });
    }
  } catch (err) {
    res.status(500).json({ error: "Failed to update account information" });
  }
});

//Account check and connect right database
router.post("/accountCheck", async (req, res) => {
  const { name, email, selectedArea } = req.body;

  const client = new Client({
    user: "postgres",
    host: "localhost",
    database: selectedArea,
    password: "1234",
    port: "5432",
  });

  client
    .connect()
    .then(() => console.log("connected"))
    .catch((err) => console.log(err.message));

  try {
    const customerQuery =
      "SELECT customer_ID FROM customers WHERE customer_name = $1 and email = $2";
    const customerResult = await client.query(customerQuery, [name, email]);

    if (customerResult.rowCount === 0) {
      res.status(404).json({ error: "Customer not found. Register first." });
    }
    const customerID = customerResult.rows[0].customer_id;

    try {
      const rescueCenterList = client.query(
        "SELECT rescue_center_ID, rescue_center_name FROM rescue_centers"
      );
      const [listResult] = await Promise.all([rescueCenterList]);
      res.json({ customerID, listResult: listResult.rows });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  } catch (err) {
    res.status(500).json({ error: "Failed to make donation" });
  }
  client.end();
});

//Making donation
router.post("/donation", async (req, res) => {
  const { rescueCenterID, customerID, donAmount, selectedArea } = req.body;
  console.log(selectedArea);
  const client = new Client({
    user: "postgres",
    host: "localhost",
    database: selectedArea,
    password: "1234",
    port: "5432",
  });

  client
    .connect()
    .then(() => console.log("connected"))
    .catch((err) => console.log(err.message));

  try {
    const maxIDQuery = await client.query(
      "SELECT MAX(CAST(SUBSTRING(donation_ID, 7) AS INTEGER)) as max_id FROM donations"
    );
    const lastID = maxIDQuery.rows[0].max_id || 0;
    const newId = customerID.charAt(0) + "_DON_" + (parseInt(lastID) + 1);

    const donationQuery =
      "INSERT INTO donations (donation_ID, customer_ID, rescue_center_ID, amount) VALUES ($1, $2, $3, $4)";

    await client.query(donationQuery, [
      newId,
      customerID,
      rescueCenterID,
      donAmount,
    ]);

    res.status(200).json({ success: true, message: "Donation was success" });
  } catch (err) {
    res.status(500).json({ error: "Failed to make donation" });
  }
  client.end();
});

module.exports = router;
