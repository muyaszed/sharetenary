require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  describe "GET #like_itenary" do
    it "returns http success" do
      get :like_itenary
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unlike_itenary" do
    it "returns http success" do
      get :unlike_itenary
      expect(response).to have_http_status(:success)
    end
  end

end
