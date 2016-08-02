class ToneDataFormatterService
  def service
    ToneAnalyzerService.new
  end

  def categories(user)
    data = service.analyze_text(user)
    data["document_tone"]["tone_categories"]
  end

  def emotion_tones(user)
    categories(user)[0]
  end

  def language_tones(user)
    categories(user)[1]
  end

  def social_tones(user)
    categories(user)[2]
  end

  def round(score)
    (score * 1000).to_i
  end

  def format_attributes(tones)
    tones.map do |tone|
      [tone["tone_id"], round(tone["score"])]
    end.to_h
  end

  def emotion_attributes(user)
    format_attributes(emotion_tones(user)["tones"])
  end

  def language_attributes(user)
    format_attributes(language_tones(user)["tones"])
  end

  def format_social_tone_name(tone)
    tone[0..-6]
  end

  def social_attributes(user)
    data = format_attributes(social_tones(user)["tones"])
    data.map do |key, value|
      [format_social_tone_name(key), value]
    end.to_h
  end
end
