class ProfileSummariesController < ApplicationController
  def show
    @summary = ProfileSummary.get_text(current_user)
  end

  def create_report
    report_generator = ReportGeneratorService.new
    @report = report_generator.create_report_entry(current_user)
    report_generator.create_tone_reports(current_user, @report)
    redirect_to report_path(@report)
  end
end
