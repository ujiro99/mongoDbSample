MONGO_URL = process.env.MONGOHQ_URL

mongoose = require "mongoose"
db = mongoose.connect "MONGO_URL"

validator = (v) ->
  return v.length > 0

Post = new mongoose.Schema({
  text    : { type: String, validate: [validator, "Empty Error"]},
  created : { type: Date, default: Date.now}
})

exports.Post = db.model('Post', Post)
