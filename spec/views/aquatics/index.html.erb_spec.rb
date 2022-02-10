require 'rails_helper'

RSpec.describe "aquatics/index", type: :view do
  before(:each) do
    assign(:aquatics, [
      Aquatic.create!(
        nick_name: "Nick Name",
        common_name: "Common Name",
        scientific_name: "Scientific Name",
        length: 2,
        max_lifespan: 3,
        user: nil,
        notes: "Notes"
      ),
      Aquatic.create!(
        nick_name: "Nick Name",
        common_name: "Common Name",
        scientific_name: "Scientific Name",
        length: 2,
        max_lifespan: 3,
        user: nil,
        notes: "Notes"
      )
    ])
  end

  it "renders a list of aquatics" do
    render
    assert_select "tr>td", text: "Nick Name".to_s, count: 2
    assert_select "tr>td", text: "Common Name".to_s, count: 2
    assert_select "tr>td", text: "Scientific Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Notes".to_s, count: 2
  end
end
