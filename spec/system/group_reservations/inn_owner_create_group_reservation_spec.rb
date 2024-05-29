require 'rails_helper'

describe "Inn owner creates a group reservation" do
  it "on the inn management view" do
    owner = InnOwner.create!(email: 'sara@email.com', password: 'password',
      first_name: 'Sara', last_name: 'Ikeda', document: '76283993710')
    Inn.create!(name: 'Pousada da Sara', inn_owner: owner, registration_number: '30638898000199', description: 'Para amigos', 
    address_attributes: { address: 'Rua X', number: '100', city: 'Belém', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    
    login_as owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'

    expect(page).to have_button "Reservar para Grupo"
  end
  
  it "successfully" do
    owner = InnOwner.create!(email: 'sara@email.com', password: 'password',
      first_name: 'Sara', last_name: 'Ikeda', document: '76283993710')
    Inn.create!(name: 'Pousada da Sara', inn_owner: owner, registration_number: '30638898000199', description: 'Para amigos', 
    address_attributes: { address: 'Rua X', number: '100', city: 'Belém', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    
    login_as owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Reservar para Grupo'
    fill_in "Nome",	with: "Convidados para Festa da Cidade"
    fill_in "Data Inicial",	with: 1.months.from_now
    fill_in "Data Final",	with: 2.months.from_now
    click_on 'Reservar'

    expect(current_path).to eq  inn_management_path(owner.inn)
    expect(page).to have_content 'Reserva criada com sucesso!'
  end

  it "unsuccessfully" do
    owner = InnOwner.create!(email: 'sara@email.com', password: 'password',
      first_name: 'Sara', last_name: 'Ikeda', document: '76283993710')
    Inn.create!(name: 'Pousada da Sara', inn_owner: owner, registration_number: '30638898000199', description: 'Para amigos', 
    address_attributes: { address: 'Rua X', number: '100', city: 'Belém', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    
    login_as owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Reservar para Grupo'
    fill_in "Nome",	with: ""
    fill_in "Data Inicial",	with: ""
    fill_in "Data Final",	with: ""
    click_on 'Reservar'

    expect(page).to_not have_content 'Reserva criada com sucesso!'
    expect(page).to have_content 'Reservar para Grupo'
    expect(page).to have_field 'Nome'
  end
end
