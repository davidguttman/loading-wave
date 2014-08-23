// document.body.style.background = 'black'

var Wave = require('../index.coffee')

var wave = Wave({
  width: 200,
  height: 200,
  n: 12
})

document.body.appendChild(wave.el)
