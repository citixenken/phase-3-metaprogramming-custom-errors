#custom error

class Person
  class PartnerError < StandardError
    def message
      "You must give the get_married method an argument of an instance of the person class!"      
    end
  end

  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    if person.is_a?(Person)
      self.partner = person
      person.partner = self
    else
      begin
        raise PartnerError
      rescue PartnerError => error #allows continuity in execution
        puts error.message
      end
    end
  end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name




