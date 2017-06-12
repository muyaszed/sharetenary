require "rails_helper"

describe ProfilesController do
	let(:user) {FactoryGirl.create(:user)}

	context "guest" do

		it "redirect to sign in page" do
			get :show, params: {user_id: user.id, id: user.profile.id}
			expect(response).to redirect_to(new_user_session_path)
		end

	end

	context "authenticated user" do
		before do
			sign_in(user)
		end

		it "renders :show" do
			get :show, params: {user_id: user.id, id: user.profile.id}
			expect(response).to render_template(:show)

		end

		it "assign requested profile to @profile" do
			get :show, params: {user_id: user.id, id: user.profile.id}
			expect(assigns(:profile)).to eq(user.profile)

		end

	end
end