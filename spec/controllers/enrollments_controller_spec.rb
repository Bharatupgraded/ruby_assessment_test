# spec/controllers/enrollments_controller_spec.rb
require 'rails_helper'

RSpec.describe EnrollmentsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:enrollment) { Enrollment.create(user_id: 1, program_id: 1) }

    it "returns a successful response" do
      get :show, params: { id: enrollment.id }
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
    let(:enrollment) { Enrollment.create(user_id: 1, program_id: 1) }

    it "returns a successful response" do
      get :edit, params: { id: enrollment.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new enrollment" do
        expect {
          post :create, params: { enrollment: { user_id: 1, program_id: 1 } }
        }.to change(Enrollment, :count).by(1)
      end

      it "redirects to the enrollment show page" do
        post :create, params: { enrollment: { user_id: 1, program_id: 1 } }
        expect(response).to redirect_to(enrollment_path(Enrollment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new enrollment" do
        expect {
          post :create, params: { enrollment: { user_id: nil, program_id: 1 } }
        }.not_to change(Enrollment, :count)
      end

      it "renders the new template again" do
        post :create, params: { enrollment: { user_id: nil, program_id: 1 } }
        expect(response).to render_template(:new)
      end
    end
  end

end
