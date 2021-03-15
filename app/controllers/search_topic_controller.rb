class SearchTopicController < ApplicationController
  before_action :set_member

  def index
    ids = @member.friends_ids
    ids << @member.id
    matches = Member.where.not(id: ids).search_topics(params['q'])
  end

  private

  def set_member
    @member = Member.find(params[:member_id])
  end
end
