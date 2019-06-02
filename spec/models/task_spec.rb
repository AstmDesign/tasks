require "rails_helper"

RSpec.describe Task, :type => :model do

  before(:each) do
    @task = create(:task)
  end

  # Model relations
  describe "Model relations" do

    it "Task has many comments" do
      should have_many(:comments)
    end

    it "Task belongs to user" do
      should belong_to(:user)
    end

    it "Task belongs to project" do
      should belong_to(:project)
    end

  end

  # Creating validation
  describe "Creating" do
    it "We should have now new task created" do
      expect(Task.all.count).to eq(1)
    end
  end

  # Require fields validation
  describe "Require validations" do
    it "title must be require" do
      should validate_presence_of(:title)
    end

    it "status must be require" do
      should validate_presence_of(:status)
    end
    
    it "deadline must be require" do
      should validate_presence_of(:deadline)
    end
  end

end
