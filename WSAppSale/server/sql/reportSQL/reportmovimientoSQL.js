var sqlDb = require("mssql");
require("../../config/datosGlobales");
exports.executeSql = function (sql,params,proceso,callback) {
    conn.connect()
        .then(function () {
            if(proceso==='ReportMovimiento'){
                var req = new sqlDb.Request(conn);
                req.input('idsolicitud',params.idsolicitud);
                req.execute(sql).then(function (recordset) {
                    callback(recordset.recordset);
                })
                .catch(function (err) {
                    console.log(err);
                    callback(null, err);
                });
            }
        })
        .catch(function (err) {
            console.log(err);
            callback(null, err);
        });
};