class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
       new = Freebie.create(item_name: item_name, value: value)
       new.dev = dev
       new.company = self
    end

    def self.oldest_company
        oldest = self.minimum("founding_year")
        self.where("founding_year = ?", oldest)
    end
end
