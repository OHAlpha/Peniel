class User < ActiveRecord::Base

  include Detailed

  belongs_to :person
  
  has_one :developer
  has_one :profile

  validates :salt, :status, presence: true
  validates :person, :unom, :email, :name_t, :name_f, :name_l, :name_s, :status, presence: true
  validates :unom, format: { with: /\A[A-Za-z0-9_\-.]+\z/, message: "invalid email address" }
  validates :name_f, :name_l, format: { with: /\A[A-Z][a-z]+\z/, message: "invalid email address" }
  validates :name_m, format: { with: /\A([A-Z][a-z]+( [A-Z][a-z]+)*)?\z/, message: "invalid email address" }
  validates :email, format: { with: /\A[a-zA-Z0-9_\-.]+@[a-zA-Z0-9_\-.]+\z/, message: "invalid email address" }
  
  before_validation :mkvalatt, :personify, on: [ :create, :update ]

  def self.icols
    if @icolnames.nil?
      @icolnames = [ 'id', 'person_id', 'unom', 'email', 'name_t', 'name_f', 'name_m', 'name_l', 'name_s', 'contact_id', 'birthdate', 'status', 'permissions', 'created_at', 'updated_at' ]
    end
    @icolnames
  end

  def irow
    [ self.id, self.person_id, self.unom, self.email, self.name_t, self.name_f, self.name_m, self.name_l, self.name_s, self.contact_id, self.birthdate, self.status, self.permissions, self.created_at, self.updated_at ]
  end
  
  def name
    ( self.name_t.nil? ? '' : self.name_t == 0 ? '' : Title.find(self.name_t).name + ' ' ) + self.name_f + ( self.name_m.nil? ? '' : self.name_m == '' ? '' : ' ' + self.name_m ) + ' ' + self.name_l + ( self.name_s.nil? ? '' : self.name_s == 0 ? '' : ' ' + Suffix.find(self.name_s).name )
  end
  
  def member
    self.person.member
  end
  
  def member?
    self.person.member?
  end
  
  def maintainer?
    self.member? and self.member.maintainer?
  end
  
  def developer?
    not self.developer.nil?
  end
  
  def admin?
    self.member? and self.member.admin?
  end
  
  def gensalt
    if self.salt.nil?
      self.salt = SecureRandom.hex(16)
    end
  end
  
  def passhash=(passhash)
    gensalt
    self.salt_passhash = Digest::SHA256.hexdigest(passhash+self.salt)
  end
  
  protected
  
    def personify
      if self.person.nil?
        self.person = Person.create( name: self.name, email: self.email )
      else
        if not Person.exists?(self.person_id)
          self.person = Person.create( name: self.name, email: self.email )
        else
          self.person.name = self.name
          self.person.email = self.email
        end
      end
    end
  
    def mkvalatt
      if self.salt.nil?
        gensalt
      end
      if self.name_t.nil?
        self.name_t = 1
      end
      if self.name_s.nil?
        self.name_s = 1
      end
    end

end
