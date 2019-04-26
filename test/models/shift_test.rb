require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:assignment)
  should have_many(:shift_jobs)
  should have_many(:jobs).through(:shift_jobs)
  should have_one(:employee).through(:assignment)
  should have_one(:store).through(:assignment)
  
  # Test basic validations
  should validate_presence_of :date
  should validate_presence_of :start_time
  should validate_presence_of :assignment_id
  
  # Tests for Date
  should allow_value(1.years.ago.to_date).for(:date)
  should allow_value(2.months.ago.to_date).for(:date)
  should allow_value(1.weeks.ago.to_date).for(:date)
  should allow_value(1.weeks.ago.to_date).for(:date)
  should allow_value(3.weeks.from_now.to_date).for(:date)
  
  should_not allow_value("5 years ago").for(:date)
  should_not allow_value("cat").for(:date)
  should_not allow_value(nil).for(:date)
  
  # Tests for Start Time
  should allow_value(1.hour.ago.to_time).for(:start_time)
  should allow_value(2.hours.ago.to_time).for(:start_time)
  should allow_value(3.hours.ago.to_time).for(:start_time)
  should allow_value(1.hour.from_now.to_time).for(:start_time)
  should allow_value(2.hours.from_now.to_time).for(:start_time)
  
  should_not allow_value("5 minutes ago").for(:start_time)
  should_not allow_value("cat").for(:start_time)
  should_not allow_value(nil).for(:start_time)
  
  # Tests for End Time
  should allow_value(1.hour.ago.to_time).for(:end_time)
  should allow_value(2.hours.ago.to_time).for(:end_time)
  should allow_value(3.hours.ago.to_time).for(:end_time)
  should allow_value(1.hour.from_now.to_time).for(:end_time)
  should allow_value(2.hours.from_now.to_time).for(:end_time)
  
  should_not allow_value("5 minutes ago").for(:end_time)
  should_not allow_value("cat").for(:end_time)
  should_not allow_value(nil).for(:end_time)
  
  # Tests for Assignment ID
  
  context "Creating a context for shifts" do
    # create the objects I want with factories
    setup do 
      create_shifts
    end
    
    # and provide a teardown method as well
    teardown do
      remove_shifts
    end
    
end

 # test scope completed
    should "show shift is completed" do
      assert_equal 1, Shift.completed.size
      assert_equal ["shiftjob1"], Shift.completed.map{|e| e.shift_jobs}.sort
    end
    
      should "not allow shift to be added to past assignment" do
      @oakland=FactoryBot.create(:store)
      @cindy=FactoryBot.create(:employee)
      @assign_cindy= FactoryBot.create(:assignment, store: @oakland, employee: @cindy, start_date: 4.months.ago.to_date, end_date: 2.months.ago.to_date)
      assert_raise(Exception) {FactoryBot.create(:shift, assignment: @assign_cindy, date: Date.today - 100.days)}
      @oakland.destroy
      @cindy.destroy
      @assign_cindy.destroy
    end

      should "allow shift to be added to upcoming assignment" do
      @oakland=FactoryBot.create(:store)
      @cindy=FactoryBot.create(:employee)
      @assign_cindy= FactoryBot.create(:assignment, store: @oakland, employee: @cindy, start_date: 4.months.from_now.to_date, end_date: 6.months.from_now.to_date)
      assert_raise(Exception) {FactoryBot.create(:shift, assignment: @assign_cindy, date: Date.today + 100.days)}
      @oakland.destroy
      @cindy.destroy
      @assign_cindy.destroy
    end
    
    should "have all the shifts listed chronologically by start date" do
      assert_equal ["Ben", "Kathryn", "Ed", "Cindy", "Ben"], Shift.by_employee.map{|a| a.employee.first_name}
    end
end
