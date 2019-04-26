module Contexts
    module FlavorContexts
    # Context for Flavors
    
    def create_jobs
      @chocolate = FactoryBot.create(:flavor, name: "Chocolate", active: true)
      @vanilla = FactoryBot.create(:flavor, name: "Vanilla", active: true)
      @strawberry = FactoryBot.create(:flavor, name: "Strawberry", active: true)
      @mango = FactoryBot.create(:flavor, name: "Mango", active: false)
      @berry = FactoryBot.create(:flavor, name: "Berry", active: false)
    end
    
    def remove_jobs
        @chocolate.destroy
        @vanilla.destroy
        @strawberry.destroy
        @mango.destroy
        @berry.destroy
    end
    end
end