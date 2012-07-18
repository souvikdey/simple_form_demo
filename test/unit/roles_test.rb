require 'test_helper'

class RolesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Roles.new.valid?
  end
end
