class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, length: { minimum: 20 }

  scope :persisted, -> { where "id IS NOT NULL" }


  def self.persisted
    where "id IS NOT NULL"
  end
end
