require 'test_helper'

class ToFixtureTest < Minitest::Test
  def test_to_fixture
    user = User.create!(name: 'to_fixture', email: 'to_fixture@example.com')

    expected = "users_1:\n  name: to_fixture\n  email: to_fixture@example.com"
    assert_equal expected, user.to_fixture
  end

  def test_to_fixture_with_label
    user = User.create!(name: 'fixture_with_label', email: 'fixture_with_label@example.com')

    expected = "with_label:\n  name: fixture_with_label\n  email: fixture_with_label@example.com"
    assert_equal expected, user.to_fixture('with_label')
  end
end
