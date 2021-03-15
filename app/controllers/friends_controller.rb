class FriendsController < ApplicationController
  before_action :set_member, only: [:index, :create]

  # GET /members
  def index
    @friends = @member.friends

    render json: @friends
  end

  def create
    friend = Member.find_by!(url: params['url'])
    Friendship.make_friends(@member, friend)
    render json: @member, status: :created, location: member_friends_path(@member)
  end

  private

  def set_member
    @member = Member.find(params[:member_id])
  end
end
