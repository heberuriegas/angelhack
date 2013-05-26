require 'spec_helper'

describe "responses/new" do
  before(:each) do
    assign(:response, stub_model(Response,
      :content => "MyString",
      :question => nil
    ).as_new_record)
  end

  it "renders new response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", responses_path, "post" do
      assert_select "input#response_content[name=?]", "response[content]"
      assert_select "input#response_question[name=?]", "response[question]"
    end
  end
end
