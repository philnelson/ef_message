require('xf_message.lua')

ef_addMessage('Hello!',250, 250, 'up')

function love.draw()
	ef_printMessages()	
end