class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year}
    validates :artist_name, presence: true
    validates :genre, presence: true
    
    with_options if: :is_released? do |r|
        r.validates :release_year, presence: true, numericality: {less_than: Date.current.year}
    end

    def is_released?
        self.released
    end
end
