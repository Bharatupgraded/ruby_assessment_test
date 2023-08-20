# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:user) { User.create(name: "Example User", age: 25, kind: "regular") }

    it "returns a successful response" do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let(:user) { User.create(name: "Example User", age: 25, kind: "regular") }

    it "returns a successful response" do
      get :edit, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post :create, params: { user: { name: "John", age: 30, kind: "regular" } }
        }.to change(User, :count).by(1)
      end

      it "redirects to the user show page" do
        post :create, params: { user: { name: "John", age: 30, kind: "regular" } }
        expect(response).to redirect_to(user_path(User.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect {
          post :create, params: { user: { name: nil, age: 30, kind: "regular" } }
        }.not_to change(User, :count)
      end

      it "renders the new template again" do
        post :create, params: { user: { name: nil, age: 30, kind: "regular" } }
        expect(response).to render_template(:new)
      end
    end
  end

end
