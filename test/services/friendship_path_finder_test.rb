require 'test_helper'

class FriendshipPathFinderTest < ActiveSupport::TestCase
  setup do
    @member = members(:one)
    @member2 = members(:two)
    @member3 = members(:three)
    @member4 = members(:four)
    @member5 = members(:five)
  end

  test '#find' do
    path = FriendshipPathFinder.find(@member, @member4)
    assert_equal path.path.to_a, [@member, @member2, @member3, @member4]
  end

  test '#find returns shorter path' do
    path = FriendshipPathFinder.find(@member, @member5)
    assert_equal path.path.to_a, [@member, @member2, @member5]
  end
end
