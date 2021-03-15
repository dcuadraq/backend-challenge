require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  setup do
    @member = members(:one)
  end

  test 'validates presence of name' do
    member = Member.new(url: @member.url)
    refute member.valid?
    assert_includes(member.errors.messages.keys, :name)
  end

  test 'validates presence of url' do
    member = Member.new(name: 'John')
    refute member.valid?
    assert_includes(member.errors.messages.keys, :url)
  end
end
