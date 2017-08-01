class ServiceMilestonesController < ApplicationController
  def show
    @service_milestone = ServiceMilestone.find(params[:id])
  end
end