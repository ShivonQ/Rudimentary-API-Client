require 'http'
require './key_file'
class Rover_Client
  attr_accessor :key, :common_cams

  def initialize
    # it is ridiculous that I had to make this key a class.
    k=Api_Key.new
    self.key = k.key
    self.common_cams=['FHAZ', 'RHAZ', 'NAVCAM']
  end


  def get_images(rover_name, earth_date)
    base_url = construct_uri(true, {rover_name: rover_name, earth_date: earth_date})
    res=HTTParty.get(base_url, :verify => false).parsed_response
    strip_img_res(res,earth_date)


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
    base_url = construct_uri(false, {rover_name: rover_name})
    res=HTTParty.get(base_url, :verify => false).parsed_response
    puts strip_manifest_res(res)

  end

  def strip_img_res(res,earth_date)
  all_data = {
      earth_date:earth_date,
      cam_images:{
        'Front Hazard Avoidance Camera'=> [],
        'Rear Hazard Avoidance Camera'=> [],
        'Mast Camera'=> [],
        'Chemistry and Camera Complex'=>[],
        'Mars Hand Lens Imager'=> [],
        'Mars Descent Imager'=> [],
        'Navigation Camera'=> [],
        'Panoramic Camera'=> [],
        'Miniature Thermal Emission Spectrometer (Mini-TES)'=> []
      }
  }
  res['photos'].to_a.each do |item|
    puts cam_name = item['camera']['full_name']
    puts url = item['img_src']
    all_data[:cam_images][cam_name]<<(url)
  end
  all_data
end


  def strip_manifest_res(res)
    # TODO: Use this later for doing something with 'every day of its like an image taken'
    # res['photo_manifest'].to_a.each do |piece|
    #   puts piece
    # end
    manifest_data = {
      'name'=>res['photo_manifest']['name'],
      'landing_date'=>res['photo_manifest']['landing_date'],
      'launch_date'=>res['photo_manifest']['launch_date'],
      'max_sol'=>res['photo_manifest']['max_sol'],
      'max_date'=>res['photo_manifest']['max_date'],
      'status'=>res['photo_manifest']['status'],
      'total_photos'=>res['photo_manifest']['total_photos']
    }
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