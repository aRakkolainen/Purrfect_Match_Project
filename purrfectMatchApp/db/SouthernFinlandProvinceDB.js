//Connection for database in Southern Finland Province (Etelä-Suomen lääni)
const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: 'X', 
    host: 'localhost', 
    port: 5433, 
    database: 'Etelasuomen laani'
});

module.exports = {
    query: (text, params) => pool.query(text, params)
}
