var sqlDb = require("mssql");
require("../../config/datosGlobales");

exports.executeSql = function (sql,params,proceso,callback) {
    conn.connect()
        .then(function () {
            if(proceso==='Validation'){
                var req = new sqlDb.Request(conn);
                req.input('idValue',params.idValue);
                req.input('value',params.Value);
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