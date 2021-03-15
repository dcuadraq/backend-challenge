class MemberShowSerializer < ActiveModel::Serializer
  attributes :name, :url, :short_url, :topics, :friends_links

  def friends_links
    object.friends.pluck(:url)
  end
end
