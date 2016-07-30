class ProfileSummariesController < ApplicationController
  def show
    @summary = ProfileSummary.get_text(current_user)
  end
end
