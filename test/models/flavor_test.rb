require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  should have_many(:store_flavors)
  should have_many(:stores).through(:store_flavors)

  # Test basic validations
  should validate_presence_of(:name)

  context "Creating a context for flavors" do
    setup do 
      create_flavors
    end
    
    teardown do
      remove_flavors
    end
    

    should "shows that there are four flavors in in alphabetical order" do
      assert_equal ["Vanilla", "Chocolate", "Mango", "Berry"], Flavor.alphabetical.map{|f| f.name}
    end

    should "shows that there are three active flavors" do
      assert_equal 3, Flavor.active.size
      assert_equal ["Cheesecake", "Chocolate", "Strawberry"], Flavor.active.map{|f| f.name}.sort
    end
    

    should "shows that there are two inactive flavors" do
      assert_equal 1, Flavor.inactive.size
      assert_equal ["Mango", "Berry"], Flavor.inactive.map{|f| f.name}.sort
    end
    
    should "correctly assess that flavors are not destroyable" do
      @chocolate.destroy
      @vanilla.destroy
      assert_equal ["Vanilla", "Chocolate", "Mango", "Berry"], Flavor.alphabetical.map{|f| f.name}
    end
    
    should "make an undestroyed flavor inactive" do
      @strawberry.destroy
      @strawberry.reload
      assert_equal false, @strawberry.active
    end
    
  end
end