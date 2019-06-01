require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  before(:each) do
    @task = create(:task)
  end

  # Testing index
  describe "GET #index" do
    it "Listing the task" do
      get :index
      assigns(:tasks).should eq([@task])
    end

    it "Renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  # Testing show
  describe "GET #show" do
    it "assigns the requested task to @task" do
      get :show, params: {id: @task}
      assigns(:task).should eq(@task)
    end

    it "Renders the #show view" do
      get :show, params: {id: @task}
      response.should render_template :show
    end
  end

  # Testing create
  describe "Task create" do
    context "with valid attributes" do
      it "creates a new task" do
        post :create, params: {task: FactoryBot.build(:task).attributes}
        expect(Task.all.count).to eq(1)
      end

      it "redirects to the new task" do
        post :create, params: {task: FactoryBot.build(:task).attributes}
        expect(response).to render_template :new
      end
    end

    context "with invalid attributes" do
      it "does not save the new task" do
        expect{
          post :create, params: {task: FactoryBot.attributes_for(:invalid_task)}
        }.to_not change(Task,:count)
      end

      it "re-renders the new method" do
        post :create, params: {task: FactoryBot.attributes_for(:invalid_task)}
        response.should render_template :new
      end
    end
  end

  # Testing update
  describe 'PUT update' do

    context "valid attributes" do
      it "located the requested task" do
        put :update, params: {id: @task, task: FactoryBot.attributes_for(:task)}
        assigns(:task).should eq(@task)
      end

      it "changes task attributes" do
        put :update, params: {id: @task, task: FactoryBot.attributes_for(:task, title: "new title", details: "new details", deadline: "2019-05-31 10:00:00", priority: "2")}
        @task.reload
        @task.title.should eq("new title")
        @task.details.should eq("new details")
        @task.deadline.should eq("2019-05-31 10:00:00")
        @task.priority.should eq("2")
      end

      it "redirects to the updated task" do
        put :update, params: {id: @task, task: FactoryBot.attributes_for(:task)}
        response.should redirect_to @task
      end
    end

    context "invalid attributes" do
      it "locates the requested task" do
        put :update, params: {id: @task, task: FactoryBot.attributes_for(:invalid_task)}
        assigns(:task).should eq(@task)
      end

      it "does not change task attributes" do
        put :update, params: {id: @task, task: FactoryBot.attributes_for(:task, title: "ar new", deadline: nil)}
        @task.reload
        @task.title.should eq("test title")
        @task.details.should eq("test details")
        @task.deadline.should eq("2019-05-31 22:00:00")
      end

      it "re-renders the edit method" do
        put :update, params: {id: @task, task: FactoryBot.attributes_for(:invalid_task)}
        response.should render_template :edit
      end
    end
  end

  # Testing delete
  describe 'DELETE destroy' do
    it "deletes the task" do
      expect{
        delete :destroy, params: {id: @task}
      }.to change(Task,:count).by(-1)
    end

    it "redirects to task#index" do
      delete :destroy, params: {id: @task}
      expect(@task).to redirect_to tasks_url
    end
  end

end
