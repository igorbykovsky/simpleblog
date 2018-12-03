require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "can see main page" do
    get "/"
    assert_select "h1", "All our posts"
  end

  test "can create a post" do
    sign_in users(:user_one)

    get "/admin/posts/new"
    assert_response :success

    # post = Post.new(title: "Can create", body: "body of my integraion test post")
    post = posts(:one)
    post "/admin/posts",
         params: { post: { title: post.title, body: post.body} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", post.body
  end
end
