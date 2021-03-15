class Friendship
  def self.make_friends(member, new_friend)
    return if member.friends_ids.include? new_friend.id

    member.friends_ids << new_friend.id
    new_friend.friends_ids << member.id
    member.save
    new_friend.save
  end
end
