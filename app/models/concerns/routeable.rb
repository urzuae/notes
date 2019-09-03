module Routeable
  extend ActiveSupport::Concern

  included do
    delegate :url_helpers, to: 'Rails.application.routes'
  end
end
