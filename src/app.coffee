###
Module dependencies.
###
express     = require("express")
app         = express()
engines     = require("consolidate")
http        = require("http")
path        = require("path")
partials    = require("express-partials")
routes      = require("./routes")
user        = require("./routes/user")

rootDir = __dirname.substring(0, __dirname.lastIndexOf("/"))

# テンプレートエンジンにはhaml-coffeeを使う
app.engine('hamlc', engines['haml-coffee'])

app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", rootDir + "/views"
  app.set "view engine", "hamlc"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use partials()
  app.use app.router
  app.use require("stylus").middleware(rootDir + "/public")
  app.use express.static(path.join(rootDir, "public"))

app.configure "development", ->
  app.use express.errorHandler()

app.get "/", routes.index
app.get "/users", user.list
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

