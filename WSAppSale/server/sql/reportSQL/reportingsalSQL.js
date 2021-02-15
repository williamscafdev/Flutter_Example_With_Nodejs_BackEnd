var sqlDb = require("mssql");
require("../../config/datosGlobales");
exports.executeSql = function (sql,params,proceso,callback) {
    conn.connect()
        .then(function () {
            if(proceso==='ReportIngSal'){
                var req = new sqlDb.Request(conn);
                req.input('fechaini',params.fechaini);
                req.input('fechafin',params.fechafin);
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