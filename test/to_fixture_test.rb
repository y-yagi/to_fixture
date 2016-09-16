require 'test_helper'

class ToFixtureTest < Minitest::Test
  def test_to_fixture
    user = User.create!(name: 'to_fixture', email: 'to_fixture@example.com')

    expected = "users_#{user.id}:\n  name: to_fixture\n  email: to_fixture@example.com"
    assert_equal expected, user.to_fixture
  end

  def test_to_fixture_with_label
    user = User.create!(name: 'fixture_with_label', email: 'fixture_with_label@example.com')

    expected = "with_label:\n  name: fixture_with_label\n  email: fixture_with_label@example.com"
    assert_equal expected, user.to_fixture('with_label')
  end

  def test_to_fixture_with_relation
    user_1 = User.create!(name: 'to_fixture1', email: 'to_fixture1@example.com')
    user_2 = User.create!(name: 'to_fixture2', email: 'to_fixture2@example.com')
    user_3 = User.create!(name: 'to_fixture3', email: 'to_fixture3@example.com')

    users = User.where(id: [user_1.id, user_2.id, user_3.id])
    expected = <<-EOS
users_#{user_1.id}:
  name: to_fixture1
  email: to_fixture1@example.com

users_#{user_2.id}:
  name: to_fixture2
  email: to_fixture2@example.com

users_#{user_3.id}:
  name: to_fixture3
  email: to_fixture3@example.com
EOS
    assert_equal expected, users.to_fixture + "\n"
  end
end
