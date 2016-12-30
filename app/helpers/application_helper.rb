module ApplicationHelper
	
def profile_img(user)
  #binding.pry
  #img_url = user.avatar_url
	#return image_tag(user.avatar_url) if user.avatar_url ?
	# return image_tag(user.img_url) if user.img_url?

     unless user.provider.blank?
       img_url = user.avatar_url
       #image_tag(user.avatar_url)
    else
      img_url = "https://riracle.com/images/common/noimage.png"
      #image_tag(img_url)
    end
    if img_url..nil?
      image_tag(img_url)
    else
      image_tag('no_image.png')
    end
#binding.pry
   
  end
end
