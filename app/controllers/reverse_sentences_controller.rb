class ReverseSentencesController < ApplicationController
    def reverse_sentences
        @text = params[:t]

        if params[:t]
            @text.gsub!(/[.] (\d+)/, '# \1')
            @sentences = @text.split(/[.!?]['"]* |$/)
            @sentences.each { |sentence| sentence.chomp }.reject! { |c| c.blank? }
        end
    end

end
