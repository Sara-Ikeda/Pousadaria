require 'rails_helper'

describe "Inn owner creates a group reservation" do
  it "on the inn management view" do
    owner = InnOwner.create!(email: 'sara@email.com', password: 'password',
      first_name: 'Sara', last_name: 'Ikeda', document: '76283993710')
    Inn.create!(name: 'Pousada da Sara', inn_owner: owner, registration_number: '30638898000199')
    
    login_as owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'

    expect(page).to have_button "Reservar para Grupo"
  end
end
