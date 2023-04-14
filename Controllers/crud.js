const conexion = require('../DATABASE/db');

exports.save = (req,res)=>{
    const nombre = req.body.NOMBRE;
    const email = req.body.EMAIL;
    const telefono = req.body.TELEFONO;
    const salario = req.body.SALARIO;
    const puesto = req.body.PUESTO;
    

    conexion.query("INSERT INTO EMPLEADOS SET ?",{nombre:nombre,email:email,telefono:telefono,salario:salario,puesto:puesto},(error,result)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('./');
        }
    });
}

exports.update = (req,res)=>{
    const ID_EMPLEADO = req.body.ID_EMPLEADO;
    const nombre = req.body.NOMBRE;
    const email = req.body.EMAIL;
    const telefono = req.body.TELEFONO;
    const salario = req.body.SALARIO;
    const puesto = req.body.PUESTO;
    conexion.query("UPDATE EMPLEADOS SET ? WHERE ID_EMPLEADO = ?",[{nombre:nombre,email:email,telefono:telefono,salario:salario,puesto:puesto},ID_EMPLEADO,],(error,result)=>{
        if(error){
            console.log(error);
        }else{
            res.redirect('./mantenimientoEmpleado');
        }
    });

}