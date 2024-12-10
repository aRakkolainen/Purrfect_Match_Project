//Connection for database in Eastern Finland Province (Itä-Suomen lääni)

const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  password: "x",
  host: "localhost",
  port: 5433,
  database: "itasuomen laani",
});

module.exports = {
  query: (text, params) => pool.query(text, params),
};
