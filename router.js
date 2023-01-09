const express = require('express');
const router = express.Router();

const conexion = require('./DATABASE/db.js');

router.get('/', (req, res) => {
    conexion.query('SELECT * FROM users', (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('index', { results: results });
        }
    })
})


//RUTA PARA CREAR
router.get('/create', (req, res) => {
    res.render('create');
})

const crud = require('./Controllers/crud');
router.post('/guardarUsuario', crud.save);
router.post('/actualizarUsuario',crud.update);

//RUTA PARA EDITAR
router.get('/edit/:id', (req, res) => {
    const id = req.params.id;
    conexion.query("SELECT * FROM users where id=?", [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('edit', { user: results[0] });
        }
    })
})

//RUTA PARA ELIMINAR
router.get('/delete/:id', (req,res)=>{
    const id = req.params.id;
    conexion.query('DELETE FROM users where id=?',[id],(error,resuts)=>{
        if (error) {
            throw error;
        } else {
            res.redirect('/');
        }
    })
})

module.exports = router;


