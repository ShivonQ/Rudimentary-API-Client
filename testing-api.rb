require 'httparty'
require 'net/http'
require 'uri'

# TESTING IT
require './rover_client'
rc=Rover_Client.new
# uri = rc.construct_uri(true,)
# puts uri

result=rc.get_images('curiosity','2017-3-2')

puts result