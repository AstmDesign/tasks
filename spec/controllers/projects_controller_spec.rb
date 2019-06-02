require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  before(:each) do
    @project = create(:project)
  end

  # Testing index
  describe "GET #index" do
    it "Listing the project" do
      get :index
      assigns(:projects).should eq([@project])
    end

    it "Renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  # Testing show
  describe "GET #show" do
    it "assigns the requested project to @project" do
      get :show, params: {id: @project}
      assigns(:project).should eq(@project)
    end

    it "Renders the #show view" do
      get :show, params: {id: @project}
      response.should render_template :show
    end
  end

  # Testing create
  describe "Project create" do
    context "with valid attributes" do
      it "creates a new project" do
        post :create, params: {project: FactoryBot.build(:project).attributes}
        expect(Project.all.count).to eq(1)
      end

      it "redirects to the new project" do
        post :create, params: {project: FactoryBot.build(:project).attributes}
        expect(response).to render_template :new
      end
    end

    context "with invalid attributes" do
      it "does not save the new project" do
        post :create, params: {project: FactoryBot.attributes_for(:invalid_project)}
        expect(response).to_not change(Project,:count)
      end

      it "re-renders the new method" do
        post :create, params: {project: FactoryBot.attributes_for(:invalid_project)}
        response.should render_template :new
      end
    end
  end

  # Testing update
  describe 'PUT update' do

    context "valid attributes" do
      it "located the requested project" do
        put :update, params: {id: @project, project: FactoryBot.attributes_for(:project)}
        assigns(:project).should eq(@project)
      end

      it "changes project attributes" do
        put :update, params: {id: @project, project: FactoryBot.attributes_for(:project, name: "new project", details: "new details", status: "in_progress")}
        @project.reload
        @project.name.should eq("new project")
        @project.details.should eq("new details")
        @project.status.should eq("in_progress")
      end

      it "redirects to the updated project" do
        put :update, params: {id: @project, project: FactoryBot.attributes_for(:project)}
        response.should redirect_to @project
      end
    end

    context "invalid attributes" do
      it "locates the requested project" do
        put :update, params: {id: @project, project: FactoryBot.attributes_for(:invalid_project)}
        assigns(:project).should eq(@project)
      end

      it "does not change project attributes" do
        put :update, params: {id: @project, project: FactoryBot.attributes_for(:project, name: nil, details: "new details", status: nil)}
        @project.reload
        @project.name.should eq("Project for test")
        @project.details.should eq("Just for testing")
        @project.status.should eq("in_progress")
      end

      it "re-renders the edit method" do
        put :update, params: {id: @project, project: FactoryBot.attributes_for(:invalid_project)}
        response.should render_template :edit
      end
    end
  end

  # Testing delete
  describe 'DELETE destroy' do
    it "deletes the project" do
      expect{
        delete :destroy, params: {id: @project}
      }.to change(Project,:count).by(-1)
    end

    it "redirects to project#index" do
      delete :destroy, params: {id: @project}
      expect(@project).to redirect_to projects_url
    end
  end

end
