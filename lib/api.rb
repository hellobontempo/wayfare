class Api

    def initialize(ingredient_input)
        @ingredient_input = ingredient_input
        url = "https://api.edamam.com/search?q=#{ingredient_input[0]}%2C+#{ingredient_input[1]}%2C+#{ingredient_input[2]}&app_id=#{ENV["API_ID"]}&app_key=#{ENV["API_KEY"]}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        recipes = JSON.parse(response)
        @recipe_hits = recipes["hits"][1..5]
      end
    #"https://api.opentripmap.com/0.1/en/places/bbox?lon_min=-123&lon_max=-102&lat_min=38&lat_max=50&src_geom=osm&src_attr=osm&kinds=natural&limit=100&apikey=#{ENV["API_KEY"]}"
    #https://api.opentripmap.com/0.1/en/places/bbox?lon_min=-123&lon_max=-102&lat_min=38&lat_max=50&src_geom=osm&src_attr=osm&kinds=hot_springs&limit=500&apikey=5ae2e3f221c38a28845f05b61c00c8c13d458ced9e232ea7cf0da949
end
