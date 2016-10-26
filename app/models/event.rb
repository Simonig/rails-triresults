class Event
  include Mongoid::Document
  field :o, as: :order, type: Integer
  field :n, as: :name, type: String
  field :d, as: :distance, type: Float
  field :u, as: :units, type: String

  validates_presence_of :order,:name


  embedded_in :parent, polymorphic: true, touch: true



  def meters
    case
      when (self.u === 'meters')
        return self.d
      when (self.u === 'miles')
        return self.d * 1609.344
      when (self.u === 'kilometers')
        return self.d*1000
      when (self.u === 'yards')
        return self.d*0.9144
      when (self.u === nil)
        return nil

    end
  end

  def miles
    case
      when (self.u === 'miles')
        return self.d
      when (self.u === 'meters')
        return self.d/1609.344
      when (self.u === 'kilometers')
        return self.d*0.621371
      when (self.u === 'yards')
        return self.d * 0.000568182
      when (self.u === nil)
        return nil

    end
  end


end
