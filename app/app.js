// Generated by CoffeeScript 1.4.0
/*
Module dependencies.
*/

var app, engines, express, http, partials, path, rootDir, routes, user;

express = require("express");

app = express();

engines = require("consolidate");

http = require("http");

path = require("path");

partials = require("express-partials");

routes = require("./routes");

user = require("./routes/user");

rootDir = __dirname.substring(0, __dirname.lastIndexOf("/"));

app.engine('hamlc', engines['haml-coffee']);

app.configure(function() {
  app.set("port", process.env.PORT || 3000);
  app.set("views", rootDir + "/views");
  app.set("view engine", "hamlc");
  app.use(express.favicon());
  app.use(express.logger("dev"));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(partials());
  app.use(app.router);
  app.use(require("stylus").middleware(rootDir + "/public"));
  return app.use(express["static"](path.join(rootDir, "public")));
});

app.configure("development", function() {
  return app.use(express.errorHandler());
});

app.get("/", routes.index);

app.get("/form", routes.form);

app.post("/create", routes.create);

http.createServer(app).listen(app.get("port"), function() {
  return console.log("Express server listening on port " + app.get("port"));
});
