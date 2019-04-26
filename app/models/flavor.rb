class Flavor < ApplicationRecord
    #Rollbacks
    before_destroy :destroyed_not
    after_rollback :inactive_flavor
    
    has_many :store_flavor
    has_many :stores, through: :store_flavors
    
    #Validations
    validates_presence_of :name
     # Scopes
    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
  
    def destroyed_not
        self.errors.add(:base, "Cannot Delete")
      throw(:abort)
    end
    
    def inactive_flavor
        self.update_attribute(:active, false)
    end
end
