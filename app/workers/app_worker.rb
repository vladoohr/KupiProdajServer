class AppWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

  def perform
		puts "SIDEKIQ WORKER STARTS"

	  ummark_featured_post

		mark_featured_post
  end

  def ummark_featured_post
  	featured_ad = Advertisement.find_by(:featured => true)
    if (featured_ad)
    	featured_ad.featured = false
    	featured_ad.save
    end
  end

  def mark_featured_post
  	ads = Advertisement.all
  	all_ads = ads.count
  	index = rand(all_ads)
  	ads[index].featured = true
  	ads[index].save
  end

end