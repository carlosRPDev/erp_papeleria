require "rails_helper"

RSpec.describe "Landing Page", type: :system do

  it "muestra el título correcto y elementos principales" do
    visit root_path

    expect(page).to have_title("Erp Plus")

    expect(page).to have_selector("h1", text: "Gestiona tu negocio con ERP+")
    expect(page).to have_selector("span", text: "ERP+")
    expect(page).to have_selector("a", text: "Inicio")
    expect(page).to have_selector("a", text: "Productos")
    expect(page).to have_selector("a", text: "Nosotros")
    expect(page).to have_selector("a", text: "Contacto")
    expect(page).to have_selector("a", text: "Iniciar sesión")
  end

  it "navega a la página de Nosotros desde el enlace" do
    visit root_path
    click_link "Nosotros"

    expect(page).to have_current_path("/about", ignore_query: true)
    expect(page).to have_selector("h1", text: "Sobre Nosotros")
  end
end
