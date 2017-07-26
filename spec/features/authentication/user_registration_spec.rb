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

    scenario 'user adds car to garage after successful login', js: :true do
      user = create(:unfinished_user)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user)

      visit new_registration_car_path

      VCR.use_cassette('vin_lookup') do
      expect(page).to have_css('h1', text: 'Get started by adding a car to your Garage')
        within('#vin-lookup') do
          fill_in('vin', with: '5FNYF4H4XCB014462')
          click_on('Find Car')
        end
      end
    end
  end
end
