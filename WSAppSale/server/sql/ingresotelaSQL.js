var sqlDb = require("mssql");
require("../config/datosGlobales");
exports.executeSql = function (sql,params,proceso,callback) {
    conn.connect()
        .then(function () {
            if(proceso==='IngresoTela'){                
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
            if(proceso==='IngresoTelaInsert'){
                var req = new sqlDb.Request(conn);
                req.input('id',params.id);
                req.input('idsolicitud',params.idsolicitud);
                req.input('movidentificador',params.movidentificador);
                req.input('partida',params.partida);
                req.input('descripcion',params.descripcion);
                req.input('color',params.color);
                req.input('estilo',params.estilo);
                req.input('fecha',params.fecha);
                req.input('rollo',params.rollo);
                req.input('kgdocum',params.kgdocum);
                req.input('kgfisico',params.kgfisico);                
                req.input('estado',params.estado);
                req.input('usercreate_at',params.usercreate_at);
                req.input('userupdate_at',params.userupdate_at);
                req.execute(sql).then(function (recordset) {
                    callback(recordset.recordset);
                })
                .catch(function (err) {
                    console.log(err);
                    callback(null, err);
                });
            }
            if(proceso==='IngresoTelaUpdate'){
                var req = new sqlDb.Request(conn);
                req.input('id',params.id);
                req.input('idsolicitud',params.idsolicitud);
                req.input('movidentificador',params.movidentificador);
                req.input('partida',params.partida);
                req.input('descripcion',params.descripcion);
                req.input('color',params.color);
                req.input('estilo',params.estilo);
                req.input('fecha',params.fecha);
                req.input('rollo',params.rollo);
                req.input('kgdocum',params.kgdocum);
                req.input('kgfisico',params.kgfisico);                
                req.input('estado',params.estado);
                req.input('usercreate_at',params.usercreate_at);
                req.input('userupdate_at',params.userupdate_at);
                req.execute(sql).then(function (recordset) {
                    callback(recordset.recordset);
                })
                .catch(function (err) {
                    console.log(err);
                    callback(null, err);
                });
            }
            if(proceso==='IngresoTelaDelete'){
                var req = new sqlDb.Request(conn);
                req.input('id',params.id);
                req.input('userdelete_at',params.userdelete_at);
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