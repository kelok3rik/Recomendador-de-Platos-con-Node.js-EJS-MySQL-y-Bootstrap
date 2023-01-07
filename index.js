const exprress = require('express');
const app = exprress();

app.set('view engine','ejs');

app.use('/',require('./router'));

app.listen(5000,()=>{
    console.log("Esta corriendo en puerto 5000 http://localhost:5000");
});