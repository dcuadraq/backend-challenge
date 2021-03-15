require 'test_helper'

class FriendshipPathTest < ActiveSupport::TestCase
  setup do
    @member = members(:one)
    @member2 = members(:two)
    @member3 = members(:three)
    @member4 = members(:four)
  end

  test '#clones don\'t share data' do
    path = FriendshipPath.new(@member)
    clone = path.clone
    path.add_friend(@member2)
    assert_equal path.path.size, 2
    assert_equal clone.path.size, 1
  end
end
