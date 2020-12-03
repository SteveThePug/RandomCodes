local component = require("component")
local os = require("os")
local reactor = component.br_reactor

function tuningUnder(initial)
	for i=initial,100,1 do
		reactor.setAllControlRodLevels(i)
		os.sleep(10)
		if reactor.getEnergyStored() < 8000000 then
			return (i-1)
		else
			os.sleep(5)
		end
	end
end

function tuningOver(initial)
	for i=initial,0,-1 do
		reactor.setAllControlRodLevels(i)
		os.sleep(10)
		if reactor.getEnergyStored() > 9000000 then
			return (i+1)
		else
			os.sleep(5)
		end
	end
end

start = tuningUnder(95)
while reactor.getActive do
	if not start then
		start = 99
	end
	print("Ideal percent: " .. start .. "%")
	reactor.setAllControlRodLevels(start)
	os.sleep(10)
	if reactor.getEnergyStored() < 8000000 then
		start = tuningUnder(start + 5)
	elseif reactor.getEnergyStored() > 9000000 then
		start = tuningOver(start - 5)
	else
		os.sleep(10)
	end
end
		
