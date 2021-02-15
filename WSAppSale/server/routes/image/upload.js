const express = require('express');
const fileUpload = require('express-fileupload');
const app = express();

const fs = require('fs');
const path = require('path');
const { verificaToken, verificaTAdmin_Role } = require('../../middlewares/autenticacion');

app.use(fileUpload({ useTempFiles: true }));

app.post('/Api/v1/upload', verificaToken, function (req, res) {

    let tipo = req.body.tipo;
    let id = req.body.id;

    if (!req.files) {
        return res.status(400).json({
            ok: false,
            err: {
                message: 'No se ha seleccionado ningún archivo'
            }
        });
    }
    //Validar Tipo
    let tiposValidos = ['productos', 'usuarios', 'hojaconsumo', 'hojaconstruccion', 'hojamedida', 'tizadotela','cartasesion'];
    if (tiposValidos.indexOf(tipo) < 0) {
        return res.status(400).json({
            ok: false,
            err: {
                message: 'Los tipos validos son ' + tiposValidos.join(', ')
                //ext: extension
            }
        })

    }
    let archivo = req.files.archivo;
    let nombreCortado = archivo.name.split('.');
    let extension = nombreCortado[nombreCortado.length - 1];

    //Extensiones permitidas
    let extensionesValidas = ['png', 'jpg', 'gif', 'jpeg', 'pdf', 'xlsx', 'xlxs', 'xls'];
    if (extensionesValidas.indexOf(extension) < 0) {
        return res.status(400).json({
            ok: false,
            err: {
                message: 'Las extensiones permitidas son ' + extensionesValidas.join(', '),
                ext: extension
            }
        })
    }

    //Cambiar nombre al archivo
    let nombreArchivo = `${nombreCortado[0]}-${new Date().getFullYear()}${new Date().getMonth() + 1}${new Date().getDate()}${new Date().getSeconds()}${new Date().getMilliseconds()}.${extension}`;

    archivo.mv(`uploads/${tipo}/${nombreArchivo}`, (err) => {
        if (err)
            return res.status(500).json({
                ok: false,
                err
            });
        //Aqui , imagen cargada
        if (tipo === 'usuarios') {
            //imagenUsuario(id, res, nombreArchivo);
            return res.json({
                ok: true,
                producto: 'productoGuardado',
                img: `/${tipo}/${nombreArchivo}`
            });

        }
        if (tipo === 'hojaconsumo') {
            //imagenUsuario(id, res, nombreArchivo);
            return res.json({
                ok: true,
                hojaconsumo: 'Hoja consumo Guardado',
                img: `/${tipo}/${nombreArchivo}`
            });
        }
        if (tipo === 'hojamedida') {
            //imagenUsuario(id, res, nombreArchivo);
            return res.json({
                ok: true,
                hojamedida: 'Hoja medida Guardado',
                img: `/${tipo}/${nombreArchivo}`
            });
        }
        if (tipo === 'tizadotela') {
            //imagenUsuario(id, res, nombreArchivo);
            return res.json({
                ok: true,
                tizadotela: 'Tizado Tela Guardado',
                img: `/${tipo}/${nombreArchivo}`
            });
        }
        if (tipo === 'hojaconstruccion') {
            //imagenUsuario(id, res, nombreArchivo);
            return res.json({
                ok: true,
                hojaconstruccion: 'hojaconstruccion Guardado',
                img: `/${tipo}/${nombreArchivo}`
            });
        }
        if (tipo === 'cartasesion') {
            //imagenUsuario(id, res, nombreArchivo);
            return res.json({
                ok: true,
                cartasesion: 'cartasesion Guardado',
                img: `/${tipo}/${nombreArchivo}`
            });
        }
    });

});

function borraArchivo(nombreImagen, tipo) {
    let pathUrl = path.resolve(__dirname, `../../uploads/${tipo}/${nombreImagen}`);

    if (fs.existsSync(pathUrl)) {
        fs.unlinkSync(pathUrl);
    }
}

module.exports = app;