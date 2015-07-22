
task :get_posts => :environment do
  def save_comments(permalink,post)
    url=  "https://www.reddit.com#{permalink}".chomp
    response= HTTParty.get "#{url}.json"
    puts "      No comments for this post" if response[1]["data"]["children"].empty?
    response[1]["data"]["children"].each do |comment|
      post.comments.create(content:comment["data"]["body"],author_name:comment["data"]["author"])
      puts "      Added comment for last post"
    end

  end
  subreddits=Subreddit.all
  subreddits.each do |subreddit|
     response = HTTParty.get "https://www.reddit.com/r/#{subreddit.name}/new.json?sort=new"
     response["data"]["children"].first(10).each do |item|
        if item["data"]["selftext"].empty?
          content=item["data"]["url"]
        else
          content=item["data"]["selftext"]
        end

        post = subreddit.posts.create(title:item["data"]["title"],
                         creator_name:item["data"]["author"],
                         content:content)


        puts "Post for #{subreddit.name} added!"
        save_comments(item["data"]["permalink"],post)

     end
  end
end
