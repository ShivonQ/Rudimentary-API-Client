require 'http'
require './key_file'
class Rover_Client
  attr_accessor :key
  def initialize
    self.key = 'DEMO_KEY'
  end



  def image_api_call(options={})
    base_uri = construct_uri(true,options)
    # set up connection
    http = Net::HTTP.new(base_uri.host, base_uri.port)
  #   set SSL variables
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.start do
      req = Net::HTTP::Get.new(base_uri.request_uri)
    end
  end

  def manifest_call(rover_name)
  #   TODO: Mission Manifest Data
  end

  def construct_uri(is_image_call, options={})
    if is_image_call
      uri='https://api.nasa.gov/mars-photos/api/v1/rovers/'+(options[:rover_name]+'/photos?'+'earth_date='+options[:earth_date]+'&api_key='+self.key)
    else
      uri='https://api.nasa.gov/mars-photos/api/v1/manifests/'+(options[:rover_name]+'&api_key='+self.key)
    end
    puts 'uri so far  = ' + uri

  end
end