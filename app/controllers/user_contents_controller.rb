class UserContentsController < ApplicationController
  def index
    matching_user_contents = UserContent.all

    @list_of_user_contents = matching_user_contents.order({ :created_at => :desc })

    render({ :template => "user_contents/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_contents = UserContent.where({ :id => the_id })

    @the_user_content = matching_user_contents.at(0)

    render({ :template => "user_contents/show.html.erb" })
  end

  def create
    the_user_content = UserContent.new
    the_user_content.photos = params.fetch("query_photos")
    the_user_content.videos = params.fetch("query_videos")
    the_user_content.caption = params.fetch("query_caption")
    the_user_content.owner_id = params.fetch("query_owner_id")
    the_user_content.likes_count = params.fetch("query_likes_count")
    the_user_content.comments_count = params.fetch("query_comments_count")

    if the_user_content.valid?
      the_user_content.save
      redirect_to("/user_contents", { :notice => "User content created successfully." })
    else
      redirect_to("/user_contents", { :notice => "User content failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_content = UserContent.where({ :id => the_id }).at(0)

    the_user_content.photos = params.fetch("query_photos")
    the_user_content.videos = params.fetch("query_videos")
    the_user_content.caption = params.fetch("query_caption")
    the_user_content.owner_id = params.fetch("query_owner_id")
    the_user_content.likes_count = params.fetch("query_likes_count")
    the_user_content.comments_count = params.fetch("query_comments_count")

    if the_user_content.valid?
      the_user_content.save
      redirect_to("/user_contents/#{the_user_content.id}", { :notice => "User content updated successfully."} )
    else
      redirect_to("/user_contents/#{the_user_content.id}", { :alert => "User content failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_content = UserContent.where({ :id => the_id }).at(0)

    the_user_content.destroy

    redirect_to("/user_contents", { :notice => "User content deleted successfully."} )
  end
end
