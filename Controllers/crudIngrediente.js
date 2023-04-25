const conexion = require('../DATABASE/db');

exports.save = (req, res) => {
  const nombre = req.body.NOMBRE;
  const descripcion = req.body.DESCRIPCION;
  console.log(req.body);



  conexion.query('CALL insertarIngrediente(?,?)', [nombre, descripcion], (error, result) => {
    if (error) {
      console.log(error);
    } else {
      res.redirect('./mantenimientoIngredientes');
    }
  });
};

exports.update = (req, res) => {
  const id_ingrediente = req.body.id_ingredientes;
  const nombre = req.body.NOMBRE;
  const descripcion = req.body.DESCRIPCION;

  conexion.query('CALL modificarIngredientes(?, ?, ?)', [id_ingrediente, nombre, descripcion], (error, result) => {
    if (error) {
      console.log(error);
    } else {
      res.redirect('./mantenimientoIngredientes');
    }
  });
};