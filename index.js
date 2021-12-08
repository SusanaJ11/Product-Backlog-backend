const express = require('express')
const mysql = require('mysql')
const myconn = require('express-myconnection')
const Visitante = require("./rutas")
const singIn=require("./login.js")
//Instanciamos el express
const app = express()

// Puerto donde nos vamos a conectar
app.set('port', process.env.PORT || 3000)
dbOption = {
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '',
  database: 'fraccionariacontrol'

}
//middlewares//
app.use(myconn(mysql, dbOption, 'single'))
app.use(express.json())

//Visitante//
app.get('/', (req,res)=>{
    res.send("My api-Rest con node.js")
})
app.use('/api/v1/visitante', Visitante)
app.use('/api/v1/Iniciar-Sesion', singIn)

//Server running//
app.listen(app.get('port'), ()=>{
    console.log("Server running on port", app.get('port'))
})
