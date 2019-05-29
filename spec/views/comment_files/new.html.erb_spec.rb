require 'rails_helper'

RSpec.describe "comment_files/new", type: :view do
  before(:each) do
    assign(:comment_file, CommentFile.new(
      :comment => nil,
      :file => ""
    ))
  end

  it "renders new comment_file form" do
    render

    assert_select "form[action=?][method=?]", comment_files_path, "post" do

      assert_select "input[name=?]", "comment_file[comment_id]"

      assert_select "input[name=?]", "comment_file[file]"
    end
  end
end
