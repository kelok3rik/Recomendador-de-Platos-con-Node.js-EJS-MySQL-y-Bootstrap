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
router.post('/editarEmpleado', crudEmpleado.update);

//RUTA PARA EDITAR UN EMPLEADO
router.get('/editarEmpleado/:ID_EMPLEADO', (req, res) => {
    const id = req.params.ID_EMPLEADO;
    conexion.query("SELECT * FROM Empleado where ID_EMPLEADO=?", [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('editarEmpleado', { user: results[0] });
        }
    })
})

//RUTA PARA ELIMINAR UN EMPLEADO (NO FUNCIONA)
router.get('/delete/:ID_EMPLEADOS', (req, res) => {
    const id = req.params.id;
    conexion.query('DELETE FROM Empleado where id=?', [id], (error, resuts) => {
        if (error) {
            throw error;
        } else {
            res.redirect('/mantenimientoEmpleado');
        }
    })
})


//Rutas para ordenar
//RUTA PARA ordenar
router.get('/ordenar', (req, res) => {
    res.render('ordenar');
})

////// PUNTO PRUEBASSSSS ////// 


const mysql2 = require('mysql2/promise');



router.get('/search', async (req, res) => {
    const q = req.query.q;

    // Conexión a la base de datos
    const connection = await mysql2.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'rest'
    });

    // Consulta los datos de la tabla
    const [rows, fields] = await connection.execute('SELECT * FROM empleado WHERE nombre LIKE ?', [`%${q}%`]);

    // Devuelve los resultados en formato JSON
    res.json(rows);
});

module.exports = router;


