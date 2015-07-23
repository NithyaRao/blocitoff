module Features
  module SessionHelpers
    def sign_up(name, email, password)
      visit new_user_registration_path
      fill_in 'user_name', with: name
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in(user)
      visit new_user_session_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button "Sign in"  
    end

     def create_items(item_name)
      fill_in 'item_name', :with => item_name
      click_button "Save"
    end
end
end