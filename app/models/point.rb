class Point
  attr_accessor :longitude, :latitude

  def mongoize
    hash = {type: 'Point', coordinates: [@longitude, @latitude]}
    return hash
  end


  def self.mongoize object

    case object

      when nil then
        return nil

      when Hash then
        return {:type => 'Point', :coordinates => [object[:coordinates][0], object[:coordinates][1]]}

      when Point then
        return {:type => 'Point', :coordinates => [object.longitude, object.latitude]}

    end

  end

  def self.evolve object

    case object

      when nil then
        return nil

      when Hash then
        return {:type => 'Point', :coordinates => [object[:coordinates][0], object[:coordinates][1]]}

      when Point then
        return {:type => 'Point', :coordinates => [object.longitude, object.latitude]}

    end

  end

  def self.demongoize object

    case object

      when nil then
        return nil

      when Hash then
        Point.new(object[:coordinates][0], object[:coordinates][1])

      when (ModelClass) then
        Point.new(object.longitude, object.latitude)

    end

  end


  def initialize(longitude, latitude)
    @latitude = latitude
    @longitude = longitude
  end


end