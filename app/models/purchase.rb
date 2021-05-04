class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  has_one :address
end
