const express = require('express');
const singing = express.Router();

var datos_personal = [];

//Petición-POST//
singing.post('/', (req, res)=>{
    //console.log(req)
    var data=req.body
    let datos_personal={
        email:data.email,
        password:data.password
    };
   // res.send(datos_personal)
    console.log(datos_personal)
  req.getConnection((err, conn)=>{
        if(err) res.send(err)
        conn.query("select * from usuario where email=? and password=?", [datos_personal.email,datos_personal.password],(err,rows)=>{
            if(err) res.send(err);
            res.status(200).json({ error: false, message: "Datos del Usuario", data: rows });
        })
    })
})

module.exports = singing;
