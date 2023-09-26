# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Users
first_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80', bio: 'Teacher from Mexico.', posts_counter:0)
second_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1582233479366-6d38bc390a08?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60', bio: 'Rails Programmer from Poland.', posts_counter:0)
third_user = User.create(name: 'Kim', photo: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60', bio: 'Back-End Developer from Japan.', posts_counter:0)
fourth_user = User.create(name: 'Hanna', photo: 'https://plus.unsplash.com/premium_photo-1664203068007-52240d0ca48f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60', bio: 'Website designer from Finland.')
fifth_user = User.create(name: 'Samanta', photo: 'https://images.unsplash.com/photo-1601288496920-b6154fe3626a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60', bio: 'Secretary from Germany.', posts_counter:0)
sixth_user = User.create(name: 'Daric', photo: 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZmFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60', bio: 'Hardware Engineer from South Africa.', posts_counter:0)

# Posts
post_list = [];
4.times do |i|
    puts "post #{i}"
    this_post = Post.create(author: first_user, title: 'Hello', text: "This is my post #{i}",comments_counter: 0, likes_counter: 0)
    post_list = post_list.push(this_post)
end

2.times do |i|
    puts "post #{i}"
    this_post = Post.create(author: second_user, title: 'Hello', text: "This is my post #{i}",comments_counter: 0, likes_counter: 0)
    post_list = post_list.push(this_post)
end

6.times do |i|
    puts "post #{i}"
    this_post = Post.create(author: third_user, title: 'Hello', text: "This is my post #{i}",comments_counter: 0, likes_counter: 0)
    post_list = post_list.push(this_post)
end

2.times do |i|
    puts "post #{i}"
    this_post = Post.create(author: fourth_user, title: 'Hello', text: "This is my post #{i}",comments_counter: 0, likes_counter: 0)
    post_list = post_list.push(this_post)
end

3.times do |i|
    puts "post #{i}"
    this_post = Post.create(author: fifth_user, title: 'Hello', text: "This is my post #{i}",comments_counter: 0, likes_counter: 0)
    post_list = post_list.push(this_post)
end

5.times do |i|
    puts "post #{i}"
    this_post = Post.create(author: sixth_user, title: 'Hello', text: "This is my post #{i}",comments_counter: 0, likes_counter: 0)
    post_list = post_list.push(this_post)
end

# Comments

Comment.create(post: post_list[0], author: first_user, text: 'Hi Tom!' )
Comment.create(post: post_list[1], author: second_user, text: 'Hi Tom!' )
Comment.create(post: post_list[2], author: third_user, text: 'Hi Tom!' )
Comment.create(post: post_list[3], author: fourth_user, text: 'Hi Tom!' )
Comment.create(post: post_list[4], author: fifth_user, text: 'Hi Tom!' )
Comment.create(post: post_list[5], author: sixth_user, text: 'Hi Tom!' )

Comment.create(post: post_list[0], author: sixth_user, text: 'Hi kim!' )
Comment.create(post: post_list[1], author: fifth_user, text: 'Hi kim!' )
Comment.create(post: post_list[2], author: fourth_user, text: 'Hi kim!' )
Comment.create(post: post_list[3], author: third_user, text: 'Hi kim!' )
Comment.create(post: post_list[4], author: second_user, text: 'Hi kim!' )
Comment.create(post: post_list[5], author: first_user, text: 'Hi kim!' )

post_list.each do |post|
    Comment.create(post: post, author: sixth_user, text: 'Hi kim!' )
Comment.create(post: post, author: fifth_user, text: 'Hi kim!' )
Comment.create(post: post, author: fourth_user, text: 'Hi kim!' )
Comment.create(post: post, author: third_user, text: 'Hi kim!' )
Comment.create(post: post, author: second_user, text: 'Hi kim!' )
Comment.create(post: post, author: first_user, text: 'Hi kim!' )
end