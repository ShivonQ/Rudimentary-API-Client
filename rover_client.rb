require 'http'
require './key_file'
class Rover_Client
  attr_accessor :key
  def initialize
    # it is ridiculous that I had to make this key a class.
    k=Api_Key.new
    self.key = k.key
    puts self.key

  end


  def get_images(rover_name,earth_date)
    base_url = construct_uri(true,{rover_name:rover_name,earth_date:earth_date})
    res=HTTParty.get(base_url, :verify=>false).parsed_response

  end

  # THIS WAY WAS REMOVED BECAUSE IT FUCKING BLEW
  # def image_api_call(rover_name,earth_date)
  #   base_url = construct_uri(true,{rover_name:rover_name,earth_date:earth_date})
  #   uri=URI.parse(base_url)
  #   puts 'Uri Constructed Successfully:'+uri.to_s
  #   # set up connection
  #   http = Net::HTTP.new(uri.host, uri.port)
  # #   set SSL variables
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #   http.start do
  #     return req = Net::HTTP::Get.new(uri.request_uri)
  #   end
  #
  # end

  def get_manifest(rover_name)
    base_url = construct_uri(false,{rover_name:rover_name})
    res=HTTParty.get(base_url, :verify=>false).parsed_response

  end

  def strip_img_res(res)

  end

  def strip_manifest_res(res)

  end

  def construct_uri(is_image_call, options={})
    if is_image_call
      uri='https://api.nasa.gov/mars-photos/api/v1/rovers/'+(options[:rover_name].to_s+'/photos?'+'earth_date='+options[:earth_date].to_s+'&api_key='+self.key.to_s)
    else
      uri='https://api.nasa.gov/mars-photos/api/v1/manifests/'+(options[:rover_name].to_s+'?api_key='+self.key.to_s)
    end
    # For Testing
    # puts 'uri so far  = ' + uri

  end
end