class Resort < ActiveRecord::Base
    has_many :trip_resorts
    has_many :trips, through: :trip_resorts

    def self.state_resorts(state)
        @state_resorts = []
        @state_resorts << Resort.find_each(state: "#{state}")
        @state_resorts
    end
end
