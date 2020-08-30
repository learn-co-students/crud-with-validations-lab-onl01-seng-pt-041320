class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, inclusion: { in: [true, false, nil] }
    with_options if: :released? do |released|
        released.validates :release_year, numericality: { 
            only_integer: true, 
            less_than_or_equal_to: Date.current.year 
      }
    end
end
