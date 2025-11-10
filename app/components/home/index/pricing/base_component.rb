# frozen_string_literal: true

class Home::Index::Pricing::BaseComponent < ViewComponent::Base
  def initialize(plans: [])
    @plans = plans
  end
end
