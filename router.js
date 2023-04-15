const express = require('express');
const router = express.Router();

const conexion = require('./DATABASE/db.js');



//ruta para mostrar basico
router.get('/', (req, res) => {
    
            res.render('index');
     
})

//Rutas para mostrar Mantenimientos
//RUTA PARA MOSTRAR EMPLEADOS
router.get('/mantenimientoEmpleado', (req, res) => {
    conexion.query('CALL mostrarEmpleados();', (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('mantenimientoEmpleado', { results: results[0] });
        }
    })
})

//RUTA PARA MOSTRAR MENUS
router.get('/mantenimientoMenu', (req, res) => {
   
    res.render('mantenimientoMenu');
     
})



//RUTA PARA CREAR UN NUEVO EMPLEADO
router.get('/registrarEmpleado', (req, res) => {
    res.render('registrarEmpleado');
})

const crudEmpleado = require('./Controllers/crudEmpleado');
router.post('/registrarEmpleado', crudEmpleado.save);
router.post('/editarEmpleado',crudEmpleado.update);

//RUTA PARA EDITAR UN EMPLEADO
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

//RUTA PARA ELIMINAR UN EMPLEADO (NO FUNCIONA)
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


