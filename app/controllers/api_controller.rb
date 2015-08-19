class ApiController < ApplicationController
 # #1
   skip_before_action :verify_authenticity_token

 private
  def authenticated?
   authenticate_or_request_with_http_basic {|email, password| User.find_by( email: email).valid_password?(password) }
  end
 end