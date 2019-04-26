module Contexts
    module ShiftContexts
    # Context for shifts (assumes contexts for assignments)
    def create_shifts
        create_past_shifts
        create_upcoming_shifts
    end
    
    def remove_shifts
        remove_past_shifts
        remove_upcoming_shifts
    end
    
    def create_shifts
      @washing = FactoryBot.create(:shift, assignment: @assign_ed, date: 1.years.ago.to_date)
      @cleaning = FactoryBot.create(:shift, assignment: @assign_ben, date: 2.months.ago.to_date, start_time: 3.hours.ago.to_time, end_time: 2.hours.ago.to_time)
      @register = FactoryBot.create(:shift, assignment: @promote_ben, date: 1.weeks.ago.to_date, start_time: 3.hours.ago.to_time, end_time: 2.hours.ago.to_time)
      @delivery = FactoryBot.create(:shift, assignment: @assign_cindy, date: 1.weeks.ago.to_date, start_time: 3.hours.from_now.to_time, end_time: 2.hours.from_now.to_time)
      @managing = FactoryBot.create(:shift, assignment: @assign_kathryn, date: 3.weeks.from_now.to_date, start_time: 3.hours.from_now.to_time, end_time: 2.hours.from_now.to_time)
    end
    
    def remove_shifts
        @washing.destroy
        @cleaning.destroy
        @register.destroy
        @delivery.destroy
        @waiter.destroy
    end
    end
end