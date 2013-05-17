users = User.create([
  {username: "Angie", password: "password", email: "angie@gmail.com", gender: "female"}, 
  {username: "Sean", password: "password", email: "sean@gmail.com", gender: "male"},
  {username: "Jkai", email: "jkai@gmail.com", password: "password", gender: "male"}
  ])

topics = Topic.create([
  {title: "dates"},
  {title: "dinner"},
  {title: "clothes"},
  {title: "long term relationship"},
  {title: "long distance relationship"},
  {title: "DBC relationships"}
  ])

questions = Question.create([
  {user_id: 1, title: "A question about Ruby", body: "What is Ruby?", topic_id: 1}, 
  {user_id: 2, title: "Texting Girls", body: "What does she mean by 'hi' ?", topic_id: 2},
  ])

answers = Answer.create([
  {question_id: 1, user_id: 1, body: "I think it's a jewelry"},
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
