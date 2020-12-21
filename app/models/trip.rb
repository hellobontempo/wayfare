class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_resorts
  has_many :resorts, through: :trip_resorts
  validates :name, :start_date, :end_date, presence: true

  def date_check
    self.start_date < self.end_date
  end

end

