require 'test_helper'

class UserPostTestTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
  @user = users(:user1)
  end

  test "invalid post creation" do
    login_as(@user)
    get root_path
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: {content: ""}}
    end
  end

  test "valid post creation" do
    login_as(@user)
    get root_path
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: {content: "post1"}}
    end
  end
end
