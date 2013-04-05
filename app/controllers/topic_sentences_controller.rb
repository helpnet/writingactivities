class TopicSentencesController < ApplicationController
    def enter_paragraphs
        @text =  params[:t] || ""

        @topic_sentences = []
        @lines = []

        @text.lines.each do |line|
            sentence = Activity::sanitize_dots(line).split(/([.!?]['"]* )/).each_slice(2).map(&:join)[0]
            Activity::restore_dots!(sentence)
            @topic_sentences << sentence if sentence.chomp != ""
        end
    end
end
