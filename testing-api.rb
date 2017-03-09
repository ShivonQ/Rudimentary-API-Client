require 'httparty'
require 'net/http'
require 'uri'

# TESTING IT
require './rover_client'
rc=Rover_Client.new
# uri = rc.construct_uri(true,)
# puts uri
str = {"id"=>617854, "sol"=>1625, "camera"=>{"id"=>26, "name"=>"NAVCAM", "rover_id"=>5, "full_name"=>"Navigation Camera"}, "img_src"=>"http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01625/opgs/edr/ncam/NLB_541745496EDR_F0611140NCAM00234M_.JPG", "earth_date"=>"2017-03-02", "rover"=>{"id"=>5, "name"=>"Curiosity", "landing_date"=>"2012-08-06", "launch_date"=>"2011-11-26", "status"=>"active", "max_sol"=>1629, "max_date"=>"2017-03-06", "total_photos"=>307282, "cameras"=>[{"name"=>"FHAZ", "full_name"=>"Front Hazard Avoidance Camera"}, {"name"=>"NAVCAM", "full_name"=>"Navigation Camera"}, {"name"=>"MAST", "full_name"=>"Mast Camera"}, {"name"=>"CHEMCAM", "full_name"=>"Chemistry and Camera Complex"}, {"name"=>"MAHLI", "full_name"=>"Mars Hand Lens Imager"}, {"name"=>"MARDI", "full_name"=>"Mars Descent Imager"}, {"name"=>"RHAZ", "full_name"=>"Rear Hazard Avoidance Camera"}]}}
result=rc.get_images('curiosity','2017-3-2')
puts result
# puts result
#
# str.each { |k, v|
#   puts 'Key: '+k.to_s+'  |  Val: '+v.to_s }