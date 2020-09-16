class Event < ApplicationRecord
  belongs_to :exhibition
  belongs_to :organizer

end