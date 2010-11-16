require('xf_message.lua')

love.graphics.setFont(24)

function love.draw()
	xf_printMessages()
	
--	love.graphics.print(#xf_messages, 50,50)
	love.graphics.print(love.timer.getTime(), 100, 50)
--	love.graphics.print(timeElapsed .. ' - ' .. nowTime .. ' = ' .. (timeElapsed - nowTime), 50, 100)
	
	xf_nowTime = love.timer.getTime()

	if (xf_timeElapsed - xf_nowTime) < 0 then
		xf_addMessage('Triggered at ' .. xf_nowTime,250,250, 'left')
		xf_timeElapsed = xf_nowTime+1
	end
	
end