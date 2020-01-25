require "rails_helper"

RSpec.describe "V1::Auth::Sessions", type: :request do
  describe "POST /v1/auth/sign_in" do
    it "creates a new token for user in system" do
      user = FactoryBot.create(:user)
      post v1_auth_sign_in_path, params: { email: user.email, password: user.password }
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)
      expect(json.length).to eq 2
    end

    it "gives 401 if invalid credentials provided" do
      user = FactoryBot.create(:user)
      post v1_auth_sign_in_path, params: { email: user.email, password: "abcd" }
      expect(response).to have_http_status(401)
      json = JSON.parse(response.body)
      expect(json.length).to eq 1
    end
  end

  describe "GET /v1/auth/validate_token" do
    let(:user) { FactoryBot.create(:user) }
    it "returns user self" do
      headers = sign_in_test_headers user
      get v1_auth_validate_token_path, headers: headers
      expect(response).to have_http_status(200)
    end
    it "gives error if user not signed in" do
      get v1_auth_validate_token_path
      expect(response).to have_http_status(401)
    end
  end
end
