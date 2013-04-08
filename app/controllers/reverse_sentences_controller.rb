class ReverseSentencesController < ApplicationController
    def reverse_sentences
        @text = params[:t]

        if params[:t]
            @sentences = Activity::sanitize_dots(@text.dup).split(/[.!?]['"]* |$/)
            @sentences.each { |sentence| sentence.chomp! }.reject { |c| c.blank? }.map { |sentence| Activity::restore_dots!(sentence) }
        end
    end

end
