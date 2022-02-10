 require 'rails_helper'

RSpec.describe "/aquatics", type: :request do

  # Aquatic. As you add validations to Aquatic, be sure to
  # adjust the attributes here as well.

  current_user = User.first_or_create!(email: 'terence@mail.com', password: 'password', password_confirmation: 'password')

  let(:valid_attributes) do
    {
      'id' => '1',
      'nick_name' => 'test',
      'common_name' => 'testy',
      'scientific_name' => 'test test',
      'purchased_on' =>'2022-01-01',
      'sex' => 'male',
      'length' => 5,
      'max_lifespan' => 5,
      'notes' => 'testy notes test'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'nick_name' => 'a',
      'common_name' => 'a',
      'scientific_name' => 'a',
      'sex' => '',
      'purchased_on' => 'a',
      'length' => 'a',
      'max_lifespan' => 'a',
      'notes' => ''
    }
  end


  describe "GET /index" do
    it "renders a successful response" do
      aquatic = Aquatic.new(valid_attributes)
      aquatic.user = current_user
      aquatic.save
      get aquatics_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      aquatic = Aquatic.new(valid_attributes)
      aquatic.user = current_user
      aquatic.save
      get aquatic_url(aquatic)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_aquatic_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      aquatic = Aquatic.new(valid_attributes)
      aquatic.user = current_user
      aquatic.save
      get edit_aquatic_url(aquatic)
      expect(response).to be_successful
    end
  end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Aquatic" do
  #       expect {
  #         post aquatics_url, params: { aquatic: valid_attributes }
  #       }.to change(Aquatic, :count).by(1)
  #     end

  #     it "redirects to the created aquatic" do
  #       post aquatics_url, params: { aquatic: valid_attributes }
  #       expect(response).to redirect_to(aquatic_url(Aquatic.last))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new Aquatic" do
  #       expect {
  #         post aquatics_url, params: { aquatic: invalid_attributes }
  #       }.to change(Aquatic, :count).by(0)
  #     end

  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post aquatics_url, params: { aquatic: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested aquatic" do
  #       aquatic = Aquatic.create! valid_attributes
  #       patch aquatic_url(aquatic), params: { aquatic: new_attributes }
  #       aquatic.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the aquatic" do
  #       aquatic = Aquatic.create! valid_attributes
  #       patch aquatic_url(aquatic), params: { aquatic: new_attributes }
  #       aquatic.reload
  #       expect(response).to redirect_to(aquatic_url(aquatic))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       aquatic = Aquatic.create! valid_attributes
  #       patch aquatic_url(aquatic), params: { aquatic: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested aquatic" do
  #     aquatic = Aquatic.create! valid_attributes
  #     expect {
  #       delete aquatic_url(aquatic)
  #     }.to change(Aquatic, :count).by(-1)
  #   end

  #   it "redirects to the aquatics list" do
  #     aquatic = Aquatic.create! valid_attributes
  #     delete aquatic_url(aquatic)
  #     expect(response).to redirect_to(aquatics_url)
  #   end
  # end
end
