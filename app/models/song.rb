class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with TitleValidator
    validates_with YearValidator

end
