require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  setup do
    @member = members(:one)
    @member2 = members(:two)
    @member.update!(friends_ids: [])
    @member2.update!(friends_ids: [])
  end

  test '#make_friends ' do
    Friendship.make_friends(@member, @member2)
    assert_includes @member.reload.friends_ids, @member2.id
    assert_includes @member2.reload.friends_ids, @member.id
  end
end
