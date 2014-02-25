class RacingGoat < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :gender, presence: true
  validates :dietary_preference, inclusion: {in: ["oats", "carrots", "grains"]}
end
