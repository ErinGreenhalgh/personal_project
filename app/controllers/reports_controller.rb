class ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
  end

  def index
    @reports = Report.all
  end
end
