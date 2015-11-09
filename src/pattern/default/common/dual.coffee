module.exports = (pattern, padParams) ->
  padWidth = padParams.width
  padHeight = padParams.height
  padDistance = padParams.distance

  pitch = padParams.pitch
  leadCount = padParams.count

  pad =
    type: 'smd'
    width: padWidth
    height: padHeight
    shape: 'rectangle'

  # Pads on the left side
  pad.x = -padDistance / 2
  y = -pitch * (leadCount/4 - 0.5)
  num = 1
  for i in [1..leadCount/2]
    pad.name = num++
    pad.y = y
    pattern.addPad pad
    y += pitch

  # Pads on the right side
  pad.x = padDistance / 2
  y -= pitch
  for i in [(leadCount/2 + 1)..leadCount]
    pad.name = num++
    pad.y = y
    pattern.addPad pad
    y -= pitch
