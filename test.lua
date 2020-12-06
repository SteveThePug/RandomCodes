local component = require("component")
local sides = require("sides")
local rs = component.redstone
local inventory = component.inventory_controller

test

local slot = 1
local amount = inventory.getStackInInternalSlot(slot)
if amount then
    print(item.name)
    print(item.size)
    print(item.damage)

else
    print("Slot empty")
end