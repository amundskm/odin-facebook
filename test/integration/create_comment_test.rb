require 'test_helper'

class CreateCommentTestTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user    = users(:user1)
    @post    = posts(:post1)
    @comment = comments(:comment1)
  end
  
  test "invalid comments on valid posts" do
    login_as(@user)
    get root_path
    assert_no_difference 'Comment.count' do

      post comments_path, params: { comment: {content: "", commentable: @post1}}
    end
  end

  test "valid comments on invalid posts" do
    login_as(@user)
    get root_path
    assert_no_difference 'Comment.count' do

      post comments_path, params: { comment: {content: "comment1", commentable_id: @post, commentable_type: ""}}
    end
  end

  test "invalid comments on  valid comments" do
    login_as(@user)
    get root_path
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: {content: "", commentable_id: @comment.id, commentable_type: "Comment"}}
    end
  end

  test "valid comment creation on valid post" do
    login_as(@user)
    get root_path
    assert_difference 'Post.count', 1 do
      post comments_path, params: { comment: {content: "comment1", commentable_id: @post, commentable_type: "Post"}}
    end
  end

  test "valid comment creation on valid comment" do
    login_as(@user)
    get root_path
    assert_difference 'Post.count', 1 do
      post comments_path, params: { comment: {content: "comment2", commentable_id: @comment, commentable_type: "Comment"}}
    end
  end
end
