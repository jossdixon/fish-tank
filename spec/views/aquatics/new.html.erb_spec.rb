require 'rails_helper'

RSpec.describe "aquatics/new", type: :view do
  before(:each) do
    assign(:aquatic, Aquatic.new(
      nick_name: "MyString",
      common_name: "MyString",
      scientific_name: "MyString",
      length: 1,
      max_lifespan: 1,
      user: nil,
      notes: "MyString"
    ))
  end

  it "renders new aquatic form" do
    render

    assert_select "form[action=?][method=?]", aquatics_path, "post" do

      assert_select "input[name=?]", "aquatic[nick_name]"

      assert_select "input[name=?]", "aquatic[common_name]"

      assert_select "input[name=?]", "aquatic[scientific_name]"

      assert_select "input[name=?]", "aquatic[length]"

      assert_select "input[name=?]", "aquatic[max_lifespan]"

      assert_select "input[name=?]", "aquatic[user_id]"

      assert_select "input[name=?]", "aquatic[notes]"
    end
  end
end
