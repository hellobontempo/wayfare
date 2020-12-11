
require 'faker'
Resort.create(name: "Breckenridge", city: "Breckenridge", state: "CO", url: "https://www.breckenridge.com/")

Resort.create(name: "Stevens Pass", city: "Skykomish", state: "WA", url: "https://www.stevenspass.com/")

Resort.create(name: "Keystone", city: "Keystone", state: "CO", url: "https://www.keystoneresort.com/")

Resort.create(name: "Crested Butte", city: "Crested Butte", state: "CO", url: "https://www.skicb.com/")

Resort.create(name: "Park City", city: "Park City", state: "UT", url: "https://www.parkcitymountain.com/")

Resort.create(name: "Beaver Creek", city: "Beaver Creek", state: "CO", url:"https://www.beavercreek.com/")

Resort.create(name: "Heavenly", city: "South Lake Tahoe", state: "CA", url: "https://www.skiheavenly.com/")

Resort.create(name: "Kirkwood", city: "Kirkwood", state: "CA", url: "https://www.kirkwood.com/")

Resort.create(name: "Vail", city: "Vail", state: "CO", url: "https://www.vail.com/")

Resort.create(name: "Whistler Blackcomb", city: "Whistler", state: "BC", url: "https://www.whistlerblackcomb.com/")

Resort.create(name: "Sun Valley", city: "Sun Valley", state: "ID", url: "https://www.sunvalley.com/")

Resort.create(name: "Snowbasin", city: "Huntsville", state: "UT", url: "https://www.snowbasin.com/")

Trip.create(name: "lake tahoe", notes: "staying at lake tahoe beach resort", start_date: "2020-12-13", end_date: "2020-12-18", user_id: 1)

Trip.create(name: "utah", notes: "car camping", start_date: "2020-12-19", end_date: "2020-12-20", user_id: 1)

Trip.create(name: "colorado", notes: "need lodging for 12/23 and 12/31-1/4, hot springs ...", start_date: "2020-12-23", end_date: "2020-12-31", user_id: 1)

User.create(name: "claire", email: "claire@me.com", password: "12345")

5.times do
    Trip.create(name: Faker::TvShows::TwinPeaks.unique.location, start_date: Faker::Date.between(from: '2020-12-01', to: '2020-12-15'), end_date: Faker::Date.between(from: '2020-12-15', to: '2020-12-31'), notes: Faker::Quote.jack_handey, user_id: Faker::Number.within(range: 2..5))
end

5.times do
    Trip.create(name: Faker::Games::SuperMario.unique.location, start_date: Faker::Date.between(from: '2020-12-01', to: '2020-12-15'), end_date: Faker::Date.between(from: '2020-12-15', to: '2020-12-31'), notes: Faker::Quote.jack_handey, user_id: Faker::Number.within(range: 2..5))
end

5.times do
    User.create(name: Faker::Name.first_name , email: Faker::Internet.unique.email, password: "123password")
end