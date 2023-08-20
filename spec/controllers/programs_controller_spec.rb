# spec/controllers/programs_controller_spec.rb
require 'rails_helper'

RSpec.describe ProgramsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:program) { Program.create(name: "Example Program") }

    it "returns a successful response" do
      get :show, params: { id: program.id }
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
    let(:program) { Program.create(name: "Example Program") }

    it "returns a successful response" do
      get :edit, params: { id: program.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new program" do
        expect {
          post :create, params: { program: { name: "New Program" } }
        }.to change(Program, :count).by(1)
      end

      it "redirects to the program show page" do
        post :create, params: { program: { name: "New Program" } }
        expect(response).to redirect_to(program_path(Program.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new program" do
        expect {
          post :create, params: { program: { name: nil } }
        }.not_to change(Program, :count)
      end

      it "renders the new template again" do
        post :create, params: { program: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

end
