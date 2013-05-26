require 'spec_helper'

describe "votes/edit" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :report => nil,
      :user => nil,
      :calification => false
    ))
  end

  it "renders the edit vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do
      assert_select "input#vote_report[name=?]", "vote[report]"
      assert_select "input#vote_user[name=?]", "vote[user]"
      assert_select "input#vote_calification[name=?]", "vote[calification]"
    end
  end
end
