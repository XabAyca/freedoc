# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Specialty.destroy_all
City.destroy_all
Doctor.destroy_all
Patient.destroy_all

["Allergy","immunology","Anesthesiology","Dermatology","Diagnostic radiology","Emergency medicine","Family medicine","Internal medicine","Medical genetics","Neurology","Nuclear medicine","Obstetrics and gynecology","Ophthalmology","Pathology","Pediatrics","Physical medicine and rehabilitation","Psychiatry","Surgery","Urology"].each do |specialty|
  Specialty.create(name:specialty)
  puts "#{specialty} created"
end

puts "*"*50

10.times do |i|
  City.create(name:Faker::Address.city)
  puts "#{i+1} cityes created"
end

puts "*"*50

25.times do |i|
  Doctor.create(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,zip_code:Faker::Address.zip_code,city_id:City.all.sample.id)
  puts "#{i+1} doctors created"
end

puts "*"*50



50.times do |i|
  Patient.create(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,city_id:City.all.sample.id)
  puts "#{i+1} patients created"
end

puts "*"*50

100.times do |i|
  Appointment.create(doctor_id:Doctor.all.sample.id,patient_id:Patient.all.sample.id,date:Faker::Date.between(from: 300.days.ago, to: Date.today),city_id:City.all.sample.id)
  puts "#{i+1} appointments created"
end

puts "*"*50

50.times do
  JoinTableDoctorSpecialty.create(specialty_id:Specialty.all.sample.id,doctor_id:Doctor.all.sample.id)
  puts "Join table added"
end

puts "*"*50
puts "All is ready for test"
puts "*"*50