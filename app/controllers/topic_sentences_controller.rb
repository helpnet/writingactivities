class TopicSentencesController < ApplicationController
    def enter_paragraphs
        @text =  params[:t] || ""

        @topic_sentences = []
        @lines = []

        @text.lines.each do |line|
            line.gsub!(/[.] (\d+)/, '# \1')
            sentence = line.split(/([.!?]['"]* )/).each_slice(2).map(&:join)[0]
            @topic_sentences << sentence if sentence.chomp != ""
        end
    end
end
