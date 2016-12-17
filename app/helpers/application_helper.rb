module ApplicationHelper
	
def profile_img(user)
  #binding.pry
	#return image_tag(user.avatar_url) if user.avatar_url?
	# return image_tag(user.img_url) if user.img_url?
     unless user.provider.blank?
       img_url = user.avatar_url
    else
      img_url = 'no_image.png'
   end
#binding.pry
   image_tag(img_url)
  end
end
