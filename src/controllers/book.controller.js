const postgres = require("../config/db.config");
const io = require('../socket');

const getBook = async (req, res) => {
    const response =  await postgres.query('SELECT * FROM book ORDER BY id ASC');
 //    res.status(200).json(response.rows);
 //    console.log(response.rows);
       res.status(200).json({
           result: true,
           statusCode:200,
           message: 'get user sucessfully',
           body:{
               book: response.rows
           }
       })
 };

const getBookById = async (req, res) => {
    const id = req.params.id;
    const response = await postgres.query('SELECT * FROM book WHERE id = $1' , [id]);
    res.json({
        result : true,
        statusCode : 200,
        body:{
            book: response.rows
        }
    })
}

const createBook = async (req, res) => {
    try {
        const { name , author } = req.body;
        const response = await postgres.query('INSERT INTO book (name , author) VALUES ($1,$2)', [name ,author]);
        io.getIO().emit('posts' ,  {  action: 'create'})
        res.json({
            result: true,
            statusCode:201,
            message : 'Book was create successfully',
            body: {
                book : {name , author}
            }
        })
    } catch(error){
        res.json({
            result: false,
            statusCode: 404,
            message: `Notification can not add`
        })
    }
}

const updateBook = async (req, res) => {
    try{
      const id = req.params.id;
      const { name , author } = req.body;
      io.getIO().emit('posts' ,  {  action: 'create'})
      const response = await postgres.query('UPDATE book SET name = $1 , author = $2 WHERE id = $3' , [
          name , author, id
      ]);
      res.json({
          result: true,
          statusCode: 200,
          message: `Book was update successfully`,
          body: {
              book : { name , author }
          }
      })
    } catch(error){
        res.json({
            result: false,
            statusCode: 404,
            message: 'Book can not update'
        })
    }

}

const deleteBook = async (req, res) => {
    try{
       const id = req.params.id;
       const response = await postgres.query('DELETE FROM book WHERE id = $1', [id]);
       res.json({
        result: true,
        statusCode: 200,
        message: `book ${id} was deleted sucessfully.`
    })
    } catch(error){
        res.json({
            result : false,
            statusCode : 404,
            message: 'Book can not delete'
        })
    }
}

 module.exports = {
    getBook,
    getBookById,
    createBook,
    updateBook,
    deleteBook
 }