namespace :db do
	desc "Fill database with sample data" 
	task populate: :environment do
        require 'faker'

        # Venues
        Venue.search(lat_lon: '25.621716,-100.393066')
        venues = Venue.all

        # Admins
        User.create(email: "iosdsv@gmail.com", password: "Sosads.12", password_confirmation: "Sosads.12", role: 0) if User.where(email: "iosdsv@gmail.com").empty?
        User.create(email: "ever@noreplay.com", password: "1234", password_confirmation: "1234", role: 0) if User.where(email: "ever@noreplay.com").empty?
        users = User.all

        # Usuarios
    	100.times do |n|
    		email = "prueba-#{n+1}@angelhack.org"
    		password = "password"
    		User.create!(email: email,
    					 password: password,
    					 password_confirmation: password) if User.where(email: email).empty?
    	end
        #Reportes
        100.times do |n|
            name_data = Faker::Lorem.sentence(1)
            content = Faker::Lorem.sentence(5)
            Report.where(content: content, user_id: users.sample.id, venue_id: venues.sample.id).first_or_create
        end
        reports = Report.all

        #Votos
        100.times do |n|
            vote = Vote.where(report_id:reports.sample.id,user_id:users.sample.id).first_or_create
            vote.update_attribute(:calification, [true,false].sample)
        end
        #Comentarios
        100.times do |n|
            content = Faker::Lorem.sentence(2)
            Comment.where(description:content, report_id: reports.sample.id, user_id: users.sample.id).first_or_create
        end
    end
end