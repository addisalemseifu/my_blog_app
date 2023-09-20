# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
post_list = [];
4.times do |i|
    puts "post #{i}"
    this_post = Post.create(author: first_user, title: 'Hello', text: "This is my post #{i}")
    post_list = post_list.push(this_post)
end

6.times do |i|
    puts "comment #{i}"
    Comment.create(post: post_list[0], author: second_user, text: 'Hi Tom!' )
end