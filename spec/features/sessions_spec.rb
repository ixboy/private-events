require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  context 'Signing in' do
    scenario 'Signing in with correct credentials' do
      visit sign_in_path
      within('form') do
        fill_in 'Email', with: 'alycia@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Sign In'
      expect(page).to have_content 'Events'
    end

    given(:other_user) { User.create(email: 'other@example.com', password: 'rous', password_confirmation: 'rous') }

    scenario 'Signing in as another user' do
      visit sign_in_path
      within('form') do
        fill_in 'Email', with: other_user.email
        fill_in 'Password', with: other_user.password
      end
      click_button 'Sign In'
      expect(page).to have_content 'Invalid email or password'
    end
  end
end
