require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  let(:member) {
    Member.create!(
      name: "MyString",
      email: "MyString",
      password: "MyString"
    )
  }

  before(:each) do
    assign(:member, member)
  end

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", member_path(member), "post" do

      assert_select "input[name=?]", "member[name]"

      assert_select "input[name=?]", "member[email]"

      assert_select "input[name=?]", "member[password]"
    end
  end
end
