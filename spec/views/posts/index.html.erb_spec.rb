require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :entry => "Entry"
      ),
      Post.create!(
        :entry => "Entry"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Entry".to_s, :count => 2
  end
end
