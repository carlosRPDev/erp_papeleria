# frozen_string_literal: true

class Home::Index::Features::BaseComponent < ViewComponent::Base
  def initialize(features: [])
    @features = features
  end
end
