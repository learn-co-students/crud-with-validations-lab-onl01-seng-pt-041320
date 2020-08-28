class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released?, numericality: { less_than: Date.current.year }



end
