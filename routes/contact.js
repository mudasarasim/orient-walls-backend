// routes/contact.js
const express = require('express');
const router = express.Router();
const db = require('../config/db');

// POST (already exists)
router.post('/', async (req, res) => {
  const { name, email, phone, message } = req.body;

  if (!name || !email || !message) {
    return res.status(400).json({ error: 'Name, email, and message are required' });
  }

  try {
    await db.query(
      'INSERT INTO contact_messages (name, email, phone, message) VALUES (?, ?, ?, ?)',
      [name, email, phone, message]
    );
    res.json({ success: true, message: 'Message saved' });
  } catch (err) {
    console.error('Error saving message:', err);
    res.status(500).json({ error: 'Database error' });
  }
});

// ✅ GET all messages
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM contact_messages ORDER BY id DESC');
    res.json(rows);
  } catch (err) {
    console.error('Error fetching contact messages:', err);
    res.status(500).json({ error: 'Database error' });
  }
});

module.exports = router;
