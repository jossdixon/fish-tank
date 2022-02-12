require 'rails_helper'

RSpec.describe "aquatics/edit", type: :view do
  current_user = User.first_or_create!(email: 'terence@mail.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    @aquatic = assign(:aquatic, Aquatic.create!(
      nick_name: "nickname",
      common_name: "common name",
      scientific_name: "scientific name",
      sex: 'male',
      purchased_on: '2022-01-01',
      length: 1,
      max_lifespan: 1,
      user: current_user,
      notes: "These are the testing notes"
    ))
  end

  it "renders the edit aquatic form" do
    render

    assert_select "form[action=?][method=?]", aquatic_path(@aquatic), "post" do
      assert_select "input[name=?]", "aquatic[nick_name]"
      assert_select "input[name=?]", "aquatic[common_name]"
      assert_select "input[name=?]", "aquatic[scientific_name]"
      assert_select "select[name=?]", "aquatic[purchased_on(1i)]"
      assert_select "select[name=?]", "aquatic[purchased_on(2i)]"
      assert_select "select[name=?]", "aquatic[purchased_on(3i)]"
      assert_select "select[name=?]", "aquatic[sex]"
      assert_select "input[name=?]", "aquatic[length]"
      assert_select "input[name=?]", "aquatic[max_lifespan]"
      assert_select "input[name=?]", "aquatic[notes]"
    end
  end
end
