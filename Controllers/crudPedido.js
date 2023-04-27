const conexion = require('../DATABASE/db');

exports.save = (req, res) => {

    const total_plato = req.body.totalPlato;
    const id_cliente = req.body.idCliente;


    const { detalles } = req.body;
    console.log(req.body);

    // Obtener la fecha actual
    const today = new Date();
    // Convertir la fecha a una cadena con el formato YYYY-MM-DD
    const dateString = today.toISOString().slice(0, 10);
    console.log(dateString);


    const insertPedido = `INSERT INTO pedido (ID_Cliente,Fecha,Total) VALUES ('${id_cliente}','${dateString}','${total_plato}')`;
    conexion.query(insertPedido, (err, result) => {
        if (err) {
            console.log('Error al insertar pedido:', err);
            res.status(500).send('Error al insertar pedido en la base de datos.');
            return;
        }
        const plato_id = result.insertId;
        detalles.forEach(detalle => {
            const { productoID, cantidad, total } = detalle;
            const insertPedidoDetalleQuery = `INSERT INTO detalle_pedido (ID_Pedido, Plato_ID, Cantidad,Precio) VALUES (${plato_id}, ${productoID}, ${cantidad}, '${total}')`;
            conexion.query(insertPedidoDetalleQuery, (err, result) => {
                if (err) {
                    console.log('Error al insertar  en detalle pedido:', err);
                }
            });
        });
        res.status(200).send('Plato registrado exitosamente.');
        return;
    });

};

exports.buscarRecomendacion = (req, res) => {
 
    const id_cliente = req.headers['id_cliente'];
    const id_necesidad = req.headers['id_necesidad'];
  
    new Promise((resolve, reject) => {
      conexion.query('SELECT plato.ID FROM `plato` INNER JOIN detalle_pedido on plato.ID = detalle_pedido.Plato_ID INNER JOIN pedido on pedido.ID = detalle_pedido.ID_Pedido where pedido.ID_Cliente = ?;', [id_cliente], (err, rows) => {
        if (err) {
          console.log('Error al obtener recomendaciones:', err);
          reject('Error al obtener recomendaciones.');
        } else {
          aux = '';
          const rowsaux = [];
          for (i = 0; i < rows.length; i++) {
            if (!rowsaux.includes(rows[i].ID)) {
              rowsaux.push(rows[i].ID);
            }
          }
          
          console.log(rowsaux);
          resolve(rowsaux);
        }
      });
    })
      .then(rowsaux => {
       
        const promesas = rowsaux.map(element => {
          return new Promise((resolve, reject) => {
            conexion.query('CALL recomendacion(?,?)', [element,id_necesidad], (err, rows) => {
              if (err) {
                console.log('Error al obtener recomendaciones:', err);
                reject('Error al obtener recomendaciones.');
              } else {
                resolve(rows);
              }
            });
          });
        });
        //
        Promise.all(promesas)
          .then(data => {
            
            res.json(data);
          })
          .catch(error => {
            
            res.status(500).send(error);
          });
      })
      .catch(error => {
       
        res.status(500).send(error);
      });
  }
  
