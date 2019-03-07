require 'test_helper'


class UserSignupTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers


  test "invalid signup information" do

    assert_no_difference 'User.count' do
      post user_registration, user: {:email =>                 "foo@barbaz",
                                     :roles =>                 "admin",
                                     :password =>              "foo",
                           :password_confirmation => "bar"        }
    end

  end
end
