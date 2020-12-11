class Resort < ActiveRecord::Base
    has_many :trip_resorts
    has_many :trips, through: :trip_resorts

    def self.state_resorts(state)
        Resort.all.select{|resort| resort.state == "#{state}"}
    end
end


