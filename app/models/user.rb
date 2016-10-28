class User < ActiveRecord::Base
  belongs_to :profile
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  # validates :document, :name, :last_name, :address, presence: true
  # validates :document, :email, uniqueness: true
  # validates :name, length: {in: 8..15}
  # validates :document, length: {in: 8..15}, numericality: { only_integer: true }

  def has_permission?(permission)
    return self.profile[permission]
  end

  # def active_for_authentication?
  #   #remember to call the super
  #   #then put our own check to determine "active" state using 
  #   #our own "is_active" column
  #   super and self.state
  # end

  # def is_admin?
  #   self.profile == "admin" ? true : false
  # end

  # def is_propietary?
  #   self.profile == "propietario" ? true : false
  # end

  # def is_evaluator?
  #   self.profile == "evaluador" ? true : false
  # end

  # def is_typist?
  #   self.profile == "digitador" ? true : false
  # end

  def can_manage_users?
    return self.profile.users_permission
  end

  def can_access_indicators?
    return self.profile.indicators_permission
  end

  def can_access_reports?
    return self.profile.reports_permission
  end

  def can_access_statistics?
    return self.profile.statistics_permission
  end

  def can_manage_profiles?
    return self.profile.profiles_permission
  end

end
