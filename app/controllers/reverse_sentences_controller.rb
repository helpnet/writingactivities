class ReverseSentencesController < ApplicationController
    def reverse_sentences
        @text = params[:t]

        if params[:t]
            @sentences = Activity::sanitize_dots(@text.dup).split(/[.!?]['"]* |$/)
            @sentences.each { |s| s.chomp! }.each { |s| s.chomp! }.delete_if { |s| s.empty? }.map { |sentence| Activity::restore_dots!(sentence) }
        end
    end

end
