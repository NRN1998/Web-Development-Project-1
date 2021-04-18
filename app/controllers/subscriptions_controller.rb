class SubscriptionsController < ApplicationController
  def index
    matching_subscriptions = Subscription.all

    @list_of_subscriptions = matching_subscriptions.order({ :created_at => :desc })

    render({ :template => "subscriptions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subscriptions = Subscription.where({ :id => the_id })

    @the_subscription = matching_subscriptions.at(0)

    render({ :template => "subscriptions/show.html.erb" })
  end

  def create
    the_subscription = Subscription.new
    the_subscription.subscriber_id = params.fetch("query_subscriber_id")
    the_subscription.creator_id = params.fetch("query_creator_id")
    the_subscription.active = params.fetch("query_active", false)
    the_subscription.duration = params.fetch("query_duration")
    the_subscription.amount = params.fetch("query_amount")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions", { :notice => "Subscription created successfully." })
    else
      redirect_to("/subscriptions", { :notice => "Subscription failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.subscriber_id = params.fetch("query_subscriber_id")
    the_subscription.creator_id = params.fetch("query_creator_id")
    the_subscription.active = params.fetch("query_active", false)
    the_subscription.duration = params.fetch("query_duration")
    the_subscription.amount = params.fetch("query_amount")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions/#{the_subscription.id}", { :notice => "Subscription updated successfully."} )
    else
      redirect_to("/subscriptions/#{the_subscription.id}", { :alert => "Subscription failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.destroy

    redirect_to("/subscriptions", { :notice => "Subscription deleted successfully."} )
  end
end
