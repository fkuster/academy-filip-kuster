task :get_posts => :environment do
  def save_comments(permalink)
    url=  "https://www.reddit.com#{permalink}".chomp
    response= HTTParty.get "#{url}.json"
    data= ActiveSupport::JSON.decode(response.body)
    children= data[1]["data"]["children"]
    post=Post.last
    puts "      No comments for this post" if children.empty?

    children.each do |comment|
      post.comments.create(content:comment["data"]["body"],author_name:comment["data"]["author"])
      puts "      Added comment for last post"
    end

  end
  subreddits=Subreddit.all
  subreddits.each do |subreddit|
    response= HTTParty.get "https://www.reddit.com/r/#{subreddit.name}/new.json?sort=new"
    data= ActiveSupport::JSON.decode(response.body)
    children= data["data"]["children"]

    10.times do |i|

        if children[i]["data"]["selftext"].empty?
          content=children[i]["data"]["url"]
        else
          content=children[i]["data"]["selftext"]
        end

        subreddit.posts.create(title:children[i]["data"]["title"],
                         creator_name:children[i]["data"]["author"],
                         content:content)


        puts "Post for #{subreddit.name} added!"
        save_comments(children[i]["data"]["permalink"])

      end
  end
end
