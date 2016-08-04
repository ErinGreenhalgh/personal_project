class ReportGeneratorService
  def initialize
    @_formatter = ToneDataFormatterService.new
  end

  def create_report_entry(user)
    Report.create!(profile_summary: user.profile_summary,
                   text:            user.profile_summary.content)
  end

  def create_emotion_tone(user, report)
    tone = _formatter.emotion_attributes(user)
    EmotionTone.create!(anger:  tone["anger"],
                       disgust: tone["disgust"],
                       fear:    tone["fear"],
                       joy:     tone["joy"],
                       sadness: tone["sadness"],
                       report:  report)
  end

  def create_language_tone(user, report)
    tone = _formatter.language_attributes(user)
    LanguageTone.create!(analytical: tone["analytical"],
                        confident:   tone["confident"],
                        tentative:   tone["tentative"],
                        report:      report)
  end

  def create_social_tone(user, report)
    tone = _formatter.social_attributes(user)
    SocialTone.create!(openness:         tone["openeness"],
                      conscientiousness: tone["conscientiousness"],
                      extraversion:      tone["extraversion"],
                      agreeableness:     tone["agreeableness"],
                      emotional_range:   tone["emotional_range"],
                      report:            report)
  end

  def create_tone_reports(user, report)
    create_emotion_tone(user, report)
    create_language_tone(user, report)
    create_social_tone(user, report)
  end

  private
  def _formatter
    @_formatter
  end
end
