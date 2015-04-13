class User < ActiveRecord::Base
  has_many :contracts
  has_many :cohorts, through: :contracts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # checks to see if you have chosen one of given possibilities
  validates :role, inclusion: { in: %w(student teacher admin),
    message: "you have not chosen a valid role" }
end
