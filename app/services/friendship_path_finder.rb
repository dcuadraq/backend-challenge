class FriendshipPathFinder
  def self.find(origin, goal)
    obj = new(origin, goal)
    obj.search
  end

  def initialize(origin, goal)
    @origin = origin
    @goal = goal
    @skip = Set.new
  end

  def search(member = @origin, goal = @goal, path = FriendshipPath.new(member))
    @skip << member.id
    path.add_friend(member)
    if member.friends_ids.include? goal.id
      path.add_friend(goal)
      return path
    end
    matchs = unsearched_friends(member).map { |f| search(f, goal, path.clone) }
    matchs.compact.first
  end

  private

  def unsearched_friends(member)
    member.friends.where.not(id: @skip)
  end
end
