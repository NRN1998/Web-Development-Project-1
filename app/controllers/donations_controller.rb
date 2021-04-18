class DonationsController < ApplicationController
  def index
    matching_donations = Donation.all

    @list_of_donations = matching_donations.order({ :created_at => :desc })

    render({ :template => "donations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_donations = Donation.where({ :id => the_id })

    @the_donation = matching_donations.at(0)

    render({ :template => "donations/show.html.erb" })
  end

  def create
    the_donation = Donation.new
    the_donation.donator_id = params.fetch("query_donator_id")
    the_donation.creator_id = params.fetch("query_creator_id")

    if the_donation.valid?
      the_donation.save
      redirect_to("/donations", { :notice => "Donation created successfully." })
    else
      redirect_to("/donations", { :notice => "Donation failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_donation = Donation.where({ :id => the_id }).at(0)

    the_donation.donator_id = params.fetch("query_donator_id")
    the_donation.creator_id = params.fetch("query_creator_id")

    if the_donation.valid?
      the_donation.save
      redirect_to("/donations/#{the_donation.id}", { :notice => "Donation updated successfully."} )
    else
      redirect_to("/donations/#{the_donation.id}", { :alert => "Donation failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_donation = Donation.where({ :id => the_id }).at(0)

    the_donation.destroy

    redirect_to("/donations", { :notice => "Donation deleted successfully."} )
  end
end
