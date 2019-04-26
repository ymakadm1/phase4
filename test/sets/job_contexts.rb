module Contexts
    module JobContexts
    # Context for Jobs
    
    def create_jobs
      @job1 = FactoryBot.create(:job, name: "Wash dishes", description: "It's disgusting unfortunately", active: true)
      @job2 = FactoryBot.create(:job, name: "Clean floor", description: "Not too hard to do", active: true)
      @job3 = FactoryBot.create(:job, name: "Register", description: "Eat some on the way if you want", active: true)
      @job4 = FactoryBot.create(:job, name: "Delivery", description: "A pretty moving job", active: false)
      @job5 = FactoryBot.create(:job, name: "Manage store", description: "Most important role", active: false)
    end
    
    def remove_jobs
        @job1.destroy
        @job2.destroy
        @job3.destroy
        @job4.destroy
        @job5.destroy
    end
    end
end