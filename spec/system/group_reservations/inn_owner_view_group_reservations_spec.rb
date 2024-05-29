require 'rails_helper'

describe "Inn owner view group reservations" do
  it "on the inn management view" do
    owner = InnOwner.create!(email: 'sara@email.com', password: 'password',
      first_name: 'Sara', last_name: 'Ikeda', document: '76283993710')
    inn = Inn.create!(name: 'Pousada da Sara', inn_owner: owner, registration_number: '30638898000199', description: 'Para amigos', 
      address_attributes: { address: 'Rua X', number: '100', city: 'Belém', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    inn.group_reservations.create!(name: 'Convidados para festa da cidade', start_date: 1.months.from_now, end_date: 2.months.from_now)
    
    login_as owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'

    expect(page).to have_content "Reservas para Grupo"
    expect(page).to have_content "Convidados para festa da cidade"
    expect(page).to have_content "Data Inicial: #{1.months.from_now}"
    expect(page).to have_content "Data Final: #{2.months.from_now}"
    
  end
end
