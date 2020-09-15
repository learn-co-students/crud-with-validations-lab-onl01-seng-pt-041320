class Song < ActiveRecord::Base

    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true,  if: :released
    validate :release_year_cannot_be_in_future
    validates_presence_of :artist_name

    def release_year_cannot_be_in_future
        if release_year.present? && release_year > Date.today.year
          errors.add(:release_year, "can't be in the future")

        end
    end
end 
