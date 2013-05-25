namespace :db do
	desc "LLenar con datos de prueba de reportes"
	task popilate: :environment do
	99.times do |n|
		name = Fake::Name.name
		email = "prueba-#{n+1}@angelhack.org"
		password = "password"
		User.create!(name: name,
					 email: email,
					 password: password)
	end
	users = User.all(limit: 10)
	50.times do
		content = Faker::Lorem.sentance(5)
		users.each{|user| user.reports.create!(content: content,
											   latitude: rand((25.686088..25.76774),
											   longitude: rand(-100.530396..-100.085449)	
											   )}
	end
end
