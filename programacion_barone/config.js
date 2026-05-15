const express = require("express")
const servidor = express()
const path = require("path")
const ruta = path.join(__dirname, "views")
const router = express.Router()

servidor.listen(4000)
servidor.use(express.static(ruta))
servidor.use(express.json())
servidor.set("view engine", "hbs")
servidor.use(router)

module.exports = {
    router,
    ruta,
    path,
    servidor
}