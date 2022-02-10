require "rails_helper"

RSpec.describe AquaticsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/aquatics").to route_to("aquatics#index")
    end

    it "routes to #new" do
      expect(get: "/aquatics/new").to route_to("aquatics#new")
    end

    it "routes to #show" do
      expect(get: "/aquatics/1").to route_to("aquatics#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/aquatics/1/edit").to route_to("aquatics#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/aquatics").to route_to("aquatics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/aquatics/1").to route_to("aquatics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/aquatics/1").to route_to("aquatics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/aquatics/1").to route_to("aquatics#destroy", id: "1")
    end
  end
end
