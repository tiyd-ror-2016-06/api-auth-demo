module ApplicationHelper
  def distance_of_time time
    if time > Time.now
      "in #{distance_of_time_in_words_to_now time}"
    else
      "#{distance_of_time_in_words_to_now time} ago"
    end
  end
end
