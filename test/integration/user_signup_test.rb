require 'test_helper'


class UserSignupTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers


  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: {user: { :name =>                  "",
                                                    :email =>                 "foo@barbaz",
                                                    :roles =>                 "admin",
                                                    :password =>              "foo",
                                                    :password_confirmation => "bar"        
                                                  }}
    end

  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: {user: { :name =>                  "name",
                                                    :email =>                 "foo@barbaz.com",
                                                    :password =>              "password",
                                                    :password_confirmation => "password"        
                                                  }}
    end

  end
end
