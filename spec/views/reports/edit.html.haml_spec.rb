require 'spec_helper'

describe "reports/edit" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :name => "MyString",
      :content => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :gmaps => false
    ))
  end

  it "renders the edit report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", report_path(@report), "post" do
      assert_select "input#report_name[name=?]", "report[name]"
      assert_select "input#report_content[name=?]", "report[content]"
      assert_select "input#report_latitude[name=?]", "report[latitude]"
      assert_select "input#report_longitude[name=?]", "report[longitude]"
      assert_select "input#report_gmaps[name=?]", "report[gmaps]"
    end
  end
end
