require 'spec_helper'

describe "responses/edit" do
  before(:each) do
    @response = assign(:response, stub_model(Response,
      :content => "MyString",
      :question => nil
    ))
  end

  it "renders the edit response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", response_path(@response), "post" do
      assert_select "input#response_content[name=?]", "response[content]"
      assert_select "input#response_question[name=?]", "response[question]"
    end
  end
end
