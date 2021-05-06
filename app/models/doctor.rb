class Doctor < ApplicationRecord
  has_many :join_table_doctor_specialties
  has_many :specialties, through: :join_table_doctor_specialties
  belongs_to :city
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
