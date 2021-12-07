const express = require('express');
const routes = express.Router();

//Petición-GET//
routes.get('/', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Consulta
        conn.query('SELECT * FROM visitante', (err,rows)=>{
            if(err) res.send(err)
            res.json(rows)
        })
    })
})

//Petición-POST//
routes.post('/', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Consulta
        conn.query('INSERT INTO visitante set ?', [req.body], (err,rows)=>{
            if(err) res.send(err)

            res.send('Visitante registrado con exito')
        })
    })
})

//Petición-Delete//
routes.delete('/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Cosulta
        conn.query('DELETE FROM visitante WHERE id = ?', [req.params.id], (err,rows)=>{
            if(err) res.send(err)

            res.send('Visitante Eliminado con exito')
        })
    })
})

//Petición-put//
routes.put('/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) res.send(err)
//Consulta
        conn.query('UPDATE visitante set ? WHERE id = ?', [req.body, req.params.id], (err,rows)=>{
            if(err) res.send(err)

            res.send('Visitante modificado con exito')
            
        })
    })
})

module.exports = routes;