---
-- @submodule Noble.Transition

class("Dip", nil, Noble.Transition).extends(Noble.Transition)
local transition = Noble.Transition.Dip
transition.name = "Dip"

-- Type
transition._type = Noble.Transition.Type.COVER

--- Fade to an image, then to the next scene.
-- @table Noble.Transition.Dip.defaultProperties
-- @number[opt=0.25] holdTime
-- @tparam Graphics.image panelImage
-- @tparam[opt=Graphics.image.kDitherTypeBayer4x4] Graphics.image.kDither dither
-- @tparam[opt=Ease.outInQuad] Ease ease
-- @number[opt=0] x
-- @number[opt=0] y
transition.defaultProperties = {
	holdTime = 0.25,
	ease = Ease.outInQuad,
	dither = Graphics.image.kDitherTypeBayer4x4,
	panelImage = nil,
	x = 0,
	y = 0
}

function transition:setProperties(__arguments)
	self.dither = __arguments.dither or self.defaultProperties.dither
	self.panelImage = __arguments.panelImage or self.defaultProperties.panelImage
	self.x = __arguments.x or self.defaultProperties.x
	self.y = __arguments.y or self.defaultProperties.y
end

function transition:draw()
	self.panelImage:drawFaded(self.x, self.y, self.sequence:get(), self.dither)
end