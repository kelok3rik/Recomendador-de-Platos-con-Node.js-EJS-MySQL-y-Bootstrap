// const { json } = require('express');
const express = require('express');
const app = express();

app.set('view engine','ejs');


app.use(express.urlencoded({extended:false}))
app.use(express.json());


app.use('/',require('./router'));


app.listen(5000,()=>{
    console.log("Esta corriendo en puerto 5000 http://localhost:5000");
});