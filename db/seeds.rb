sample_user_1 = { username: "admin",email:"testing@buzy.com", password: "testing", repetition: 100}

sample_post_1 = { title: "$5 Buffet in SOMA??!!", content: "I heard that there is a $5 buffet in town, where is it?"}

sample_post_2 = { title: "Great view and eat from Cliff House", content: "The view is amazing. The environment is great. We came here for brunch. I love the view walking the ocean and trails." }

sample_post_3 = { title: "Great view and eat from Cliff House", content: "The view is amazing. The environment is great. We came here for brunch. I love the view walking the ocean and trails." }

sample_post_4 = { title: "Best drunk food ever", content: "Golden Boy Pizza in North Beach.... I hate life. This place has ruined all other pizza forever for this Bostonian pizza lover. I don't know what to do with myself. I'm crushed. Let me go sit in the corner and cry. "}

sample_post_5 = { title: "Another tourist trap", content: "Pier 39, nice, another shitty developers' project, anti-local BS"}

seed_post_array = [sample_post_1, sample_post_2, sample_post_3, sample_post_4, sample_post_5]

User.create(sample_user_1)

seed_post_array.each do |post|
  Post.create(post)
end




