raf = require 'raf'
TWOPI = Math.PI * 2

module.exports = -> new Wave arguments...

Wave = (@opts={}) ->
  @el = document.createElement 'div'

  {@height, @width, @color, @n} = @opts

  @height ?= 100
  @width ?= 100
  @n ?= 10
  @color ?= 'steelblue'

  @el.style[k] = v for k, v of {
    position: 'relative'
    width: @width + 'px'
    height: @height + 'px'
  }

  @bars = [1..@n].map (n) =>
    period = 750/(n+10/2)
    bar = new Bar
      x: n * @width/@n
      y: @height/2
      w: @width/@n - 2
      boxHeight: @height
      color: @color
      period: period

  @el.appendChild bar.el for bar in @bars

  @timeStart = Date.now()
  @loop()
  return this

Wave::loop = ->
  return if @stopped
  elapsed = Date.now() - @timeStart

  for bar in @bars
    bar.update elapsed

  raf => @loop()

Wave::start = ->
  if @stopped
    @stopped = false
    @loop()

Wave::stop = ->
  @stopped = true

Bar = (@opts={}) ->
  @el = document.createElement 'div'
  {@period, @x, @y, @w, @h, @color, @boxHeight} = @opts

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
    left: (@x - @w) + 'px'
    top: @boxHeight
    height: @w + 'px'

    background: @color
    'border-radius': @w/2 + 'px'
  }
  @setPos @x, @y

  return this

Bar::update = (time) ->
  t = (time/@period) / TWOPI

  @y = Math.sin(-t)/2 * @boxHeight
  @setPos()

Bar::setPos = ->
  @el.style[k] = v for k, v of {
    top: @boxHeight/2 + @y + 'px'
  }
