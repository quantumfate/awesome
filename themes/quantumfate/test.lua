--local os = os
-- http://lua-users.org/wiki/FileInputOutput

local colors = {}

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  i = 0
  for line in io.lines(file) do 
	lines['color' .. i] = line
	i = i + 1
  end
  return lines
end

-- tests the functions above
local file = os.getenv("HOME") .. '/.cache/wal/colors'
local colors = lines_from(file)

-- print all line numbers and their contents
for k,v in pairs(lines) do
  print(k , v)
end

return colors
