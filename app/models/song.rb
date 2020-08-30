class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :no_double_names
  validates :release_year, presence: true, 
     if: :released?
  validate :isnt_a_future_year

  private

  def no_double_names
  
    if Song.any? { |s| s.title == title && s.release_year == release_year }
      errors.add(:title, "No two songs may have the same name, this year")
    end
  end

  def isnt_a_future_year 
    if release_year.present? && release_year > Date.today.year 
      self.errors.add(:release_year, "Release year can't be in the future")
    end
  end
    
     
end
