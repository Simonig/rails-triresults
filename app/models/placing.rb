class Placing

  attr_accessor :name, :place

  def mongoize
    return {:name => @name, :place=> @place}
  end


  def self.mongoize object

    case object

      when nil then
        return nil

      when Hash then
        return {:name => object[:name], :place=> object[:place]}

      when Placing then
        return {:name => object.name, :place=> object.place}

    end

  end

  def self.evolve object

    case object

      when nil then
        return nil

      when Hash then
        return {:name => object[:name], :place=> object[:place]}

      when Placing then
        return {:name => object.name, :place=> object.place}

    end

  end

  def self.demongoize object

    case object

      when nil then
        return nil

      when Hash then
        Placing.new(object)

      when (ModelClass) then
        Placing.new(object)

    end

  end

  def initialize hash
    @name = hash[:name]
    @place = hash[:place]
  end

end