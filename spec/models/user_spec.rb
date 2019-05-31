require "rails_helper"

RSpec.describe User, :type => :model do

  before(:each) do
    @user = create(:user)
  end

  # Model relations
  describe "Model relations" do

    it "User has many projects" do
      should have_many(:projects)
    end

    it "User has many tasks" do
      should have_many(:tasks)
    end

    it "User has many comments" do
      should have_many(:comments)
    end

  end

  # Creating validation
  describe "Creating" do
    it "We should have now new User created" do
      expect(User.all.count).to eq(1)
    end
  end

  # Require fields validation
  describe "Require validations" do
    it "first_name must be require" do
      should validate_presence_of(:first_name)
    end

    it "last_name must be require" do
      should validate_presence_of(:last_name)
    end

    it "email must be require" do
      should validate_presence_of(:email)
    end
  end

end
