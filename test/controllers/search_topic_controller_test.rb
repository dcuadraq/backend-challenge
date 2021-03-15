require 'test_helper'

class SearchTopicControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test 'should get index' do
    params = { q: 'elixir' }
    get member_search_topic_index_path(@member), params: params
  end
end
