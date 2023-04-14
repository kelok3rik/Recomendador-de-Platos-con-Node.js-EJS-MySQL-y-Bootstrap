 const conexion = require('../DATABASE/db.js');


 exports.save = (req,res)=>{
    const {nombre,apellido,correo,telefono} = req.body;
    conexion.query('INSERT INTO Empleados SET ?',[Nombre,Email,Salario,Puesto,Telefono],(error,results,fields)=>{
        if(error){
            throw error;
        }else{
            res.redirect('/');
        }
    })
 }