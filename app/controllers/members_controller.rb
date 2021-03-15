class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @members = Member.all

    render json: @members, each_serializer: MemberIndexSerializer
  end

  # GET /members/1
  def show
    render json: MemberShowSerializer.new(@member).to_json
  end

  # POST /members
  def create
    if create_member
      serializer = MemberShowSerializer.new(@member)
      render json: serializer.to_json, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :url)
  end

  def create_member
    @member = Member.new(member_params)
    return unless @member.valid?

    # TODO: move to job
    @member.topics = Scraper.extract_headings(@member.url).join(', ')
    @member.short_url = UrlShortener.shorten(@member.url)
    @member.save
  end
end
