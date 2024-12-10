//Connection for database in Eastern Finland Province (Itä-Suomen lääni)

const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: 'K1ttyC4t', 
    host: 'localhost', 
    port: 5433, 
    database: 'Itasuomen laani'
});

module.exports = {
    query: (text, params) => pool.query(text, params)
}