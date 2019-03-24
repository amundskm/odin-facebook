#create users
User.create!(name: "Example User",
             email: "example@text.org",
             password: "password",
             password_confirmation: "password")

29.times do |n|
    name = Faker::Name.name
    email = "user#{n+1}@test.com"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)

end

# create 2 posts / user
users = User.all
users.each do |user|
    2.times do
        content = Faker::Lorem.sentence(2)
        user.posts.create!(content: content)
    end
end

#create 100 comments on random posts
100.times do
    post = Post.find(Post.pluck(:id).sample)
    user_id = User.pluck(:id).sample
    content = Faker::Lorem.sentence(2)
    post.comments.build(content: content, user_id: user_id).save
end

#create 100 comments on random comments
100.times do |n|
    comment = Comment.find(Comment.pluck(:id).sample)
    user_id = User.pluck(:id).sample
    content = Faker::Lorem.sentence(2)
    comment.comments.build(content: content, user_id: user_id).save
end