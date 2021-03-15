class MemberSerializer < ActiveModel::Serializer
  attributes :name, :short_url, :number_of_friends

  def number_of_friends
    object.friends_ids.size
  end
end
