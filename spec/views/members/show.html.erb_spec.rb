require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    assign(:member, Member.create!(
      name: "Name",
      email: "Email",
      password: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
  end
end
