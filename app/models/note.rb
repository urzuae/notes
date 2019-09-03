class Note < ApplicationRecord
  belongs_to :folder, optional: true

  validates_uniqueness_of :name
end
