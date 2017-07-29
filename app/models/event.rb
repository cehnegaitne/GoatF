class Event < ApplicationRecord
    validates :eventname, presence: true, length: {maximum: 50}
    validates :description, length: {maximum: 255}

end
