require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :entry => "Entry"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Entry/)
  end
end
