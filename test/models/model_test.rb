require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  test "the truth" do
    good_model = Model.find(1)
    wrong_model = Model.find(2)
    assert_not(wrong_model.year <= Date.today.year)
    assert(good_model.year<= Date.today.year)
    good_model = Model.find(1)
  end
end
