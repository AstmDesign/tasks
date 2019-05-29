require 'rails_helper'

RSpec.describe "comment_files/edit", type: :view do
  before(:each) do
    @comment_file = assign(:comment_file, CommentFile.create!(
      :comment => nil,
      :file => ""
    ))
  end

  it "renders the edit comment_file form" do
    render

    assert_select "form[action=?][method=?]", comment_file_path(@comment_file), "post" do

      assert_select "input[name=?]", "comment_file[comment_id]"

      assert_select "input[name=?]", "comment_file[file]"
    end
  end
end
