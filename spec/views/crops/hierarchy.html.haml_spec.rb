require 'rails_helper'

describe "crops/hierarchy" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @tomato = FactoryGirl.create(:tomato)
    @roma = FactoryGirl.create(:crop, :name => 'Roma tomato', :parent => @tomato)
    assign(:crops, [@tomato, @roma])
    render
  end

  it "shows crop hierarchy" do
    assert_select "ul>li>ul>li", :text => @roma.name
  end
end
