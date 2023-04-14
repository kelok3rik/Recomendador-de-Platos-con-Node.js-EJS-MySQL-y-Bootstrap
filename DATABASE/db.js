const mysql = require('mysql');

const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'rest'

})

conexion.connect((error)=>{
    if(error){
        console.error('El error de la conexion es: '+error);
        return
    }
    console.log("Conectado a la BD!");
})

module.exports = conexion;