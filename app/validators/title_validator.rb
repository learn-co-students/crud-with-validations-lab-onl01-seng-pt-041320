class TitleValidator < ActiveModel::Validator
    

    def validate(record)
        if record.title.present?
            if record.released
                if Song.find_by(title: record.title, release_year: record.release_year, artist_name: record.artist_name)
                    record.errors[:title] << "This song already exists"
                end
            end
        else
            record.errors[:title] << "there must be a title"
        end
    end

end