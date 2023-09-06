-- Load the required LuaSocket module
local socket = require("socket")

-- Create a TCP server socket and bind it to a specific host and port
local server = assert(socket.bind("*", 8080))

-- Print a message to indicate that the server is listening
print("listening on *:8080")

-- Define a function to handle incoming requests
local function handle_request(client)
   -- Mock response data
   local response_data = [[
HTTP/1.1 200 OK
Content-Type: application/json

{
   "message": "This is a fake response from the server",
   "status": "success"
}
   ]]
   print("sending response:", response_data)
   -- Send the mock response to the client
   client:send(response_data)

   -- Close the client connection
   client:close()
end

-- Main server loop
while true do
   local client = server:accept() -- Wait for a client to connect
   if client then
	  print("received a connection")
      handle_request(client) -- Handle the client's request
   end
end
