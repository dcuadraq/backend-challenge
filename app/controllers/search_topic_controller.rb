class SearchTopicController < ApplicationController
  before_action :set_member

  def index
    ids = @member.friends_ids.dup << @member.id
    matchs = Member.where.not(id: ids).search_topics(params['q'])
    return record_not_found unless matchs.any?

    path = FriendshipPathFinder.find(@member, matchs.first)
    serializer = FriendshipPathSerializer.new(path.path)
    render json: serializer.to_json
  end

  private

  def set_member
    @member = Member.find(params[:member_id])
  end
end
