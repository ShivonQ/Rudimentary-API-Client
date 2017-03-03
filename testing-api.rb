require "httparty"
require "net/http"
require "uri"

# uri = URI.parse("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=DEMO_KEY")
# http = Net::HTTP.new(uri.host, uri.port)
# http.use_ssl = true
# http.verify_mode=OpenSSL::SSL::VERIFY_NONE
# http.start do
#   req = Net::HTTP::Get.new(uri.request_uri)
#   data = (http.request(req).body.to_s)
#   puts data
# end

require "./rover_client"
rc=Rover_Client.new
uri = rc.construct_uri(false,{rover_name:'curiosity',earth_date:'2015-6-3'})
puts uri


# Net::HTTP.start(uri.host) do |http|
#   http.use_ssl=true
#   http.verify_mode=OpenSSL::SSL::VERIFY_NONE
#   request=Net::HTTP::Get.new(uri.request_uri)
#
#   response=http.request(request) # Net::HTTPResponse object
#   response.body
#   response.status
#   response['curiosity']
#   puts response.to_s
# end
