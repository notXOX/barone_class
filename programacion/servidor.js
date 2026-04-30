const express = require("express")
const servidor = express()
const path = require("path")
const ruta = path.join(__dirname, "frontend")

servidor.listen(8080)
servidor.use(express.static(ruta))
servidor.use(express.json())

servidor.get("/",(req,res) => {
    res.send("Pagina principal")
})
servidor.post("/login",(req,res) => {
    console.log(req.body)
    res.send("Pagina de login")
})