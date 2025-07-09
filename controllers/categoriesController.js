const db = require('../config/db');

// Get all categories
exports.getAllCategories = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM categories');
    res.json(rows);
  } catch (err) {
    console.error('Error fetching categories:', err);
    res.status(500).json({ error: 'Database error' });
  }
};

// Create new category
exports.createCategory = async (req, res) => {
  const { name, type } = req.body;

  if (!name || !type) {
    return res.status(400).json({ error: 'Name and type are required' });
  }

  try {
    await db.query('INSERT INTO categories (name, type) VALUES (?, ?)', [name, type]);
    res.json({ success: true, message: 'Category created successfully' });
  } catch (err) {
    console.error('Error creating category:', err);
    res.status(500).json({ error: 'Database error' });
  }
};

// Delete category
exports.deleteCategory = async (req, res) => {
  const { id } = req.params;

  try {
    await db.query('DELETE FROM categories WHERE id = ?', [id]);
    res.json({ success: true, message: 'Category deleted successfully' });
  } catch (err) {
    console.error('Error deleting category:', err);
    res.status(500).json({ error: 'Database error' });
  }
};
