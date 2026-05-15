const express = require("express") // llamamos al modulo de express
const servidor = express() // le paso la config del server a la variable servidor
const path = require("path")
const ruta = path.join(__dirname, "views")

servidor.listen(8080) // el puerto del server
servidor.use(express.static(ruta)) // definimos rutas estaticas
servidor.use(express.json()) // configuramos el server para trabajar con json

servidor.get("/",(req,res) => {
    res.sendFile(path.join(ruta, "/pagina_principal.html"))
})

servidor.get("/login", (req,res) => {
    res.sendFile(path.join(ruta, "/login.html"))
})

servidor.post("/login",(req,res) => {
    console.log(req.body)
    res.send("Credenciales ingresadas")
})

servidor.get("/informatica", (req,res) => {
    res.sendFile(path.join(ruta, "/informatica.html"))
})

servidor.post("/informatica",(req,res) => {
    console.log(req.body)
    res.send("Categoria elegida")
})

servidor.get("/cocina", (req,res) => {
    res.sendFile(path.join(ruta, "/cocina.html"))
})

servidor.post("/cocina",(req,res) => {
    console.log(req.body)
    res.send("Categoria elegida")
})

servidor.get("/muebles", (req,res) => {
    res.sendFile(path.join(ruta, "/muebles.html"))
})

servidor.post("/muebles",(req,res) => {
    console.log(req.body)
    res.send("Categoria elegida")
})

servidor.get("/decorativos", (req,res) => {
    res.sendFile(path.join(ruta, "/decorativos.html"))
})

servidor.post("/decorativos",(req,res) => {
    console.log(req.body)
    res.send("Categoria elegida")
})