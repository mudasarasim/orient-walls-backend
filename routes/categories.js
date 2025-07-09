const express = require('express');
const router = express.Router();
const {
  getAllCategories,
  createCategory,
  deleteCategory
} = require('../controllers/categoriesController');

// GET all categories
router.get('/', getAllCategories);

// POST create new category
router.post('/', createCategory);

// DELETE category
router.delete('/:id', deleteCategory);

module.exports = router;
