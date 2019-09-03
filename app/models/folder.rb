class Folder < ApplicationRecord
  include Routeable

  belongs_to :parent, class_name: 'Folder', optional: true

  has_many :folders, foreign_key: :parent_id
  has_many :notes, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  delegate :url_helpers, to: 'Rails.application.routes'

  def get_parents
    if parent.nil?
      return [{url: url_helpers.root_path, name: "root"}]
    end

    parent.get_parents << {url: url_helpers.folder_path(parent), name: parent.name }
  end
end
