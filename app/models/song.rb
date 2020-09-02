class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: :current_year }, if: :is_released
    validates :artist_name, presence: true
    

    def current_year
        Time.now.year
    end

    def is_released
        released == true
    end
end
