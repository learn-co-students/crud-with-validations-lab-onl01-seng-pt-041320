class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: 2020 }, presence: true, if: :released?
    validate :not_twice

    def released?
        released == true
    end

    def not_twice
        Song.all.each do |song|
            # binding.pry
            if song.title == title && song.release_year == release_year
                # binding.pry
                self.errors[:release] << "Can't release a song twice in one year."
            end
        end
    end

end
