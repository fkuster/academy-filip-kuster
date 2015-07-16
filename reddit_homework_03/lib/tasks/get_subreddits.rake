task :subreddits => :environment do

   response= HTTParty.get "https://www.reddit.com/reddits.json?sort=hot"
   response["data"]["children"].first(10).each do |item|
      Subreddit.find_or_create_by(name: item['data']['display_name']) do |subreddit|
         subreddit.title = item['data']['title']
         subreddit.description = item['data']['description'].first(500)
      end
   end
end
