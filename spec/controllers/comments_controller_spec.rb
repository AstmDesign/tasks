require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before(:each) do
    @comment = create(:comment)
  end

  # Testing index
  describe "GET #index" do
    it "Listing the comment" do
      get :index
      assigns(:comments).should eq([@comment])
    end

    it "Renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  # Testing show
  describe "GET #show" do
    it "assigns the requested comment to @comment" do
      get :show, params: {id: @comment}
      assigns(:comment).should eq(@comment)
    end

    it "Renders the #show view" do
      get :show, params: {id: @comment}
      response.should render_template :show
    end
  end

  # Testing create
  describe "comment create" do
    context "with valid attributes" do
      it "creates a new comment" do
        post :create, params: {comment: FactoryBot.build(:comment).attributes}
        expect(Comment.all.count).to eq(1)
      end

      it "redirects to the new comment" do
        post :create, params: {comment: FactoryBot.build(:comment).attributes}
        expect(response).to render_template :new
      end
    end

    context "with invalid attributes" do
      it "does not save the new comment" do
        expect{
          post :create, params: {comment: FactoryBot.attributes_for(:invalid_comment)}
        }.to_not change(Comment,:count)
      end

      it "re-renders the new method" do
        post :create, params: {comment: FactoryBot.attributes_for(:invalid_comment)}
        response.should render_template :new
      end
    end
  end

  # Testing update
  describe 'PUT update' do

    context "valid attributes" do
      it "located the requested comment" do
        put :update, params: {id: @comment, comment: FactoryBot.attributes_for(:comment)}
        assigns(:comment).should eq(@comment)
      end

      it "changes comment attributes" do
        put :update, params: {id: @comment, comment: FactoryBot.attributes_for(:comment, comment: "new comment")}
        @comment.reload
        @comment.comment.should eq("new comment")
      end

      it "redirects to the updated comment" do
        put :update, params: {id: @comment, comment: FactoryBot.attributes_for(:comment)}
        response.should redirect_to @comment
      end
    end

    context "invalid attributes" do
      it "locates the requested comment" do
        put :update, params: {id: @comment, comment: FactoryBot.attributes_for(:invalid_comment)}
        assigns(:comment).should eq(@comment)
      end

      it "does not change comment attributes" do
        put :update, params: {id: @comment, comment: FactoryBot.attributes_for(:comment, comment: nil)}
        @comment.reload
        @comment.comment.should eq("Comment for test")
      end

      it "re-renders the edit method" do
        put :update, params: {id: @comment, comment: FactoryBot.attributes_for(:invalid_comment)}
        response.should render_template :edit
      end
    end
  end

  # Testing delete
  describe 'DELETE destroy' do
    it "deletes the comment" do
      expect{
        delete :destroy, params: {id: @comment}
      }.to change(Comment,:count).by(-1)
    end

    it "redirects to comment#index" do
      delete :destroy, params: {id: @comment}
      expect(@comment).to redirect_to comments_url
    end
  end

end
