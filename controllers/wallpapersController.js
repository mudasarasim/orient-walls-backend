const db = require('../config/db');

// Get all wallpapers with category name
exports.getWallpapers = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT w.*, c.name as category 
      FROM wallpapers w 
      LEFT JOIN categories c ON w.category_id = c.id
    `);
    res.json(rows);
  } catch (err) {
    console.error('Error fetching wallpapers:', err);
    res.status(500).json({ error: 'Database error' });
  }
};

// Add new wallpaper with multiple images
exports.addWallpaper = async (req, res) => {
  const { title, price, category_id } = req.body;
  const files = req.files;

  if (!title || !price || !category_id || !files || Object.keys(files).length === 0) {
    return res.status(400).json({ error: 'All fields and at least one image are required' });
  }

  const image = files?.image?.[0]?.filename || '';
  const image2 = files?.image2?.[0]?.filename || '';
  const image3 = files?.image3?.[0]?.filename || '';
  const image4 = files?.image4?.[0]?.filename || '';

  try {
    await db.query(
      `INSERT INTO wallpapers (title, image, image2, image3, image4, price, category_id)
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [title, image, image2, image3, image4, price, category_id]
    );
    res.json({ success: true, message: 'Wallpaper with multiple images added' });
  } catch (err) {
    console.error('Error adding wallpaper:', err);
    res.status(500).json({ error: 'Database error' });
  }
};

// Delete wallpaper
exports.deleteWallpaper = async (req, res) => {
  const { id } = req.params;

  try {
    await db.query('DELETE FROM wallpapers WHERE id = ?', [id]);
    res.json({ success: true, message: 'Wallpaper deleted' });
  } catch (err) {
    console.error('Error deleting wallpaper:', err);
    res.status(500).json({ error: 'Database error' });
  }
};

// Update wallpaper with optional multiple images
exports.updateWallpaper = async (req, res) => {
  const { title, price, category_id } = req.body;
  const { id } = req.params;
  const files = req.files;

  try {
    let updateFields = 'title = ?, price = ?, category_id = ?';
    let values = [title, price, category_id];

    const image = files?.image?.[0]?.filename;
    const image2 = files?.image2?.[0]?.filename;
    const image3 = files?.image3?.[0]?.filename;
    const image4 = files?.image4?.[0]?.filename;

    if (image) {
      updateFields += ', image = ?';
      values.push(image);
    }
    if (image2) {
      updateFields += ', image2 = ?';
      values.push(image2);
    }
    if (image3) {
      updateFields += ', image3 = ?';
      values.push(image3);
    }
    if (image4) {
      updateFields += ', image4 = ?';
      values.push(image4);
    }

    values.push(id); // WHERE clause ID

    await db.query(
      `UPDATE wallpapers SET ${updateFields} WHERE id = ?`,
      values
    );

    res.json({ success: true, message: 'Wallpaper updated successfully' });
  } catch (err) {
    console.error('Error updating wallpaper:', err);
    res.status(500).json({ error: 'Database error during update' });
  }
};
