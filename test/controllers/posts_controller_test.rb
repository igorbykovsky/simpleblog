require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    sign_in users(:user_one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post admin_posts_url, params: { post: { title: "can create func title", body: "body of our functional test" } }
    end

    assert_redirected_to post_url(Post.last)
    assert_equal "Post has been created", flash[:success]
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch admin_post_url(@post), params: { post: { body: "updated body of our functional test" } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete admin_post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test "testing_ajax" do
    get post_url(@post), xhr: true

    assert_match 'MyText1', @response.body
    assert_equal "text/html", @response.content_type
  end

  test "testing flash meassages" do

  end
end
