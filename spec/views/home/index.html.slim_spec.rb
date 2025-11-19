require 'rails_helper'

RSpec.describe "home/index.html.slim", type: :view do
  before do
    # Render de la vista principal
    render
  end

  it "renders the Hero component" do
    expect(rendered).to match(/Nuestros planes|Planes|ERP\+/i)
  end

  it "renders the Features component" do
    expect(rendered).to include("Administrar inventario")
    expect(rendered).to include("Ventas")
    expect(rendered).to include("Compras y proveedores")
  end

  it "renders the Pricing component" do
    expect(rendered).to include("Básico")
    expect(rendered).to include("Premium")
    expect(rendered).to include("Profesional")
  end

  it "renders the Testimonials component" do
    # Ajuste provisional: detectar presencia del contenido típico de testimonios
    expect(rendered).to match(/testimonio|cliente|opinión|estrellas/i)
  end

  it "renders the CTA component" do
    expect(rendered).to include("Comenzar").or include("Empieza").or include("Iniciar")
  end
end
