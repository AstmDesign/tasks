require 'rails_helper'

RSpec.describe "comment_files/index", type: :view do
  before(:each) do
    assign(:comment_files, [
      CommentFile.create!(
        :comment => nil,
        :file => ""
      ),
      CommentFile.create!(
        :comment => nil,
        :file => ""
      )
    ])
  end

  it "renders a list of comment_files" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
