require 'spec_helper'

describe "reports/index" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :name => "Name",
        :content => "Content",
        :latitude => 1.5,
        :longitude => 1.5,
        :gmaps => false
      ),
      stub_model(Report,
        :name => "Name",
        :content => "Content",
        :latitude => 1.5,
        :longitude => 1.5,
        :gmaps => false
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
