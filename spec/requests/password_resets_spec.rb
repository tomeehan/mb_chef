require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  it 'emails user when requesting password reset' do 
  	user = create(:user)
  	visit edit_user_password_path
  	click_link "password"
  	fill_in "Email", :with => user.email
  end
end
