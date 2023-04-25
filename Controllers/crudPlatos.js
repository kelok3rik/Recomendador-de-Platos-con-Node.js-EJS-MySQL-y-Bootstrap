const conexion = require('../DATABASE/db');

exports.save = (req, res) => {

  const plato_nombre = req.body.nombrePlato;
  const plato_precio = req.body.precioPlato;
  const plato_descripcion = req.body.descripcionPlato;
  const plato_categoria = req.body.categoriaPlato;

  const { ingredientes } = req.body;
  console.log(req.body);


  const insertPlatoQuery = `INSERT INTO plato (Nombre,Descripcion,Precio,ID_CATEGORIA_PLATO) VALUES ('${plato_nombre}','${plato_descripcion}','${plato_precio}','${plato_categoria}')`;
  conexion.query(insertPlatoQuery, (err, result) => {
    if (err) {
      console.log('Error al insertar plato:', err);
      res.status(500).send('Error al insertar plato en la base de datos.');
      return;
    }
    const plato_id = result.insertId;
    ingredientes.forEach(ingrediente => {
      const { nombre, cantidad, medida, prioridad } = ingrediente;
      const insertPlatoIngredienteQuery = `INSERT INTO plato_ingrediente (Plato_ID, Ingrediente_ID, Cantidad, Unidad, Prioridad) VALUES (${plato_id}, ${nombre}, ${cantidad}, '${medida}', ${prioridad})`;
      conexion.query(insertPlatoIngredienteQuery, (err, result) => {
        if (err) {
          console.log('Error al insertar ingrediente en plato:', err);
        }
      });
    });
    res.status(200).send('Plato registrado exitosamente.');
    return;
  });








  //PARA LA TABLA PLATO_INGREDIENTE

  // obtener los datos de la tabla de ingredientes




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