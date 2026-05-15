const { router, ruta, path } = require("./config.js")
const { usuarios } = require("./bd.js")

router.get("/", (req, res) => {
    res.render("index.hbs", {usuarios})
})