users = User.create([
  {username: "angie", password: "password", email: "angie@gmail.com", gender: "female"}, 
  {username: "sean", password: "password", email: "sean@gmail.com", gender: "male"},
  {username: "jkai",  password: "password", email: "jkai@gmail.com", gender: "male"},
  {username: "fei", password: "password", email: "fei@gmail.com", gender: "male"},
  {username: "sydney", password: "password", email: "sydney@gmail.com", gender: "male"},
  {username: "stephenitis", password: "password", email: "stephen@gmail.com", gender: "male"}
])

topics = Topic.create([
  {title: "Dating"},
  {title: "Dinner"},
  {title: "Fashion"},
  {title: "Clubbing"},
  {title: "Workout"},
  {title: "Texting"},
  {title: "Pair Programming"},
  {title: "Long term relationship"},
  {title: "Long distance relationship"},
  {title: "DBC relationships"}
])

questions = Question.create([
  {user_id: 1, title: "Ruby?", body: "What is Ruby?", topic_id: 1}, 
  {user_id: 2, title: "Texting Girls", body: "What does she mean by 'hi' ?", topic_id: 6},
  {user_id: 3, title: "First Dates", body: "Is it okay to use a coupon on a first date?", topic_id: 1},
  {user_id: 4, title: "Programming Dates", body: "How do I ask a girl if she wants to be more than pair programming?", topic_id: 7}
  ])

answers = Answer.create([
  {question_id: 1, user_id: 1, body: "I think it's a jewelry a guy should buy for a girl"},
  {question_id: 1, user_id: 2, body: "It's definitely a girl's name"},
  {question_id: 2, user_id: 3, body: "Shes mad at you, bro!"}
])

votes = Vote.create([ 
  {answer_id: 1, user_id: 2, upvote: true},
  {answer_id: 1, user_id: 3, upvote: true},
  {answer_id: 2, user_id: 1, upvote: false},
  {answer_id: 3, user_id: 1, upvote: true},
  {answer_id: 3, user_id: 3, upvote: false}
])

tags = Tag.create([
  {name: "Jkai"},
  {name: "fun ideas"},
  {name: "bad advice"},
  {name: "crazy"},
])


