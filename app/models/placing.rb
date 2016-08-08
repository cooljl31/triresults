class Placing
	attr_accessor :name, :place

	# Constructs Placing instance object
	def initialize(name, place)
		@name = name
		@place = place
	end

	# Marshals the state of the instance into MongoDB format as a Ruby hash
	def mongoize
		{:name=>@name, :place=>@place}
	end

	def self.mongoize object
		case object
  		when nil then	nil
  		when Hash then Placing.new(object[:name], object[:place]).mongoize
  		when Placing then	object.mongoize
		end
	end


	def self.demongoize object
		case object
		when nil then	nil
		when Hash then Placing.new(object[:name], object[:place])
		when Placing then	object
		end
	end


	def self.evolve object
	  case object
    	when Placing then object.mongoize
    	else object
    end 
  end
end