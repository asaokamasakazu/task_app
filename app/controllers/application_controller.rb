class ApplicationController < ActionController::Base
  def time
    @time = Time.now
  end

  def schedule_count
    @schedule_count = Post.all.count
  end
end
