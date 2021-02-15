const express = require('express');
const app = express();


app.use(require('./login.js'));
app.use(require('./maintenance/usuario.js'));
app.use(require('./validation/validations.js'));
app.use(require('./facturaelectronica/factura.js'));

module.exports = app;

