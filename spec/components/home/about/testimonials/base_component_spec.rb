# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::About::Testimonials::BaseComponent, type: :component do
  let(:component) { described_class.new }
  let(:rendered)  { render_inline(component) }

  describe "rendering" do
    it "renders the section wrapper" do
      expect(rendered.css("section.bg-gray-50.py-16")).to be_present
    end

    it "renders the title" do
      expect(rendered.text).to include("Lo que dicen nuestros clientes")
    end

    it "renders all testimonials" do
      expect(rendered.css(".testimonial-card").count).to eq(3)
    end

    it "renders each testimonial name" do
      component.send(:testimonials).each do |t|
        expect(rendered.text).to include(t[:name])
      end
    end

    it "renders each testimonial quote" do
      component.send(:testimonials).each do |t|
        expect(rendered.text).to include("\"#{t[:quote]}\"")
      end
    end

    it "renders the testimonial images" do
      component.send(:testimonials).each do |t|
        node = rendered.css("img[src='#{t[:image]}']")
        expect(node).to be_present
      end
    end

    it "sets Stimulus controller attributes" do
      track = rendered.css("[data-controller='marquee']")
      expect(track).to be_present
    end

    it "renders marquee track items" do
      expect(rendered.css("[data-marquee-target='item']").count).to eq(3)
    end
  end
end
