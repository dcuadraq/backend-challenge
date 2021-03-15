require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test 'should get index' do
    get members_url, as: :json
    keys = json_body.first.keys
    assert_includes keys, 'name'
    assert_includes keys, 'short_url'
    assert_includes keys, 'number_of_friends'
    assert_response :success
  end

  test 'should create member' do
    assert_difference('Member.count') do
      post members_url, params: { member: { name: @member.name, url: @member.url } }, as: :json
    end

    assert_response 201
  end

  test 'creating member adds short url' do
    post members_url, params: { member: { name: @member.name, url: @member.url } }, as: :json
    created_member = Member.find_by(url: json_body['url'])
    refute_nil created_member.short_url
  end

  test 'creating member extracts headings from personal website' do
    @member.destroy
    url = 'https://en.wikipedia.org/wiki/Yukihiro_Matsumoto'
    post members_url, params: { member: { name: 'John', url: url } }, as: :json
    created_member = Member.find_by(url: json_body['url'])
    assert_includes created_member.topics, 'Ruby'
  end

  test 'should show member' do
    get member_url(@member), as: :json
    assert_equal json_body['name'], 'Matz'
    assert_equal json_body['url'], 'https://en.wikipedia.org/wiki/Yukihiro_Matsumoto'
    assert_equal json_body['short_url'], 'bit.ly/3bJulz1'
    assert_equal json_body['topics'], 'Ruby'
    assert_equal json_body['friends_links'], ['https://en.wikipedia.org/wiki/David_Heinemeier_Hansson']
    assert_response :success
  end

  test 'should update member' do
    patch member_url(@member), params: { member: { name: @member.name, url: @member.url } }, as: :json
    assert_response 200
  end

  test 'should destroy member' do
    assert_difference('Member.count', -1) do
      delete member_url(@member), as: :json
    end

    assert_response 204
  end
end
