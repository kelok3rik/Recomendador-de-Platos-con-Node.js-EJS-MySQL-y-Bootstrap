const conexion = require('../DATABASE/db');

exports.save = (req,res)=>{
    const nombre = req.body.NOMBRE;
    const email = req.body.EMAIL;
    const telefono = req.body.TELEFONO;
    const salario = req.body.SALARIO;
    const puesto = req.body.PUESTO;
    

    conexion.query('CALL insertarEmpleados(?, ?, ?, ?, ?)', [nombre, email, salario, puesto, telefono], (error, result) => {
        if (error) {
          console.log(error);
        } else {
          res.redirect('./mantenimientoEmpleado');
        }
      });
    };

    exports.update = (req, res) => {
        const id_empleado = req.body.ID_EMPLEADO;
        const nombre = req.body.NOMBRE;
        const email = req.body.EMAIL;
        const telefono = req.body.TELEFONO;
        const salario = req.body.SALARIO;
        const puesto = req.body.PUESTO;
      
        conexion.query('CALL modificarEmpleado(?, ?, ?, ?, ?, ?)', [id_empleado, nombre, email, salario, puesto, telefono], (error, result) => {
          if (error) {
            console.log(error);
          } else {
            res.redirect('./mantenimientoEmpleado');
          }
        });
      };