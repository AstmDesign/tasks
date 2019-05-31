require "rails_helper"

RSpec.describe Comment, :type => :model do

  before(:each) do
    @comment = create(:comment)
  end

  # Model relations
  describe "Model relations" do

    it "Comment has many comment files" do
      should have_many(:comment_files)
    end

    it "Comment belongs to user" do
      should belong_to(:user)
    end

    it "Comment belongs to task" do
      should belong_to(:task)
    end

  end

  # Creating validation
  describe "Creating" do
    it "We should have now new comment created" do
      expect(Comment.all.count).to eq(1)
    end
  end

  # Require fields validation
  describe "Require validations" do
    it "comment must be require" do
      should validate_presence_of(:comment)
    end
  end

end
