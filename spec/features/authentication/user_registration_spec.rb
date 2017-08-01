require 'rails_helper'
require 'support/stubs/facebook_omniauth.rb'

RSpec.feature 'New user registration' do
  context 'as an unregistered user using facebook auth' do
    scenario 'with valid credentials' do
      stub_facebook_auth

      visit root_path

      expect(current_path).to eq(new_session_path)

      click_on 'Sign in with Facebook'

      expect(current_path).to eq(new_registration_car_path)
      expect(User.count).to eq(1)
    end

    scenario 'first time user looks up car by vin after successful log in', js: :true do
      user = create(:unfinished_user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user)

      visit new_registration_car_path

      expect(page).to have_css('h1', text: 'Get started by adding a car to your Garage')
      within('#vin-lookup') do
        fill_in('vin', with: '5FNYF4H4XCB014462')
        click_on('Find Car')
      end

      within('.vin-search-result') do
        expect(page).to have_content('Is this your car?')
        expect(page).to have_content('2012 Honda Pilot')
        expect(page).to have_content('Engine: 3.5 Liter, 6 Cylinder, gas')
        expect(page).to have_content('Transmission: 5 speed, AUTOMATIC')
        expect(page).to have_button('Confirm')
      end
    end

    scenario 'new user adds car to garage', js: true do
      user = create(:unfinished_user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user)

      visit new_registration_car_path

      within('#vin-lookup') do
        fill_in('vin', with: '5FNYF4H4XCB014462')
        click_on('Find Car')
      end

      click_on 'Confirm'

      within('.temp-car') do
        expect(page).to have_content('2012 Honda Pilot')
        expect(page).to have_content('Engine: 3.5 Liter, 6 Cylinder, gas')
        expect(page).to have_content('Transmission: 5 speed, AUTOMATIC')
      end
    end

    scenario 'user confirms cars', js: true do
      user = create(:unfinished_user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user)

      visit new_registration_car_path

      within('#vin-lookup') do
        fill_in('vin', with: '5FNYF4H4XCB014462')
        click_on('Find Car')
      end

      click_on 'Confirm'
      click_on 'Done Adding Cars'

      expect(current_path).to eq(garage_index_path)
      expect(page).to have_content('Your Garage')
      expect(page).to have_content('2012 Honda Pilot')
      expect(page).to have_content('Engine: 3.5 Liter, 6 Cylinder, gas')
      expect(page).to have_content('Transmission: 5 speed, AUTOMATIC')
    end
  end
end
