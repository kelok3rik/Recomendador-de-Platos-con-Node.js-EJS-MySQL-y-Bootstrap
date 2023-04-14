const express = require('express');
const router = express.Router();

const conexion = require('./DATABASE/db.js');

router.get('/', (req, res) => {
    conexion.query('CALL mostrarEmpleados();', (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('index', { results: results[0] });
        }
    })
})

router.get('/mantenimientoEmpleado', (req, res) => {
    conexion.query('CALL mostrarEmpleados();', (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('mantenimientoEmpleado', { results: results[0] });
        }
    })
})



//RUTA PARA CREAR
router.get('/registrarEmpleado', (req, res) => {
    res.render('registrarEmpleado');
})

const crud = require('./Controllers/crud');
router.post('/registrarEmpleado', crud.save);
router.post('/editarEmpleado',crud.update);

//RUTA PARA EDITAR
router.get('/editarEmpleado/:ID_EMPLEADO', (req, res) => {
    const id = req.params.ID_EMPLEADO;
    conexion.query("SELECT * FROM Empleados where ID_EMPLEADO=?", [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('editarEmpleado', { user: results[0] });
        }
    })
})

//RUTA PARA ELIMINAR
router.get('/delete/:ID_EMPLEADOS', (req,res)=>{
    const id = req.params.id;
    conexion.query('DELETE FROM Empleados where id=?',[id],(error,resuts)=>{
        if (error) {
            throw error;
        } else {
            res.redirect('/mantenimientoEmpleado');
        }
    })
})

module.exports = router;


