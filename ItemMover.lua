--Auto Extracts specific items from a RS Interface

component = require("component")
os = require("os")
rs = component.block_refinedstorage_interface
side = 2
items = {}
stringCheck = {}
arg = {...}

function main()
    for i,v in ipairs(arg) do
        stringCheck[i] = v
        print(v)
    end
    local index = 1
    for i, stack in ipairs(rs.getItems()) do
        --print(stack.label)
        for f, str in ipairs(stringCheck) do
            if (string.match(stack.label, str)) then
                print(stack.label)
                items[index] = stack
                index = index + 1
                break
            end
        end
    end
    for b, y in ipairs(items)do
        rs.extractItem(y, y.size)
    end
end

if #arg == 0 then
    print("Usage: [name to check] [name to check 2] ...")
else
    if (rs.isConnected()) then print("RS Found!")
    else print("RS not found... ensure an adapter is connected to an interface and to the computer")
    end
    while true do
        print("Checking for Ores...")
        main()
        os.sleep(10)
    end
end
