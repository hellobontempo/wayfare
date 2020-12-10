class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_resorts
  has_many :resorts, through: :trip_resorts
  # validates :destination, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
end
