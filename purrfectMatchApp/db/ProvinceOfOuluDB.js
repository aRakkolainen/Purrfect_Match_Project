//Connection for database in Pronvince of Oulu (Oulun lääni)
// Database connection is based on this website tutorial: https://medium.com/@eslmzadpc13/how-to-connect-a-postgres-database-to-express-a-step-by-step-guide-b2fffeb8aeac
//Note: The port might need to be changed to match your postgreSQL settings
const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: 'x', 
    host: 'localhost', 
    port: 5433, 
    database: 'ProvinceOfOuluDB'
});

module.exports = {
    query: (text, params) => pool.query(text, params)
}

