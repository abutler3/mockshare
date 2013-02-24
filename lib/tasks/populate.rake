namespace :db do
  desc "Fill database with simple data"
  task :populate => :environment do
    15.times do |n|
      name = Faker::Name.name
      email = "user-#{n+1}@example.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    User.all.each do |user|
      5.times do |n|
        image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
        description = ["proposal damn low", "ending vote warm heads",
"assigning pass reflecting anyplace",
"reclaim message crucial similarly"].sample
        user.cards.create!(image: image,
                           description: description)
      end
    end
  end
end
