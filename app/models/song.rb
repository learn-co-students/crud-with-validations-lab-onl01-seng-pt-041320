class Song < ApplicationRecord
    validates :title, presence: true
end
class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {
        scope: %i[release_year artist_name], message: 'Cannot be repeated by the same artist in the same year'
    }
    validates :released, inclusion: {in: [true, false]}
    #validates :release_year, numericality: {only_integer: true}, length: {is: 4}
    with_options if: :released? do |released|
        released.validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}
    end
    validates :artist_name, presence: true
    validates :genre, presence: true

    def released?
        released
    end
end