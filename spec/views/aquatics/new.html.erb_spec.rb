require 'rails_helper'

RSpec.describe "aquatics/new", type: :view do
  current_user = User.first_or_create!(email: 'me@mail.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    assign(:aquatic, Aquatic.new(
        nick_name: "nickname",
        common_name: "common name",
        scientific_name: "scientific name",
        sex: 'male',
        purchased_on: Date.new(2022, 02, 02),
        length: 10,
        max_lifespan: 5,
        user: current_user,
        notes: "These are the testing notes"
    ))
  end

  it "renders new aquatic form" do
    render
    assert_select "form[action=?][method=?]", aquatics_path, "post" do
      assert_select "input[name=?]", "aquatic[nick_name]"
      assert_select "input[name=?]", "aquatic[common_name]"
      assert_select "input[name=?]", "aquatic[scientific_name]"
      assert_select "input[name=?]", "aquatic[purchased_on]"
      assert_select "input[name=?]", "aquatic[sex]"
      assert_select "input[name=?]", "aquatic[length]"
      assert_select "input[name=?]", "aquatic[max_lifespan]"
      assert_select "input[name=?]", "aquatic[notes]"
    end
  end
end
