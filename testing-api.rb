require 'httparty'
require 'net/http'
require 'uri'

# TESTING IT
require './rover_client'
rc=Rover_Client.new
uri = rc.construct_uri(true,{rover_name:'curiosity',earth_date:'2015-6-3'})
puts uri

