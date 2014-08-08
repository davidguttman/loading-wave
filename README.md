# Loading Wave

A simple [wave pendulum](https://www.youtube.com/watch?v=yVkdfJ9PkRQ)-like loading animation.

```js
var Wave = require('loading-wave')

var wave = Wave({
  width: 500,
  height: 100,
  n: 10,
  color: 'steelblue'
})

document.body.appendChild(wave.el)

setTimeout(function() {
  wave.stop()
}, 1000)

setTimeout(function() {
  wave.start()
}, 2000)

```

# API

```js
var Wave = require('loading-wave')
```

## Wave(options)

Constructs and returns a LoadingWave object. Available options:

* width/height: width/height of animation in pixels
* n: number of items in the animation
* color: color of items

## wave.stop()

Stops the animation. Do this before you hide / remove the animation so that it stops looping.

## wave.start()

Starts the animation again. Use this if you want to keep one instance around but need to hide it temporarily.

# License

MIT
