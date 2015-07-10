task :subreddits => :environment do

    def get_subreddits(children)
      10.times do |i|
        if Subreddit.where(name:children[i]["data"]["display_name"]).empty?

          new_subreddit=Subreddit.new(name:children[i]["data"]["display_name"],
                                      title:children[i]["data"]["title"],
                                      description:children[i]["data"]["description"][0...20])
              if new_subreddit.save!
                  puts "Added"
              else
                  puts "Saving record failed"
              end
         else
           puts "Exists"
        end
      end
    end

  hot_subreddits= HTTParty.get "https://www.reddit.com/reddits.json?sort=hot"
  data= ActiveSupport::JSON.decode(hot_subreddits.body)
  children=data["data"]["children"]
  get_subreddits(children)

end
