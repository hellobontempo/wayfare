# --- REQUIRED TO SET UP DATABASE --- 
State.create(name: "Colorado", code: "CO")
State.create(name: "Washington", code: "WA")
State.create(name: "Utah", code: "UT")
State.create(name: "Canada", code: "BC")
State.create(name: "California", code: "CA")
State.create(name: "Idaho", code: "ID")


Resort.create(name: "Breckenridge", city: "Breckenridge", state_id: 1, url: "https://www.breckenridge.com/")
Resort.create(name: "Stevens Pass", city: "Skykomish", state_id: 2, url: "https://www.stevenspass.com/")
Resort.create(name: "Keystone", city: "Keystone", state_id: 1, url: "https://www.keystoneresort.com/")
Resort.create(name: "Crested Butte", city: "Crested Butte", state_id: 1, url: "https://www.skicb.com/")
Resort.create(name: "Park City", city: "Park City", state_id: 3, url: "https://www.parkcitymountain.com/")
Resort.create(name: "Beaver Creek", city: "Beaver Creek", state_id: 1, url:"https://www.beavercreek.com/")
Resort.create(name: "Heavenly", city: "South Lake Tahoe", state_id: 5, url: "https://www.skiheavenly.com/")
Resort.create(name: "Kirkwood", city: "Kirkwood", state_id: 5, url: "https://www.kirkwood.com/")
Resort.create(name: "Vail", city: "Vail", state_id: 1, url: "https://www.vail.com/")
Resort.create(name: "Whistler Blackcomb", city: "Whistler", state_id: 4, url: "https://www.whistlerblackcomb.com/")
Resort.create(name: "Sun Valley", city: "Sun Valley", state_id: 6, url: "https://www.sunvalley.com/")
Resort.create(name: "Snowbasin", city: "Huntsville", state_id: 3, url: "https://www.snowbasin.com/")


# --- OPTIONAL FAKER DATA --- #

# 5.times do
#     Trip.create(name: Faker::TvShows::TwinPeaks.unique.location, start_date: Faker::Date.between(from: '2020-12-01', to: '2020-12-15'), end_date: Faker::Date.between(from: '2020-12-15', to: '2020-12-31'), notes: Faker::Quote.jack_handey, user_id: Faker::Number.within(range: 2..5))
# end

# 5.times do
#     Trip.create(name: Faker::Games::SuperMario.unique.location, start_date: Faker::Date.between(from: '2020-12-01', to: '2020-12-15'), end_date: Faker::Date.between(from: '2020-12-15', to: '2020-12-31'), notes: Faker::Quote.jack_handey, user_id: Faker::Number.within(range: 2..5))
# end

# 5.times do
#     User.create(name: Faker::Name.first_name , email: Faker::Internet.unique.email, password: "123password")
# end