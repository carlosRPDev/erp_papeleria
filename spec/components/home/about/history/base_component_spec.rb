# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::About::History::BaseComponent, type: :component do
  describe "rendering" do
    subject(:rendered) { render_inline(described_class.new) }

    it "renders successfully" do
      expect { rendered }.not_to raise_error
    end

    it "renders the main section with expected classes" do
      expect(rendered.css("section.bg-gray-50.py-14")).to be_present
    end

    it "renders the title" do
      expect(rendered.to_html).to include("Nuestra Historia")
    end

    it "renders the main description paragraphs" do
      expect(rendered.to_html).to include(
        "ERP+ nació con la visión de brindar a los pequeños negocios una herramienta poderosa"
      )
      expect(rendered.to_html).to include("Nuestra misión es democratizar la gestión empresarial")
    end

    it "renders the correct image" do
      img = rendered.css("img")
      expect(img.attr("src").value).to eq("/timelaps.png")
      expect(img.attr("alt").value).to eq("ERP+ Historia")
    end

    it "renders the list of values" do
      expect(rendered.to_html).to include("Misión: Simplificar la administración de los negocios.")
      expect(rendered.to_html).to include("Visión: Ser el ERP preferido de los emprendedores en Latinoamérica.")
      expect(rendered.to_html).to include("Valores: Innovación, transparencia y compromiso.")
    end

    it "renders the list items correctly" do
      expect(rendered.css("ul li").size).to eq(3)
    end
  end
end
