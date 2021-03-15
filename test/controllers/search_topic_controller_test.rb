require 'test_helper'

class SearchTopicControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
    @member2 = members(:two)
    @member3 = members(:three)
    @member4 = members(:four)
  end

  test 'should path when path exist' do
    params = { q: 'C++' }
    get member_search_topic_index_path(@member), params: params
    assert_equal json_body['name'], @member.name
    assert_equal json_body['friend']['name'], @member2.name
    assert_equal json_body['friend']['friend']['name'], @member3.name
    assert_equal json_body['friend']['friend']['friend']['name'], @member4.name
  end

  test 'should 404 when no match is found' do
    params = { q: 'nan' }
    get member_search_topic_index_path(@member), params: params
    assert_response 404
  end
end
