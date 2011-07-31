require 'spec_helper'

describe "shots/index.html.erb" do
  before(:each) do
    assign(:shots, [
      stub_model(Shot,
        :content => "Content",
        :user_id => 1
      ),
      stub_model(Shot,
        :content => "Content",
        :user_id => 1
      )
    ])
  end

  it "renders a list of shots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
