spawn = require('child_process').spawn
task 'watch', ->
  watch = spawn('coffee', ['-wbco', './app', './src'])

  watch.stdout.on 'data', (buffer)->
    if(buffer)
      console.log buffer.toString().trim()

  watch.stderr.on 'data', (buffer)->
    if(buffer)
      console.log buffer.toString().trim()
