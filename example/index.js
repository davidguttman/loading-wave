var Wave = require('../index.coffee')

var wave = Wave({
  width: 500,
  height: 100,
  n: 10
})

document.body.appendChild(wave.el)

setTimeout(function() {
  wave.stop()
}, 1000)

setTimeout(function() {
  wave.start()
}, 2000)
