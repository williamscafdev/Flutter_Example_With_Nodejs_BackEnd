



// ==============
// Puerto
//===========
process.env.PORT = process.env.PORT || 3000;


// ==============
// Entorno
//===========
process.env.NODE_ENV = process.env.NODE_ENV || 'dev';
// ==============
// Vencimiento del Token
//===========
//60 segundos
//60 minutos
// 24 horas
// 30 días
process.env.CADUCIDAD_TOKEN = 60 * 60 * 3;
// ==============
// SEED de autenticación
//===========
process.env.SEED = process.env.SEED || 'secret-desarrollo';



//let urlDB;
//if(process.env.NODE_ENV ==='dev'){
 //   urlDB='mongodb://localhost:27017/cafes';
//}else{
  //  urlDB=process.env.MONGO_URI;
//}

let urlDBSQL;
if(process.env.NODE_ENV ==='dev'){
    urlDBSQL="Desarrollo";
}
if(process.env.NODE_ENV ==='devcasa'){
  urlDBSQL="DesaCasa";
}
if(process.env.NODE_ENV ==='pro'){
  urlDBSQL="Produccion";
}



process.env.urlDBSQL = urlDBSQL;
//process.env.URLDB = urlDB;
// ==============
// Google Client ID
//===========
//process.env.CLIENT_ID = process.env.CLIENT_ID || '670979107720-5e6g1vqs6v3gljam660us6aheh6iqieq.apps.googleusercontent.com';


