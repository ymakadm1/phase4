module Contexts
    module ShiftJobContexts
    #Contexts for Shift Jobs
        
    def create_shift_jobs
        @shiftjob1 = FactoryBot.create(:shift_job, shift: @washing, job: @job1)
        @shiftjob2 = FactoryBot.create(:shift_job, shift: @cleaning, job: @job2)
        @shiftjob3 = FactoryBot.create(:shift_job, shift: @register, job: @job3)
        @shiftjob4 = FactoryBot.create(:shift_job, shift: @delivery, job: @job4)
        @shiftjob5 = FactoryBot.create(:shift_job, shift: @managing, job: @job5)
    end    
    
    
    def remove_shift_jobs
        @shiftjob1.destroy
        @shiftjob2.destroy
        @shiftjob3.destroy
        @shiftjob4.destroy
        @shiftjob5.destroy
    end
    
        
        
    end
end

