//Connection for database in Pronvince of Oulu (Oulun lääni)

const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: "K1ttyC4t", 
    host: 'localhost', 
    port: 5433, 
    database: 'main'
});

module.exports = {
    query: (text, params) => pool.query(text, params)
}