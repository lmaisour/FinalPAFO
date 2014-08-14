require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = 'M_QHhMjEnq1aAGYrv0kNJQ'
  config.consumer_secret = 'FHtxbgU2cuPEv2mH0sSz0jYu7dA'
  config.token = 'FmnlpFkmGUYDN8SEyhsr4Zuq9_JzST-n'
  config.token_secret = 'y3S6b9Ec0k_YSwabzzhc69WWGF0'

# # construct a client instance
# client = Yelp::Client.new

# # call business with business ID
# client.business('gjelina-venice-2')

# # perform an address/location-based search for cream puffs nearby
# request = Yelp::Review::Request::Location.new(
#             :address => '650 Mission St',
#             :city => 'San Francisco',
#             :state => 'CA',
#             :radius => 2,
#             :term => 'cream puffs',
#             # :yws_id => 'YOUR_YWSID_HERE')
# response = client.search(request)



end
