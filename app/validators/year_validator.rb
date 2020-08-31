class YearValidator < ActiveModel::Validator
    

    def validate(record)
        if record.released == true
            if record.release_year.present? 
                if record.release_year > Date.today.year
                    record.errors[:release_year] << "Release year error"
                end
            else
                record.errors[:release_year] << "Please enter a release year"
            end
        else
        end
    end

end