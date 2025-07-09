const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost',
  user: 'Xpertonecreative',
  password: 'Sh@l@@n@2416#',
  database: 'xperutxk_orient_wall',
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
