require 'spec_helper'

describe "reports/show" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :name => "Name",
      :content => "Content",
      :latitude => 1.5,
      :longitude => 1.5,
      :gmaps => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Content/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/false/)
  end
end
