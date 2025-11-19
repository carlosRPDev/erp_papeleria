# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::Index::Features::BaseComponent, type: :component do
  let(:features) do
    [
      { icon: "fa-box", title: "Inventario", desc: "Control total de productos." },
      { icon: "fa-chart-line", title: "Reportes", desc: "Toma decisiones con datos reales." },
      { icon: "fa-users", title: "Clientes", desc: "Gestión completa de tus clientes." }
    ]
  end

  let(:component) { described_class.new(features: features) }
  let(:rendered)  { render_inline(component) }

  describe "render" do
    it "renders the main section" do
      expect(rendered.css("section.bg-white.py-20")).to be_present
    end

    it "renders the section title" do
      expect(rendered.text).to include("Todo lo que necesitas en un solo sistema")
    end

    it "renders all feature items" do
      expect(rendered.css("div[data-animate-target='target']").count).to eq(features.size)
    end

    it "renders icons correctly" do
      features.each do |feature|
        selector = "i.fa.#{feature[:icon]}"
        expect(rendered.css(selector)).to be_present
      end
    end

    it "renders titles for each feature" do
      features.each do |feature|
        expect(rendered.text).to include(feature[:title])
      end
    end

    it "renders descriptions for each feature" do
      features.each do |feature|
        expect(rendered.text).to include(feature[:desc])
      end
    end
  end
end
