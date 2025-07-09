const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'gillbaba.com',
  user: 'u167227426_orient_walls',
  password: 'Orientwalls@122',
  database: 'u167227426_orient_walls',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// ✅ Test MySQL connection when server starts
(async () => {
  try {
    const conn = await db.getConnection();
    console.log('✅ Connected to MySQL (orient_database)');
    conn.release();
  } catch (err) {
    console.error('❌ MySQL connection failed:', err.message);
  }
})();

module.exports = db;
