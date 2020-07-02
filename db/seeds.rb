require "open-uri"

puts "Destroy all datas"
Review.destroy_all
Preference.destroy_all
User.destroy_all
PremiumSubscription.destroy_all
Category.destroy_all


puts 'Creating categories...'

premium_tenant = Category.create!(name: 'premium_tenant')
premium_owner = Category.create!(name: 'premium_owner')

puts 'Creating Pack Premium étudiant...'

PremiumSubscription.create!(sku: 'pack-premium-étudiant', name: 'Pack Prémium Étudiant', category: premium_tenant, photo_url: '../../app/assets/images/yam_premium.png', price: 189 )


puts 'Creating Students...'

louis    = User.create!(first_name: 'Louis',last_name: "Adam", email:'louis@gmail.com', password:'password', born_at: '12/09/1989', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a laydy boy', user_type: 'student')
lorraine = User.create!(first_name: 'Lorraine',last_name: "Bayard", email:'lorraine@gmail.com', password:'password', born_at: '14/09/1999', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a graphist designer', user_type: 'student')
ludo     = User.create!(first_name: 'Ludo',last_name: "Fourcroy", email:'ludo@gmail.com', password:'password', born_at: '13/09/2000', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a hockey professional player ', user_type: 'student')
flix     = User.create!(first_name: 'Flix',last_name: "Net", email:'flix@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'student')
remi     = User.create!(first_name: 'Rémi',last_name: "Carotte", email:'remi@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'student')
simon    = User.create!(first_name: 'Simon',last_name: "Crétin", email:'simon@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'student')
demo     = User.create!(first_name: 'Yann',last_name: "Parigo", email:'demo@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: false, phone_number: '0689827381', gender: 'male', description: "I am a such a serious guy, from Paris. I am a professional golf player (at least I'm trying to...)", user_type: 'student')

puts 'Creating Owners'
aurel    = User.create!(first_name: 'Aurelien',last_name: "La descente", email:'aurel@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'Fan de bière, jeune actif et startuppeur #billionairemindset #laquestionelleestviterépondue', user_type: 'owner')
sam      = User.create!(first_name: 'Sam',last_name: "Les Brises", email:'sam@gmail.com', password:'password', born_at: '04/09/1954', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'Propriétaire aguerri, aime les cerises et les grands espaces. Amateur du paté en croute. Souhaite un locataire sérieux', user_type: 'owner')

puts 'Creating Flats'
city = "Lille"
flat_type = ['t1','t2','t3','t4','t5']
owners = [aurel,sam]
adresses = ["32 rue Roland",
  "12 rue Cormontaigne",
  "14 Boulevar Vauban",
  "134 rue d'Isly",
  "12 place Genevières",
  "14 Rue Georges Bizet",
  "30 rue de la Grande Brasserie",
  "30 rue Gustave Testelin",
  "12 rue Halévy",
  "1 rue Hoche",
  "23 rue Holbach",
  "2 cour Hourdiaux",
  "23 Rue Jean Levasseur",
  "34 Avenue Avenue Léon Jouhaux",
  "3 Place Leroux de Fauquemont",
  "4 Rue Lestiboudois",
  "7 Rue Loos",
  "93 Boulevard de la Lorraine",
  "21 Place du Marechal Leclerc",
  "45 Rue de la Marmora",
  "34 Allée des Marronniers",
  "5 impasse Menu",
  "1 cité Menu",
  "29 Rue Meurein",
  "65 Michel Servet",
  "98 Montebello",
  "89 Moselle",
  "34 Rue Nationale",
  "45 Rue Panckoucke",
  "2 Avenue du Petit Paradis",
  "1 Rue Pierre Martel",
  "7 Rue du Port",
  "72 Square du Portugal",
  "3 Cour Pottier",
  "29 Rue Roland",
  "9 Rue du Sabot",
  "73 Rue Saint-Jean-Baptiste de la Salle",
  "10 Impasse Saint-Joseph"]

adress_item = 0

30.times do
  Flat.create!(
  city:           city,
  flat_type:       flat_type.sample,
  available_at:    DateTime.now + (rand * 21),
  surface_area:    rand(18..50),
  user:            owners.sample,
  zip_code:        "59000",
  price_per_month: 1200,
  address:         adresses[adress_item]
  )

adress_item += 1
end

puts 'Creating Preferences'
user_preferences = [louis,lorraine,ludo,flix,remi,simon,demo,aurel,sam]
user_preferences_item = 0
9.times do
  Preference.create!(
    flat_type:'t2',
    price_per_month: 1200,
    roomates: 2,
    surface_area: 39,
    user: user_preferences[user_preferences_item],
    school_location: '3 rue de la digue, Lille',
    school_longitude: 2.2757516,
    school_latitude: 48.8714403,
    active:true,
    moving_at:'01/09/2020',
    surrounding_area: 9,
    city: 'Lille'
  )
  user_preferences_item += 1
end

owner_review_contents = ["Etudiant très serieux", "Etudiant un petit peu bruyant", "Cet étudiant est super sympa ","Cet étudiant est très mignon et sexy ", "Cet étudiant est très réservé et un petit peu chelou"]
student_review_contents = [
  "Monsieur sait se rendre disponible à tout moment",
  "Propriétaire agréable, facile de communiquer et de trouver des solutions rapidement",
  "Si je devais avoir un deuxième père, c'est lui",
  "Madame Lefèbvre est une personne disponible, et réactive.",
  "Très bonne expérience, même si c'était un peu bizarre de le retrouver nu dans mon salon après les vacances",
  "Rien à redire",
  "J'avais une ampoule à changer, cela à été fait rapidement",
  "Le propriétaire à utilisé Find&Trust pour rénover le parquet pendant mes vacances, super !",
  "Proprio dispo"
]


puts 'Creating Reviews'
students_reviewer = [louis,lorraine,ludo,flix,remi,simon]
reviewer_item = 0
student_review_contents_item = 0

puts 'Creating Reviews for Sam'

  5.times do
    Review.create!(
      content: student_review_contents[student_review_contents_item],
      rating: rand(3..5),
      reviewer: students_reviewer[reviewer_item],
      receiver: sam
    )
  reviewer_item += 1
  student_review_contents_item += 1
  end

puts 'Creating Reviews for Aurel'

reviewer_item = 0
student_review_contents_item = 6

  5.times do
  Review.create!(
    content: student_review_contents[student_review_contents_item],
    rating: rand(3..5),
    reviewer: students_reviewer[reviewer_item],
    receiver: aurel
  )
  reviewer_item += 1
  student_review_contents_item += 1
  end

puts 'Creating Reviews for Students'
  students = User.where(user_type: 'student')
  students.each do |student|
    Review.create!(
      content: "",
      rating: 0,
      reviewer: aurel,
      receiver: student
    )
  end

puts 'Creating Photos for Flats'

flat_pictures = []

Dir.glob('app/assets/images/flats/*.jpg') do |photo_filepath|
  flat_pictures << photo_filepath
end

puts "#{flat_pictures} ================="
item = 0

Flat.all.each_with_index do |flat, index|
  2.times do
    file = URI.open(flat_pictures[item])
    flat.photos.attach(io: file, filename: flat.id, content_type: 'image/png')
    flat.save
    item += 1
  end
end


puts 'Creating Photos for Users'

# Photo.create!(user: louis,  path: "/assets/images/louis.png")
# Photo.create!(user: lorraine,  path: "/assets/images/lorraine.png")
# Photo.create!(user: ludo,  path: "/assets/images/yann.png")
# Photo.create!(user: sam,  path: "/assets/images/sami.png")
# Photo.create!(user: remi,  path: "/assets/images/yann.png")
# Photo.create!(user: aurel,  path: "/assets/images/aurel.png")
# Photo.create!(user: simon,  path: "/assets/images/simon.png")
# Photo.create!(user: flix,  path: "/assets/images/yann.png")

# Photo.create!(user: demo,  path: "/assets/images/yann.png")

#students = User.where(user_type: 'student')
# owners   = User.where(user_type: 'owner')
# User.all.each do |user|
#   rand(2...5).times do
#     if user.user_type == 'student'
#       content  = owner_review_contents[rand(0...4)]
#       reviewer = owners[rand(0...owners.length)]
#     else
#       content  = student_review_contents[rand(0...4)]
#       reviewer = students[rand(0...students.length)]
#     end
#     Review.create!(
#       rating:    rand(1...5),
#       content:  content,
#       reviewer: reviewer,
#       receiver: user
#     )
#   end
#end

puts "Done !"
