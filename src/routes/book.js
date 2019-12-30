const { Router } = require('express');
const router = Router();


const { getBook , getBookById, createBook , updateBook, deleteBook} = require('../controllers/book.controller');

router.get('/books', getBook);
router.get('/books/:id',getBookById);
router.post('/books', createBook);
router.put('/books/:id', updateBook);
router.delete('/books/:id',deleteBook);

module.exports = router;