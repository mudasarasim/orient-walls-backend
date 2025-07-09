// seedAdmin.js
const bcrypt = require('bcrypt');
const db = require('./config/db');

(async () => {
  try {
    const username = 'admin';
    const plainPassword = '123456';
    const hashedPassword = await bcrypt.hash(plainPassword, 10);

    await db.query('INSERT INTO admin_users (username, password) VALUES (?, ?)', [
      username,
      hashedPassword,
    ]);

    console.log('✅ Admin inserted with hashed password');
    process.exit();
  } catch (err) {
    console.error('❌ Error inserting admin:', err.message);
    process.exit(1);
  }
})();
