const conexion = require('../DATABASE/db');

exports.save = (req, res) => {

  // PARA LA TABLA PLATO
  const nombre = req.body.NOMBRE;
  const precio = req.body.PRECIO;
  const descripcion = req.body.DESCRIPCION;
  const categoria = req.body.CATEGORIA;


  


  console.log(nombre,precio,descripcion,categoria);


  //PARA LA TABLA PLATO_INGREDIENTE

  // obtener los datos de la tabla de ingredientes
  

   console.log(ingredientes);

  // conexion.query('INSERT INTO plato (nombre, precio, descripcion, id_categoria_plato) VALUES (?, ?, ?, ?)', [nombre, precio, descripcion, categoria], (error, result) => {
  //   if (error) {
  //     console.log(error);
  //   } else {

  //     // obtener el id del plato que se acaba de insertar
  //     var id_plato = result.insertId;


  //     // recorrer cada fila de la tabla de ingredientes y ejecutar una consulta de inserción para cada una
  //     for (var i = 0; i < ingredientes.length; i++) {
  //       var ingrediente_id = ingredientes[i].ID;
  //       var cantidad = ingredientes[i].CANTIDAD;
  //       var medida = ingredientes[i].MEDIDA;
  //       var prioridad = ingredientes[i].PRIORIDAD;

  //       // insertar los ingredientes en la tabla plato_ingrediente
        
  //         conexion.query('INSERT INTO plato_ingrediente (id_plato, id_ingrediente) VALUES (?, ?)', [id_plato, ingredientes[i]], (error, result) => {
  //           if (error) {
  //             console.log(error);
  //           } else {
  //             console.log('Se insertó correctamente');
  //           }
  //         });
  //       }
  //       res.redirect('./mantenimientoIngredientes');
  //     }
  //   });


};

exports.update = (req, res) => {
  // const id_ingrediente = req.body.id_ingredientes;
  // const nombre = req.body.NOMBRE;
  // const descripcion = req.body.DESCRIPCION;

  // conexion.query('CALL modificarIngredientes(?, ?, ?)', [id_ingrediente, nombre,descripcion], (error, result) => {
  //   if (error) {
  //     console.log(error);
  //   } else {
  //     res.redirect('./mantenimientoIngredientes');
  //   }
  // });
};