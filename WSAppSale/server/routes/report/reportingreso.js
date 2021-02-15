const express = require('express');
const jwt = require('jsonwebtoken');
var db = require('../../sql/report/reportingresoSQL');
var xlsx = require('xlsx');
const { verificaToken, verificaTAdmin_Role } = require('../../middlewares/autenticacion');

const app = express();

app.get('/Api/v1/reportingreso', verificaToken, (req, res) => {
    const query = `SS_REPORTINGRESOSMES`;
    let body = req.query;
    params = {
        fechaini: body.fechaini,
        fechafin: body.fechafin
    };

    db.executeSql(query, params, 'ReportIngresos', (reportingreso, err) => {

        if (err) {
            return res.status(500).json({
                ok: false,
                err: {}
            });
        };

        if (reportingreso.length > 0) {
            var newExcel = reportingreso.map(function (record) {
                return record;
            });
            let nombreArchivo = `ReportIngresos-${new Date().getFullYear()}${new Date().getMonth() + 1}${new Date().getDate()}${new Date().getSeconds()}${new Date().getMilliseconds()}.xlsx`;
            var newWB = xlsx.utils.book_new();
            var newWS = xlsx.utils.json_to_sheet(newExcel);

            xlsx.utils.book_append_sheet(newWB, newWS, "ReportIngresos");
            xlsx.writeFile(newWB, `uploads/reportes/${nombreArchivo}`);

            res.json({
                ok: true,
                report: 'Reporte Generado Reporte-Ingresos',
                excel: `/reportes/${nombreArchivo}`,
            });
        } else {
            res.json({
                ok: true,
                message: 'No se encontraron registros para la consulta realizada.'
            });
        }

    });
}); //Configuraciones de Google

module.exports = app;
