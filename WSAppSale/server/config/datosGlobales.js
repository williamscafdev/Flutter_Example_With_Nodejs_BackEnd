var sqlDb = require("mssql");
require('./config');

if (process.env.urlDBSQL === 'Desarrollo') {
    conn = new sqlDb.ConnectionPool({
        user: 'sa',
        password: '123456',
        server: 'DESKTOP-4BBD76N',//NameServer
        database: 'BDPRUEBA',
        options: {
            enableArithAbort: true,
        }
    });

}

if (process.env.urlDBSQL === 'DesaCasa') {
    conn = new sqlDb.ConnectionPool({
        user: 'sa',
        password: '123456',
        server: '156156156',
        database: 'BDPRUEBA',
        options: {
            enableArithAbort: true
        }
    });

}

if (process.env.urlDBSQL === 'Produccion') {
    conn = new sqlDb.ConnectionPool({
        user: 'sa',
        password: '123456',
        server: '156156156',
        database: 'BDPRUEBA',
        options: {
            enableArithAbort: true
        }
    });

}