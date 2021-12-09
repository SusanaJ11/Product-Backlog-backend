const express = require('express');
const user = express.Router();

//Petición-GET//
user.get('/', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Consulta
        conn.query('SELECT * FROM usuario', (err,rows)=>{
            if(err) res.send(err)
            res.json(rows)
        }) 
    })
})

//Petición-POST//
user.post('/', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Consulta
        conn.query('INSERT INTO usuario set ?', [req.body], (err,rows)=>{
            if(err) res.send(err)

            res.send('usuario registrado con exito')
        })
    })
})

//Petición-Delete//
user.delete('/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Cosulta
        conn.query('DELETE FROM usuario WHERE id = ?', [req.params.id], (err,rows)=>{
            if(err) res.send(err)

            res.send('usuario Eliminado con exito')
        })
    })
})

//Petición-put//
user.put('/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Consulta
        conn.query('UPDATE usuario set ? WHERE id = ?', [req.body, req.params.id], (err,rows)=>{
            if(err) res.send(err)

            res.send('usuario modificado con exito')
            
        })
    })
})

module.exports = user;