const express = require('express');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

var db = require('../sql/loginSQL');

const app = express();

app.post('/Api/v1/login', (req, res) => {
    let body = req.body;
    const query = `SS_LOGIN`;
    params = {
        usuario: body.usuario
    };
    db.executeSql(query, params, 'Login', (hashPassword, err) => {
        if (err) {
            return res.status(500).json({
                status: false,
                response: err.message
            });
        };
        if (hashPassword[0]['Error'] == 'Usuario No Existe') {
            return res.status(400).json({
                status: false,
                response: 'Usuario o Contraseña Icncorrecto.'
            });
        } else {
            
            if (!bcrypt.compareSync(body.password, hashPassword[0]['Hash_at'])) {
                return res.status(400).json({
                    status: false,
                    response: {
                        message: 'Usuario o Contraseña Incorrecto.'
                    }
                });
            }
            let token = jwt.sign({
                mensaje: hashPassword[0]['Hash_Server']
            }, process.env.SEED, {
                expiresIn: 3600
            });
            let expire = 3600;

            var now = new Date();
            res.json({
                status: true,
                token,
                createAt: now,
                expire: parseInt(expire, 10),
            });

        }



    });

});

//Configuraciones de Google

module.exports = app;