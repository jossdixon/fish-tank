class Aquatic < ApplicationRecord
  belongs_to :user
  enum sex: { male: 0, female: 1 }

  validates :purchased_on, presence: true
  validates :nick_name, presence: true, length: { minimum: 2 }
  validates :common_name, presence: true, length: { minimum: 2 }
  validates :notes, presence: true, length: { maximum: 200 }
  validates :scientific_name, presence: true, format: { with: /\A.*\s.*\z/, message: "Binomial nomenclature." }
  validates :length, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :max_lifespan, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
