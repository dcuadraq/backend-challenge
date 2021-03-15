class FriendshipPath
  def initialize(origin)
    @origin = origin
    @path = Set.new([origin])
  end

  def add_friend(friend)
    @path << friend
  end

  def path
    @path.to_a
  end

  private

  def initialize_copy(new_obj)
    @path = @path.clone
    super
  end
end
