require 'rails_helper'

RSpec.describe "aquatics/show", type: :view do
  before(:each) do
    @aquatic = assign(:aquatic, Aquatic.create!(
      nick_name: "Nick Name",
      common_name: "Common Name",
      scientific_name: "Scientific Name",
      length: 2,
      max_lifespan: 3,
      user: nil,
      notes: "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nick Name/)
    expect(rendered).to match(/Common Name/)
    expect(rendered).to match(/Scientific Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Notes/)
  end
end
