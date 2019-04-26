class Job < ApplicationRecord
    #Callbacks
    before_destroy :destroyed_maybe
    after_rollback :inactive_job
    
    
    has_many :shift_job
    has_many :shifts, through: :shift_jobs
    
    
     # Scopes
    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    
    #Validations
    validates_presence_of :name
    
    #Methods
    
    def destroyed_maybe
        if completed_job?
            self.errors[:base] << "Cannot Delete"
            throw(:abort)
        end
    end
        
    
    def completed_job?
        self.shift_job.size >0
    end
    
    def inactive_job
        self.update_attribute(:active, false)
    end
  
end
