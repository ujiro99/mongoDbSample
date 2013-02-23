model = require "../model"
Post = model.Post


#
# * GET home page.
#
exports.index = (req, res) ->
  Post.find {}, (err, items) ->
    res.render "index",
      title: "Entry List", items: items

#
# * POST
#
exports.form = (req, res) ->
  res.render "form",
    title: "New Entry"


#
# * CREATE
#
exports.create = (req, res) ->
  newPost = new Post(req.body)
  newPost.save (err) ->
    if err
      console.log err
      res.redirect("back")
    else
      res.redirect("/")
