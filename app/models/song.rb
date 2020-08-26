class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year }
    with_options if: :is_released? do |r|
        r.validates :release_year, presence: true, numericality: {less_than: Date.current.year }
    end
    validates :genre, presence: true

    def is_released?
        self.released
    end

end
