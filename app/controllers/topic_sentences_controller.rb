class TopicSentencesController < ApplicationController
    def enter_paragraphs
        @text =  params[:t] || ""

        @topic_sentences = []
        @lines = []

        @text.lines.each do |line|
            matches =  /([^\r\n.!?]+([.!?]+|$))/.match(line)
            @topic_sentences << matches[1] if matches.respond_to? :[]
        end
    end
end
