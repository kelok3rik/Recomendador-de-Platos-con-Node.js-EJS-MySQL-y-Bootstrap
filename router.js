const express = require('express');
const router = express.Router();

const conexion = require('./DATABASE/db.js');

    router.get('/',(req,res)=>{
        conexion.query('SELECT * FROM users', (error,results)=>{
            if(error){
                throw error;
            }else{
                res.send(results);
            }
        })
    })

module.exports = router;