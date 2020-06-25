

puts "Destroy all datas"
Chatroom.destroy_all
Review.destroy_all
User.destroy_all


louis    = User.create!(name: ' Louis', email:'louis@gmail.com', password:'password', born_at: '12/09/1989', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a laydy boy', user_type: 'student')
lorraine = User.create!(name: ' Lorraine', email:'lorraine@gmail.com', password:'password', born_at: '14/09/1999', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a graphist designer', user_type: 'student')
ludo     = User.create!(name: ' Ludo', email:'ludo@gmail.com', password:'password', born_at: '13/09/2000', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a hockey professional player ', user_type: 'student')
yann     = User.create!(name: ' Yann', email:'yann@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'student')
demo     = User.create!(name: 'John Doe', email:'demo@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'student')
gasp     = User.create!(name: ' Gasp', email:'gasp@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'owner')
aurel    = User.create!(name: ' Aurel', email:'aurel@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'owner')
sam      = User.create!(name: ' Sam', email:'sam@gmail.com', password:'password', born_at: '04/09/1954', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'My name is sasa', user_type: 'owner')


Flat.create!(
  city:            'Lille',
  flat_type:       't4',
  price_per_month: 1200,
  available_at:    '12/09/2020',
  surface_area:    50,
  user:            gasp,
  zip_code:        59000,
  address:         '60 boulevard vauban'
)

Flat.create!(city:'Lille', flat_type:'t2', price_per_month: 780, available_at: '12/11/2020', surface_area: 40, user: aurel, zip_code: 92100, address:'147 rue de silly', longitude: 2.23425, latitude: 48.833241)
Flat.create!(city:'Lille', flat_type:'t1', price_per_month: 2200, available_at: '12/11/2020', surface_area: 40, user: aurel, zip_code: 92100, address:'147 rue de silly', longitude: 2.23425, latitude: 48.833241)
Flat.create!(city:'boulogne', flat_type:'t2', price_per_month: 2200, available_at: '12/11/2020', surface_area: 40, user: aurel, zip_code: 92100, address:'147 rue de silly', longitude: 2.23425, latitude: 48.833241)
Flat.create!(city:'boulogne', flat_type:'t3', price_per_month: 2200, available_at: '12/11/2020', surface_area: 40, user: aurel, zip_code: 92100, address:'147 rue de silly', longitude: 2.23425, latitude: 48.833241)
Flat.create!(city:'Paris', flat_type:'t5', price_per_month: 7200, available_at: '12/10/2020', surface_area: 100, user: sam, zip_code: 75008, address:'15 Avenue des Champs-Elisée', longitude: 2.308757, latitude: 48.869043)

Preference.create!(flat_type:'t2', price_per_month: 1200, roomates: 2, surface_area: 39, user: yann, school_location: 'Place du Maréchal de Lattre de Tassigny, Paris, 75016', school_longitude: 2.2757516, school_latitude: 48.8714403, active:true, moving_at:'12/12/2020', surrounding_area: 10, city: 'Paris' )
Preference.create!(flat_type:'t2', price_per_month: 1200, roomates: 2, surface_area: 39, user: louis, school_location: 'Place du Maréchal de Lattre de Tassigny, Paris, 75016', school_longitude: 2.2757516, school_latitude: 48.8714403, active:true, moving_at:'12/12/2020', surrounding_area: 10, city: 'Paris' )
Preference.create!(flat_type:'t3', price_per_month: 1700, roomates: 1, surface_area: 45, user: lorraine, school_location: '147 rue de silly, Boulogne - Billancourt, 92100', school_longitude: 2.2342496, school_latitude: 48.8332407, active:true, moving_at:'12/12/2020', surrounding_area: 3, city:'Boulogne-billancourt' )
Preference.create!(flat_type:'t4', price_per_month: 3200, roomates: 2, surface_area: 54, user: ludo,  school_location:  'Place du Maréchal de Lattre de Tassigny, Paris, 75016', school_longitude: 2.2757516, school_latitude: 48.8714403, active:true, moving_at:'12/12/2020', surrounding_area: 4, city: 'Paris' )

Chatroom.create!(
  name: 'yam',
  flat: Flat.first,
  user: louis
)

Chatroom.create!(
  name: 'General',
  flat: Flat.last,
  user: yann
)
puts "Chatroom created"

Message.create!(
  content:  'You are the one',
  user:     louis ,
  chatroom: Chatroom.first
)
puts "Message created"

owner_review_contents = ["Etudiant très serieux ", "Etudiant un petit peu bruyant", "Cet étudiant est super sympa ","Cet étudiant est très mignon et sexy ", "Cet étudiant est très réservé et un petit peu chelou"]
student_review_contents = [
  "Monsieur Collmart sait se rendre disponible à tout moment",
  "Mme Vuillemant est une propriétaire agréable, il est facile de communiquer avec elle et de trouver des solutions rapidement ",
  "Madame Lefèbvre est une personne disponible, et réactive.",
  "Monsieur Cascou porte bien son nom, ce propriétaire s'invite à l'improviste sous prétexte de prendre des nouvelles (trop) souvent. #harceleur."
]

owners   = User.where(user_type: 'owner')
students = User.where(user_type: 'student')

User.all.each do |user|
  rand(2...5).times do
    if user.user_type == 'student'
      content  = owner_review_contents[rand(0...4)]
      reviewer = owners[rand(0...owners.length)]
    else
      content  = student_review_contents[rand(0...4)]
      reviewer = students[rand(0...students.length)]
    end
    Review.create!(
      rating:    rand(1...5),
      content:  content,
      reviewer: reviewer,
      receiver: user
    )
  end
end
