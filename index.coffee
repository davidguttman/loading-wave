raf = require 'raf'
TWOPI = Math.PI * 2

module.exports = -> new Loading arguments...

Loading = (@opts={}) ->
  @el = document.createElement 'div'
  @el.style.border = '1px solid blue'

  {@height, @width} = @opts

  @height ?= 100
  @width ?= 100
  @nBalls ?= 10

  @el.style[k] = v for k, v of {
    position: 'relative'
    width: @width + 'px'
    height: @height + 'px'
  }

  @balls = [1..@nBalls].map (n) =>
    period = 1000/(n+10/2)
    ball = new Ball
      x: n * @width/@nBalls
      y: @height/2
      period: period

  @el.appendChild ball.el for ball in @balls

  @timeStart = Date.now()
  @loop()
  return this

Loading::loop = (a) ->
  elapsed = Date.now() - @timeStart
  # @el.innerHTML = elapsed

  for ball in @balls
    ball.update elapsed

  raf => @loop()

Ball = (@opts={}) ->
  @el = document.createElement 'div'
  {@period, @x, @y, @w, @h} = @opts

  @period ?= 1
  @x ?= 0
  @y ?= 0
  @w ?= 10
  @h ?= 10
  @boxHeight ?= 100
  @color ?= 'black'

  @el.style[k] = v for k, v of {
    position: 'absolute'
    width: @w + 'px'
    height: @h + 'px'
    background: @color
    'border-radius': @w/2 + 'px'
  }
  @setPos @x, @y

  return this

Ball::update = (time) ->
  t = (time/(@period)) / TWOPI

  # console.log period if Math.random() < 0.05
  @y = @boxHeight/2 * Math.sin(t) + @boxHeight/2
  @setPos @x, @y

Ball::setPos = (x, y) ->
  @el.style[k] = v for k, v of {
    left: (@x - @w) + 'px'
    top: (@y - @h/2) + 'px'
  }
