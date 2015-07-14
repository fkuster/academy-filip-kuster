task :create_users => :environment do

  posts=Post.all
  posts.each do |post|
    user = User.new(email:"#{post.creator_name}@tidder.com",password:('0'..'z').to_a.shuffle.first(8).join,nickname:post.creator_name)
    if user.save
      puts "User created"
    else
      puts "User exists"
    end
  end

  comments = Comment.all
  comments.each do |comment|
    user = User.new(email:"#{comment.author_name}@tidder.com",password:('0'..'z').to_a.shuffle.first(8).join,nickname:comment.author_name)
    if user.save
      puts "User created"
    else
      puts "User exists"
    end
  end
end
