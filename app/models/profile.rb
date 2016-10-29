class Profile < ActiveRecord::Base
  has_many :users
  validates :name, presence: { message: "El nombre es requerido"},
                   uniqueness: { message: "El nombre ya existe"},
                   length: { in: 5..30, message: "El nombre debe contener entre 5 y 30 caracteres"}
end
