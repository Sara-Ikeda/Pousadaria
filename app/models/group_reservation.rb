class GroupReservation < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
  belongs_to :inn
end
