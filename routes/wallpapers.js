const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const {
  getWallpapers,
  addWallpaper,
  deleteWallpaper,
  updateWallpaper
} = require('../controllers/wallpapersController');

// Multer setup
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/'),
  filename: (req, file, cb) => cb(null, Date.now() + '-' + file.originalname)
});
const upload = multer({ storage });

// Accept up to 4 image fields
const uploadFields = upload.fields([
  { name: 'image', maxCount: 1 },
  { name: 'image2', maxCount: 1 },
  { name: 'image3', maxCount: 1 },
  { name: 'image4', maxCount: 1 },
]);

// GET all wallpapers
router.get('/', getWallpapers);

// POST new wallpaper
router.post('/', uploadFields, addWallpaper);

// PUT update wallpaper
router.put('/:id', uploadFields, updateWallpaper);

// DELETE wallpaper
router.delete('/:id', deleteWallpaper);

module.exports = router;
