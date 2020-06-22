
User.create!(name: ' louis', email:'louiss@gmail.com', password:'password', born_at: '12/09/1989', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a laydy boy', user_type: 'student')
User.create!(name: ' lorraine', email:'lorraine@gmail.com', password:'password', born_at: '14/09/1999', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a graphist designer', user_type: 'student')
User.create!(name: ' ludo', email:'ludo@gmail.com', password:'password', born_at: '13/09/2000', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a hockey professional player ', user_type: 'student')
User.create!(name: ' yann', email:'yann@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: false, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'student')
User.create!(name: ' gasp', email:'gasp@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'owner')
User.create!(name: ' aurel', email:'aurel@gmail.com', password:'password', born_at: '04/09/1994', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'I am a such a serious guy', user_type: 'owner')
User.create!(name: ' sam', email:'sam@gmail.com', password:'password', born_at: '04/09/1954', yam_premium: true, phone_number: '0689827381', gender: 'male', description: 'My name is sasa', user_type: 'owner')


Flat.create!(city:'lille', flat_type:'t4', price_per_month: 1200, available_at: '12/09/2020', surface_area: 50, user_id: 5, zip_code: 59000, address:'2 avenue des Saules', longitude: 3.217661, latitude: 50.644487)
Flat.create!(city:'boulogne', flat_type:'t3', price_per_month: 2200, available_at: '12/11/2020', surface_area: 40, user_id:6 , zip_code: 92100, address:'147 rue de silly', longitude: 2.23425, latitude: 48.833241)
Flat.create!(city:'Paris', flat_type:'t5', price_per_month: 7200, available_at: '12/10/2020', surface_area: 100, user_id: 7, zip_code: 75008, address:'15 Avenue des Champs-Elisée', longitude: 2.308757, latitude: 48.869043)

Preference.create!(flat_type:'t2', price_per_month: 1200, roomates: 2, surface_area: 39, user_id: 1, school_location: 'Place du Maréchal de Lattre de Tassigny, Paris, 75016', school_longitude: 2.2757516, school_latitude: 48.8714403, active:true, moving_at:'12/12/2020', surrounding_area: 10 )
Preference.create!(flat_type:'t3', price_per_month: 1700, roomates: 1, surface_area: 45, user_id: 2, school_location: '147 rue de silly, Boulogne - Billancourt, 92100', school_longitude: 2.2342496, school_latitude: 48.8332407, active:true, moving_at:'12/12/2020', surrounding_area: 3 )
Preference.create!(flat_type:'t4', price_per_month: 3200, roomates: 2, surface_area: 54, user_id: 3,  school_location:  'Place du Maréchal de Lattre de Tassigny, Paris, 75016', school_longitude: 2.2757516, school_latitude: 48.8714403, active:true, moving_at:'12/12/2020', surrounding_area: 4 )

Chatroom.create!(name: 'yam', flat_id: 1, user_id:4)
Message.create!(content:'You are the one', user_id:1, chatroom_id: 1)
