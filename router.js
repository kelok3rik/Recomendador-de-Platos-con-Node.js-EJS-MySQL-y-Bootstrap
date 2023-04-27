const express = require('express');
const router = express.Router();

const conexion = require('./DATABASE/db.js');



//ruta para mostrar basico
router.get('/', (req, res) => {

    res.render('index');

})



//RUTA PARA MOSTRAR MENUS
router.get('/mantenimientoMenu', (req, res) => {


    res.render('mantenimientoMenu');


})



//Rutas para mostrar Mantenimientos /////////////////////////
//CATEGORIAS
//RUTA PARA MOSTRAR CATEGORIAS
router.get('/mantenimientoCategoria', (req, res) => {
    conexion.query('CALL mostrarCategoria();', (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('mantenimientoCategoria', { results: results[0] });
        }
    })
})

const crudCategoria = require('./Controllers/crudCategoria');
router.post('/registrarCategoria', crudCategoria.save);
router.post('/editarCategoria', crudCategoria.update);

//RUTA PARA CREAR UNa CATEGORIA

router.get('/registrarCategoria', (req, res) => {
    res.render('registrarCategoria');
})


//RUTA PARA EDITAR UNA CATEGORIA
router.get('/editarCategoria/:ID', (req, res) => {
    const id = req.params.ID;
    conexion.query("SELECT * FROM categoria_plato where ID=?", [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('editarCategoria', { results: results[0] });
        }
    })
})

//EMPLEADOS
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

const crudEmpleado = require('./Controllers/crudEmpleado');
router.post('/registrarEmpleado', crudEmpleado.save);
router.post('/editarEmpleado', crudEmpleado.update);

//RUTA PARA CREAR UN EMPLEADO

router.get('/registrarEmpleado', (req, res) => {
    res.render('registrarEmpleado');
})

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

//INGREDIENTES
//RUTA PARA MOSTRAR INGREDIENTES
router.get('/mantenimientoIngredientes', (req, res) => {
    conexion.query('CALL mostrarIngredientes();', (error, results) => {
        if (error) {
            throw error;
        } else {
            console.log(results);
            
             res.render('mantenimientoIngredientes', { results: results[0] });
        }
    })
})

const crudIngrediente = require('./Controllers/crudIngrediente');
router.post('/registrarIngredientes', crudIngrediente.save);
router.post('/editarIngredientes', crudIngrediente.update);

//RUTA PARA CREAR UN INGREDIENTE

router.get('/registrarIngredientes', (req, res) => {
    res.render('registrarIngredientes');
})

//RUTA PARA EDITAR INGREDIENTE
router.get('/editarIngredientes/:ID', (req, res) => {
    const id = req.params.ID;
    conexion.query("SELECT * FROM ingrediente where ID=?", [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('editarIngredientes', { results: results[0] });
        }
    })
})

//PLATOS
//RUTA PARA PLATOS
router.get('/mantenimientoPlatos', (req, res) => {
    conexion.query('CALL mostrarPlatos()', (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('mantenimientoPlatos', { results: results[0] });
        }
    })
})

const crudPlatos = require('./Controllers/crudPlatos');
router.post('/savePlatos', crudPlatos.save);
router.post('/editarPlatos', crudPlatos.update);

//RUTA PARA CREAR UN PLATO

router.get('/registrarPlato', (req, res) => {
    // Consulta para obtener las categorías de platos
    conexion.query('SELECT * FROM categoria_plato', (error, results) => {
        if (error) {
            throw error;
        } else {
            // Consulta para obtener los ingredientes
            conexion.query('SELECT * FROM ingrediente', (error, ingredientes) => {
                if (error) {
                    throw error;
                } else {
                    // console.log(results);
                    // console.log(ingredientes);
                    // Enviamos los resultados de ambas consultas a la vista
                    res.render('registrarPlato', { results: results, ingredientes: ingredientes });
                }
            });
        }
    });
});





//RUTA PARA EDITAR PLATO
// router.get('/editarIngredientes/:ID', (req, res) => {
//     const id = req.params.ID;
//     conexion.query("SELECT * FROM ingrediente where ID=?", [id], (error, results) => {
//         if (error) {
//             throw error;
//         } else {
//             res.render('editarIngredientes', { results: results[0] });
//         }
//     })
// })




+
    //PROCESOS ////////////////////////// AAAAAAAAAAAAAAAAAAA/////////////////////////
    //RUTA PARA ordenar

    router.get('/ordenar', (req, res) => {
        // Consulta para obtener las categorías de platos
        conexion.query('SELECT * FROM plato', (error, results) => {
            if (error) {
                throw error;
            } else {
                conexion.query('SELECT * FROM clientes', (error, clientes) => {
                    if (error) {
                        throw error;
                    } else {
                            conexion.query('SELECT * FROM necesidad', (error, necesidad) => {
                                if (error) {
                                    throw error;
                                } else {
                                    // console.log(results);
                                    // console.log(ingredientes);
                                    // Enviamos los resultados de ambas consultas a la vista
                                     res.render('ordenar', { results: results, clientes: clientes, necesidad: necesidad });
                                    
                                }
                            });
            
            
                        
                    }
                });


            }
        });

    });

const crudPedido = require('./Controllers/crudPedido');
router.post('/savePedido', crudPedido.save);
router.get('/recomendacion', crudPedido.buscarRecomendacion);



module.exports = router;
