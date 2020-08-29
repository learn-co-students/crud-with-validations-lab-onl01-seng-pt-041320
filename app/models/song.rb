class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year]}
    validates :artist_name, presence: true
    validate :release_year_date
    validate :release_year_presence
    def release_year_date
        if release_year.present?
            if !(release_year <= Date.today.year)
              self.errors.add(:release_year, "it's in the future")
            end
        end
    end

    def release_year_presence
        if released 
            if !release_year.present?
                self.errors.add(:release_year, "year is not present")
            end
        end
    end
end
