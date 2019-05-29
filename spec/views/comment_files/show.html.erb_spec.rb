require 'rails_helper'

RSpec.describe "comment_files/show", type: :view do
  before(:each) do
    @comment_file = assign(:comment_file, CommentFile.create!(
      :comment => nil,
      :file => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
