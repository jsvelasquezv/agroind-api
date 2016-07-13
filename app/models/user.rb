class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  def is_admin?
    self.profile == "admin" ? true : false
  end

  def is_propietary?
    self.profile == "propietario" ? true : false
  end

  def is_evaluator?
    self.profile == "evaluador" ? true : false
  end

  def is_typist?
    self.profile == "digitador" ? true : false
  end
end
