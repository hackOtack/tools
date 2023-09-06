-- Load the required LuaSocket module
local socket = require("socket")

-- Create a TCP client socket
local client = assert(socket.tcp())

-- Connect to the server
assert(client:connect("localhost", 8080))

-- Read the response from the server
local response, err = client:receive("*a")

-- Close the client connection
client:close()

-- Print the response and any error
print("Received response:")
if response then
   print(response)
else
   print("Error:", err)
end
