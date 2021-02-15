const express = require('express');
const jwt = require('jsonwebtoken');
var db = require('../../sql/report/reportmovimientoSQL');
var xlsx = require('xlsx');
const { verificaToken, verificaTAdmin_Role } = require('../../middlewares/autenticacion');

const app = express();

app.post('/Api/v1/reportmovimiento', verificaToken, (req, res) => {
    const query = `SS_REPORTMOVIMIENTO`;
    let body = req.body;
    if (body.idsolicitud == undefined
    ) {
        return res.json({
            ok: false,
            message: 'Debe ingresar los parametros correctos.'
        });
    } else {
        params = {
            idsolicitud: body.idsolicitud
        };

        db.executeSql(query, params, 'ReportMovimiento', (reportmovimiento, err) => {

            if (err) {
                return res.status(500).json({
                    ok: false,
                    err: {}
                });
            };

            if (reportmovimiento.length > 0) {
                var newExcel = reportmovimiento.map(function (record) {
                    return record;
                });
                let nombreArchivo = `ReporteMov-${new Date().getFullYear()}${new Date().getMonth() + 1}${new Date().getDate()}${new Date().getSeconds()}${new Date().getMilliseconds()}.xlsx`;
                var newWB = xlsx.utils.book_new();
                var newWS = xlsx.utils.json_to_sheet(newExcel);

                xlsx.utils.book_append_sheet(newWB, newWS, "ReporteMovimiento");
                xlsx.writeFile(newWB, `uploads/reportes/${nombreArchivo}`);

                res.json({
                    ok: true,
                    report: 'Reporte Generado General',
                    excel: `/reportes/${nombreArchivo}`,
                });
            } else {
                res.json({
                    ok: true,
                    message: 'No se encontraron registros para la consulta realizada.'
                });
            }
        });
    }
});
//Configuraciones de Google
module.exports = app;
