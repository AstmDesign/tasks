require "rails_helper"

RSpec.describe Project, :type => :model do

  before(:each) do
    @project = create(:project)
  end

  # Model relations
  describe "Model relations" do

    it "Project has many tasks" do
      should have_many(:tasks)
    end

    it "Project belongs to user" do
      should belong_to(:user)
    end

  end

  # Creating validation
  describe "Creating" do
    it "We should have now new project created" do
      expect(Project.all.count).to eq(1)
    end
  end

  # Require fields validation
  describe "Require validations" do
    it "name must be require" do
      should validate_presence_of(:name)
    end
  end

end
