require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
    @member2 = members(:two)
  end

  test 'should add friend to member' do
    @member.update!(friends_ids: [])
    params = { url: @member2.url }
    post member_friends_path(@member), params: params
    assert_includes @member.reload.friends_ids, @member2.id
    assert_response 201
  end

  test 'should fail with non existing member' do
    params = { url: 'fake_url' }
    post member_friends_path(@member), params: params
    assert_response 404
  end
end
