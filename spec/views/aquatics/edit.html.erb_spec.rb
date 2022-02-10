require 'rails_helper'

RSpec.describe "aquatics/edit", type: :view do
  before(:each) do
    @aquatic = assign(:aquatic, Aquatic.create!(
      nick_name: "MyString",
      common_name: "MyString",
      scientific_name: "MyString",
      length: 1,
      max_lifespan: 1,
      user: nil,
      notes: "MyString"
    ))
  end

  it "renders the edit aquatic form" do
    render

    assert_select "form[action=?][method=?]", aquatic_path(@aquatic), "post" do

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
