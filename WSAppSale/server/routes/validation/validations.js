const express = require('express');
var db = require('../../sql/validationSQL/validationsSQL');
const app = express();

app.get('/Api/v1/Validation', (req, res) => {
        let Query = 'SS_ValidationInfo';
        let body = req.body;

        params = {
                idValue: body.idValue,
                Value: body.Value
        };

        db.executeSql(Query, params, 'Validation', (Response, err) => {
                if (err) {
                        return res.status(500).json({
                                status: false,
                                response: err
                        });
                };
                if (Response[0]['Response'] == 'Ruc Encontrado') {
                        return res.status(400).json({
                                status: false,
                                response: Response[0]['Response']
                        });
                }
                if (Response[0]['Response'] == 'Usuario encontrado') {
                        return res.status(400).json({
                                status: false,
                                response: Response[0]['Response']
                        });
                }
                res.json({
                        status: true,
                        response: Response[0]['Response']
                });
        });

});

module.exports = app;