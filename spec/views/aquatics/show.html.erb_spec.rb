require 'rails_helper'

RSpec.describe "aquatics/show", type: :view do
  current_user = User.first_or_create!(email: 'terence@mail.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    @aquatic = assign(:aquatic, Aquatic.create!(
      nick_name: "nickname",
      common_name: "common name",
      scientific_name: "scientific name",
      sex: 'male',
      purchased_on: '2022-02-02',
      length: 10,
      max_lifespan: 5,
      user: current_user,
      notes: "These are the testing notes"
      ))
    end

    it "renders attributes in <p>" do
      render
      expect(rendered).to match(/nickname/)
      expect(rendered).to match(/common name/)
      expect(rendered).to match(/scientific name/)
      expect(rendered).to match(/male/)
      expect(rendered).to match(/2022-02-02/)
      expect(rendered).to match(/10/)
      expect(rendered).to match(/5/)
      expect(rendered).to match(//)
      expect(rendered).to match(/These are the testing notes/)
    end
  end
