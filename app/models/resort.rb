class Resort < ActiveRecord::Base
    has_many :trip_resorts
    has_many :trips, through: :trip_resorts
end
