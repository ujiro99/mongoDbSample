// Generated by CoffeeScript 1.4.0
var MONGO_URL, Post, db, mongoose, validator;

MONGO_URL = process.env.MONGOHQ_URL || process.env.MONGOLAB_URL || "mongodb://localhost/mongoDbSample";

mongoose = require("mongoose");

db = mongoose.connect(MONGO_URL);

validator = function(v) {
  return v.length > 0;
};

Post = new mongoose.Schema({
  text: {
    type: String,
    validate: [validator, "Empty Error"]
  },
  created: {
    type: Date,
    "default": Date.now
  }
});

exports.Post = db.model('Post', Post);
