xf_timeElapsed = 0
xf_nowTime = 0

xf_messageOpts = { fadeStep = 10, displayTime = .5}
xf_messages = {}

function xf_addMessage(text, xpos, ypos, direction)
	number = #xf_messages+1
	xf_messages[number] = { message = text,x = xpos, y = ypos, alpha = 255, type = 'get', direction = direction, startedAt = love.timer.getTime() }
end

function xf_printMessages()
	if #xf_messages > 0 then
		for i=1, #xf_messages do
			if xf_messages[i]['alpha'] > 0 then
				love.graphics.setColor( 255, 255, 255, xf_messages[i]['alpha'] )
				love.graphics.print(xf_messages[i]['message'],xf_messages[i]['x'],xf_messages[i]['y'])
				love.graphics.setColor( 255, 255, 255, 100 )
				love.graphics.print(xf_messages[i]['message'],xf_messages[i]['x']+1,xf_messages[i]['y']+1)
				if (love.timer.getTime() - xf_messages[i]['startedAt']) > xf_messageOpts['displayTime'] then
					xf_messages[i]['alpha'] = xf_messages[i]['alpha'] - xf_messageOpts['fadeStep'];
				end
				if(xf_messages[i]['direction'] == 'up') then
					xf_messages[i]['y'] = xf_messages[i]['y'] - 1;
				end
				if(xf_messages[i]['direction'] == 'down') then
					xf_messages[i]['y'] = xf_messages[i]['y'] + 1;
				end
				if(xf_messages[i]['direction'] == 'left') then
					xf_messages[i]['x'] = xf_messages[i]['x'] - 1;
				end
				if(xf_messages[i]['direction'] == 'right') then
					xf_messages[i]['x'] = xf_messages[i]['x'] + 1;
				end
			end
			love.graphics.setColor( 255, 255, 255, 255 )
		end
	end
end