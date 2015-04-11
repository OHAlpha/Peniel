class Address < ActiveRecord::Base

  include Detailed

  def self.icols
    if @icolnames.nil?
      @icolnames = [ 'id', 'house_number', 'street', 'apt_number', 'city', 'county', 'state', 'country', 'zip', 'zip_ext', 'created_at', 'updated_at' ]
    end
    @icolnames
  end

  def irow
    [ self.id, self.house_number, self.street, self.apt_number, self.city, self.county, self.state, self.country, self.zip, self.zip_ext, self.created_at, self.updated_at ]
  end

end
