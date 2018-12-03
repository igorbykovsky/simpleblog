require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not save post" do
    u = users(:user_one)
    assert u.email = "user_one@test.com"
    post = Post.new
    assert_not post.save
  end
end
