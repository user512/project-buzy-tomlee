sample_user_1 = { username: "admin",email:"testing@buzy.com", password: "testing", repetition: 100}

sample_post_1 = { title: "$5 Buffet in SOMA??!!", content: "I heard that there is a $5 buffet in town, where is it?", user_id: 1}

sample_post_2 = { title: "Great view and eat from Cliff House", content: "The view is amazing. The environment is great. We came here for brunch. I love the view walking the ocean and trails.", user_id: 1}

sample_post_3 = { title: "The Flying Falafel is AWESOME!", content: "Check out this place on Market between 6th and 7th, AWESOME!!!!!!!!!!!!", user_id: 1 }

sample_post_4 = { title: "Best drunk food ever", content: "Golden Boy Pizza in North Beach.... I hate life. This place has ruined all other pizza forever for this Bostonian pizza lover. I don't know what to do with myself. I'm crushed. Let me go sit in the corner and cry.", user_id: 1 }

sample_post_5 = { title: "Another tourist trap", content: "Pier 39, nice, another shitty developers' project, anti-local BS", user_id: 1 }

sample_post_6 = { title: "Check out Cha-Ya in Mission", content: "Vegan sushi, i'm lovin it!", user_id: 1 }

seed_post_array = [sample_post_1, sample_post_2, sample_post_3, sample_post_4, sample_post_5, sample_post_6]

User.create(sample_user_1)

seed_post_array.each do |post|
  Post.create(post)
end




