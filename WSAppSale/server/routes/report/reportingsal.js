const express = require('express');
const jwt = require('jsonwebtoken');
var db = require('../../sql/report/reportingsalSQL');
var xlsx = require('xlsx');
const { verificaToken, verificaTAdmin_Role } = require('../../middlewares/autenticacion');

const app = express();

app.get('/Api/v1/reportingsal', verificaToken, (req, res) => {
    const query = `SS_REPORTINGSAL`;
    let body = req.query;
    if (
        body.fechaini == undefined
        || body.fechafin == undefined
    ) {
        return res.json({
            ok: false,
            message: 'Debe ingresar los parametros correctos.'
        });
    } else {
        params = {
            fechaini: body.fechaini,
            fechafin: body.fechafin
        };

        db.executeSql(query, params, 'ReportIngSal', (reportingsal, err) => {

            if (err) {
                return res.status(500).json({
                    ok: false,
                    err: {}
                });
            };

            if (reportingsal.length > 0) {
                var newExcel = reportingsal.map(function (record) {
                    return record;
                });
                let nombreArchivo = `ReporteIngSal-${new Date().getFullYear()}${new Date().getMonth() + 1}${new Date().getDate()}${new Date().getSeconds()}${new Date().getMilliseconds()}.xlsx`;
                var newWB = xlsx.utils.book_new();
                var newWS = xlsx.utils.json_to_sheet(newExcel);

                xlsx.utils.book_append_sheet(newWB, newWS, "ReporteMovimiento");
                xlsx.writeFile(newWB, `uploads/reportes/${nombreArchivo}`);

                res.json({
                    ok: true,
                    report: 'Reporte Generado Ingresos/Salidas',
                    excel: `uploads/reportes/${nombreArchivo}`,
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
