items = [
  {"text": "1st Post."},
  {"text": "2nd Post."}
]

#
# * GET home page.
#
exports.index = (req, res) ->
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
  console.log(req.body.text)
  res.redirect("/")
