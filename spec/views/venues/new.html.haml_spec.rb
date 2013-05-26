require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :name => "MyString",
      :image => "MyString",
      :description => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString",
      :postalcode => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "input#venue_image[name=?]", "venue[image]"
      assert_select "textarea#venue_description[name=?]", "venue[description]"
      assert_select "input#venue_latitude[name=?]", "venue[latitude]"
      assert_select "input#venue_longitude[name=?]", "venue[longitude]"
      assert_select "input#venue_address[name=?]", "venue[address]"
      assert_select "input#venue_postalcode[name=?]", "venue[postalcode]"
      assert_select "input#venue_city[name=?]", "venue[city]"
      assert_select "input#venue_state[name=?]", "venue[state]"
      assert_select "input#venue_country[name=?]", "venue[country]"
    end
  end
end
