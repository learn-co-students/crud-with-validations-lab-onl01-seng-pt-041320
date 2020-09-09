class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :title],
    message: "Cannot repeat title in same year."}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year}, if: :released

    private
    def future_release_year
        if self.release_year > Date.today.year
            self.errors.add(:release_year, "Must be older or current year")
        end
    end
    
end