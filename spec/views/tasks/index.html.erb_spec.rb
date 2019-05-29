require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :title => "Title",
        :details => "MyText",
        :priority => "Priority",
        :status => 2
      ),
      Task.create!(
        :title => "Title",
        :details => "MyText",
        :priority => "Priority",
        :status => 2
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Priority".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
