class Address


  attr_accessor :location, :state, :city

  def mongoize
    return {:type => 'Address',:city => @city, :state=> @state, :loc => {:type => "Point", :coordinates => [@location.longitude, @location.latitude]}}
  end


  def self.mongoize object

    case object

      when nil then
        return nil

      when Hash then
        return {:type => 'Address', :city => object[:city], :state=> object[:state], :loc => {:type=> "Point", :coordinates => [object[:loc][:coordinates][0], object[:loc][:coordinates][1]]}}

      when Address then
        return {:type => 'Address',:city => object.city, :state=> object.state, :loc => {:type => "Point", :coordinates => [object.location.longitude, object.location.latitude]}}

    end

  end

  def self.evolve object

    case object

      when nil then
        return nil

      when Hash then
        return {:type => 'Address', :city => object[:city], :state=> object[:state], :loc => {:type=> "Point", :coordinates => [object[:loc][:coordinates][0], object[:loc][:coordinates][1]]}}

      when Address then
        return {:type => 'Address',:city => object.city, :state=> object.state, :loc => {:type => "Point", :coordinates => [object.location.longitude, object.location.latitude]}}

    end

  end

  def self.demongoize object

    case object

      when nil then
        return nil

      when Hash then
        Address.new(object)

      when (ModelClass) then
        Address.new(object)

    end

  end

  def initialize(hash = {:city => 'Oakland', :state => 'CA', :loc => { :coordinates => [70.88, 90.39]}})
    @city = hash[:city]
    @state =  hash[:state]
    @location = hash[:loc] ? Point.new(hash[:loc][:coordinates][0], hash[:loc][:coordinates][1]) : Point.new(70.88, 90.33)


  end

end