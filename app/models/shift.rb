class Shift < ApplicationRecord
    #Callbacks
    before_create :current_assignment
    after_create :change_end_time
    before_destroy :delete_maybe
    
    
    #Relationships
    belongs_to :assignment
    has_many :shift_jobs
    has_many :jobs, through: :shift_jobs
    has_one :employee, through: :assignment
    has_one :store, through: :assignment
    
    #Validations
    validates_presence_of :date, :start_time, :assignment_id
    
    
    #Scopes
    scope :completed,     -> { joins(:shift_jobs) }
    scope :incomplete,   -> { joins(:shift_jobs).where("job_id IS NULL")}
    scope :for_store,     -> (store_id) { joins(:assignment).where("store_id = ?", store_id) }
    scope :for_employee,  -> (employee_id) { joins(:assignment).where("employee_id = ?", employee_id) }
    scope :past,          -> { where("date < ?", Date.current) }
    scope :upcoming,      -> { where("date >= ?", Date.current) }
    scope :for_next_days, -> (next_days) { where("date between ? and ?", Date.current, Date.current + next_days) }
    scope :for_past_days, -> (past_days) { where("date between ? and ?", Date.current - past_days, Date.current - 1) }
    scope :chronological, -> { order('date ASC') }
    scope :by_store,      -> { joins(:store).order("stores.name") }
    scope :by_employee,   -> { joins(:employee).order("employees.last_name, employees.first_name") }
    
    
    def completed?
        !self.shift_jobs.nil?
    end
    
    
    def change_end_time
        self.update_attribute(:end_time, self.start_time + 3.hours)
    end
    
    def start_time
        self.update_attribute(:start_time, Time.now)
    end
    
    def end_time
        self.update_attribute(:end_time, Time.now)
    end
    
    
    def current_assignment
        ca= Assignment.current.map {|x| assignment_id}
        if !ca.include? (self.assignment_id)
            self.errors.add(:base, "Cannot create past assignment")
            throw(:abort)
        end
    end
    
    def delete_maybe
        if self.date >= Date.current
        else
            self.errors.add(:base, "Cannot create past element")
            throw(:abort)
        end
    end
end
