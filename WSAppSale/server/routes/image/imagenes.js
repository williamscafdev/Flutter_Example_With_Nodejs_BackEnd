const express = require('express');
const fs = require('fs');
const path = require('path');

const {verificaToken} = require('../../middlewares/autenticacion');

let app = express();

app.get('/Api/v1/imagen/:tipo/:img',(req,res)=>{
    let tipo = req.params.tipo;
    let img = req.params.img;

    let pathImagen = path.resolve(__dirname, `../../../uploads/${tipo}/${img}`);
    if (pathImagen!=null){
        res.sendFile(pathImagen);
    }else{
        let noImagePath = path.resolve(__dirname,'../../assets/no-imagen.jpg');
        res.sendFile(noImagePath);
    }
    
});
module.exports = app;