require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  background do
    @user = User.create(username: 'someone', email: 'exemple@example.com', password: 'serious',
                        password_confirmation: 'serious')
  end

  feature 'Users', type: :feature do
    context 'Show page' do
      scenario 'Show page after sign in' do
        visit user_path(@user.id)
        expect(page).to have_content 'My Personal Events'
      end
    end
    context 'Show page' do
      scenario 'it redirets to a different page' do
        visit root_path
        expect(page).to_not have_content 'My Personal Events'
      end
    end
  end
end
