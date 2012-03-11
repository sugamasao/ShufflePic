class WelcomeController < ApplicationController
  def index
    if signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
    unless signed_in?
      redirect_to root_path
    else
      @user = current_user
      @timelines = profile_shuffle!(user_timelines(@user))
    end
  end
  
  private
  def user_timelines(user)
    auth_twitter(user)
#    follower = Twitter.follower_ids(user.name).ids
#    Twitter.user(follower.first.to_i)
    Twitter.home_timeline.map do |tweet_user|
      {
        :name => tweet_user.user.name,
        :screen_name => tweet_user.user.screen_name,
        :profile => tweet_user.user.profile_image_url,
        :text => tweet_user.text
      }
    end
  end
    
  def profile_shuffle!(timelines)
    profiles = timelines.map do |tweet_user|
      tweet_user[:profile]
    end
    profiles.shuffle.each_with_index do |profile, index|
      timelines[index][:profile] = profile
    end
    
    return timelines
  end
end
