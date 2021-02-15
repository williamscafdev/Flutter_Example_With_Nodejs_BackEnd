var sqlDb = require("mssql");
require("../../config/datosGlobales");

exports.executeSql = function (sql,params,proceso,callback) {
    conn.connect()
        .then(function () {
            if(proceso==='RegisterUser'){
                var req = new sqlDb.Request(conn);                
                req.input('Name',params.Name);
                req.input('LastName',params.LastName);
                req.input('BussinesName',params.BussinesName);
                req.input('Ruc',params.Ruc);
                req.input('Direction',params.Direction);
                req.input('City',params.City);
                req.input('Country',params.Country);                
                req.input('Dni',params.Dni);
                req.input('Phone',params.Phone);
                req.input('TypePersonId',params.TypePersonId);
                req.input('User_at',params.User_at);
                req.input('Hash_at',params.Hash_at);
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