class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :title],
    message: "Cannot repeat title in same year."}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :valid_release_year

    private
    def valid_release_year
        if self.release_year > Date.today.year
            self.errors.add(:release_year, "Must be older or current year")
        end
    end
    
end