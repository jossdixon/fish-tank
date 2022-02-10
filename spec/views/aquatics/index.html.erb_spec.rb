require 'rails_helper'

RSpec.describe "aquatics/index", type: :view do
  current_user = User.first_or_create!(email: 'terence@mail.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    assign(:aquatics, [
      Aquatic.create!(
        nick_name: "nickname",
        common_name: "common name",
        scientific_name: "scientific name",
        sex: 'male',
        purchased_on: '2022-02-02',
        length: 10,
        max_lifespan: 5,
        user: current_user,
        notes: "These are the testing notes"
      ),
      Aquatic.create!(
        nick_name: "nickname",
        common_name: "common name",
        scientific_name: "scientific name",
        sex: 'male',
        purchased_on: '2022-02-02',
        length: 20,
        max_lifespan: 5,
        user: current_user,
        notes: "These are the testing notes"
      )
      ])
    end

    it "renders a list of aquatics" do
      render
      assert_select "tr>td", text: "nickname".to_s, count: 2
      assert_select "tr>td", text: "common name".to_s, count: 2
      assert_select "tr>td", text: "scientific name".to_s, count: 2
      assert_select "tr>td", text: current_user.id.to_s, count: 2
      assert_select "tr>td", text: 5.to_s, count: 2
      assert_select "tr>td", text: '2022-02-02'.to_s, count: 2
      assert_select "tr>td", text: 'male'.to_s, count: 2
      assert_select "tr>td", text: "These are the testing notes".to_s, count: 2
      assert_select "tr>td", text: 10.to_s, count: 1
      assert_select "tr>td", text: 20.to_s, count: 1
    end
  end
