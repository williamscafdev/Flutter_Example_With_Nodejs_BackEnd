const express = require('express');
var db = require('../../sql/maintenanceSQL/usuarioSQL');
const bcrypt = require('bcrypt')
const app = express();

app.post('/Api/v1/RegisterUser', (req, res) => {
    let Query = 'SI_User';
    let body = req.body;

    async function hashPassword(password) {
        const salt = await bcrypt.genSalt(10)
        const hash = await bcrypt.hash(password, salt)
        // console.log(hash)   
        params = {
            Name: body.Name,
            LastName: body.LastName,
            BussinesName: body.BussinesName,
            Ruc: body.Ruc,
            Direction: body.Direction,
            City: body.City,
            Country: body.Country,
            Dni: body.Dni,
            Phone: body.Phone,
            TypePersonId: body.TypePersonId,
            User_at: body.User,
            Hash_at: hash
        };

        db.executeSql(Query, params, 'RegisterUser', (hashResponse, err) => {
            if (err) {
                return res.status(500).json({
                    status: false,
                    response: err.message
                });
            };
            if (hashPassword[0]['Error'] == 'Usuario No Existe') {
                return res.status(4300).json({
                    status: false,
                    response: 'Usuario o Contraseña Incorrecto.'
                });
            }
            res.json({
                status: true,
                response: hashResponse.Response
            });
        });
    }

    hashPassword(body.Password);

});

//Configuraciones de Google

module.exports = app;