module Contexts
    module StoreFlavorContexts
    #Contexts for Store Flavors
        
    def create_store_flavors
        @storeflavor1 = FactoryBot.create(:store_flavor, store: @oakland, flavor: @chocolate)
        @storeflavor2 = FactoryBot.create(:store_flavor, store: @hazelwood, flavor: @vanilla)
        @storeflavor3 = FactoryBot.create(:store_flavor, store: @cmu, flavor: @strawberry)
        @storeflavor4 = FactoryBot.create(:store_flavor, store: @convention, flavor: @mango)
        @storeflavor5 = FactoryBot.create(:store_flavor, store: @acac, flavor: @berry)
    end    
    
    
    def remove_store_flavors
        @storeflavor1.destroy
        @storeflavor2.destroy
        @storeflavor3.destroy
        @storeflavor4.destroy
        @storeflavor5.destroy
    end
    
        
        
    end
end

