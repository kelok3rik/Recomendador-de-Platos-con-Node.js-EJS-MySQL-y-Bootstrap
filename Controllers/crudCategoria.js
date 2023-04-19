const conexion = require('../DATABASE/db');

exports.save = (req,res)=>{
    const nombre = req.body.NOMBRE;
   
    

    conexion.query('CALL insertarCategoria(?)', [nombre], (error, result) => {
        if (error) {
          console.log(error);
        } else {
          res.redirect('./mantenimientoCategoria');
        }
      });
    };

    exports.update = (req, res) => {
        const id_categoria = req.body.id_categoria;
        const nombre = req.body.NOMBRE;
        
      
        conexion.query('CALL modificarCategoria(?, ?)', [id_categoria, nombre], (error, result) => {
          if (error) {
            console.log(error);
          } else {
            res.redirect('./mantenimientoCategoria');
          }
        });
      };