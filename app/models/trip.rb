class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_resorts
  has_many :resorts, through: :trip_resorts
  # validates :name, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :end_date, numericality: { greater_than: :start_date }
end

