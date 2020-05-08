print('Enter string to encode: ')
local s = io.read()

local res = ''
for i = 1, s:len() do
    local c = s:byte(i)
    if string.byte('a') <= c and c <= string.byte('z') then
        c = (c - string.byte('a') + 13) % 26 + string.byte('a')
    elseif string.byte('A') <= c and c <= string.byte('Z') then
        c = (c - string.byte('A') + 13) % 26 + string.byte('A')
    end
    
    res = res .. string.char(c)
end

print('Encoded string: ' .. res)
