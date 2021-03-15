class FriendshipPathSerializer < ActiveModel::Serializer
  attributes :name, :url, :friend

  def name
    current_member.name
  end

  def url
    current_member.url
  end

  def friend
    return nil if object.empty?

    FriendshipPathSerializer.new(object)
  end

  private

  def current_member
    @current_member ||= object.shift
  end
end
