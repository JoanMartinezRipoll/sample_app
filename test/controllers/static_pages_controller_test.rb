require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
     @base_title = "Ruby on Rails Tutorial Sample App"
  end

 test "should get home" do
    get :home
    assert_response :success
    # assert_select lets us test for the presence of a particular HTML tag 
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    #I try something different here, since I included the ApplicationHelper, i can use the full_title method
    assert_select "title", full_title("Help")
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end