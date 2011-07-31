require 'spec_helper'

describe "shots/new.html.erb" do
  before(:each) do
    assign(:shot, stub_model(Shot,
      :content => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new shot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shots_path, :method => "post" do
      assert_select "input#shot_content", :name => "shot[content]"
      assert_select "input#shot_user_id", :name => "shot[user_id]"
    end
  end
end
