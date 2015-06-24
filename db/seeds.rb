User.create(username:"neslom", image:"https://avatars.githubusercontent.com/u/8800860?v=3", description:"not coding much")
User.create(username:"worace", image:"https://avatars.githubusercontent.com/u/1227440?v=3", description:"not coding")
User.create(username:"xvalentino", image:"https://avatars.githubusercontent.com/u/8762410?v=3", description:"coding")
User.create(username:"indiesquidge", image:"https://avatars.githubusercontent.com/u/3409645?v=3", description:"coding")
Language.create(name: "Ruby")
Language.create(name: "JavaScript")
Language.create(name: "Go")
Language.create(name: "Closure")
Language.create(name: "SmallTalk")

20.times do
  UserLanguage.create(user_id: rand(5), language_id: rand(6))
end

UserMatch.create(user_1:1, user_2:5, user_1_choice:0,user_2_choice:nil)
UserMatch.create(user_1:2, user_2:5, user_1_choice:1,user_2_choice:nil)
