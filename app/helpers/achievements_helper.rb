module AchievementsHelper
  def achievement_image_tag(achievement)
    if achievement.users.include?(current_user)
      image = achievement.image
    else
      image = achievement.image_locked
    end
    return link_to image_tag(image), achievement_path(achievement.id)
  end

end
