# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::Index::Hero::BaseComponent, type: :component do
  include Rails.application.routes.url_helpers

  subject(:rendered) do
    render_inline(described_class.new)
  end

  describe "render" do
    it "renders the main hero section" do
      section = rendered.css("section[data-controller='hero']").first
      expect(section).to be_present
    end

    it "renders the title" do
      expect(rendered.to_html).to include("Gestiona tu negocio con")
      expect(rendered.to_html).to include("ERP+")
    end

    it "renders the description paragraph" do
      expect(rendered.to_html).to include("Administra ventas, inventario y clientes desde un solo lugar.")
    end

    it "renders the registration button with correct link" do
      url = ErpCore::Engine.routes.url_helpers.new_user_registration_path

      button = rendered.css("a")
                       .find { |a| a.text == "Comenzar ahora" }

      expect(button).to be_present
      expect(button["href"]).to eq(url)
    end

    it "renders the disabled demo button" do
      demo = rendered.css("a")
                     .find { |a| a.text == "Ver demo" }

      expect(demo).to be_present
      expect(demo["href"]).to eq("#")
      expect(demo["class"]).to include("cursor-not-allowed")
      expect(demo["class"]).to include("opacity-50")
    end

    it "renders the hero image" do
      img = rendered.css("img").first

      expect(img).to be_present
      expect(img["alt"]).to eq("Vista ERP")
      expect(img["src"]).to include("https://encrypted-tbn0.gstatic.com")
    end

    it "has Stimulus controller and targets" do
      section = rendered.css("section[data-controller='hero']").first
      expect(section).to be_present

      expect(rendered.css("[data-hero-target='text']")).to be_present
      expect(rendered.css("[data-hero-target='links']")).to be_present
      expect(rendered.css("[data-hero-target='image']")).to be_present
    end
  end
end
