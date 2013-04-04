class ReverseWordsController < ApplicationController

    def reverse_words
        @text = params[:t] || ''

        @reverse_text = ''

        @markup_text = ''

        if params[:t]
            @markup_text = add_markup(@text)
        end 

        if params[:t]
            @text.lines.each do |line, index|
                @reverse_text += line.split(' ').reverse.join(' ') + "\r\n"
            end 
        end 

        @reverse_text = add_markup(@reverse_text, true)

    end 

    protected

    def add_markup(input, reverse=false)
        output = ''
        input.lines.each_with_index do |line, index|
            output += "<div class='line#{index}'>" + line.split.each_with_index.map { |word, index| "<a href='#' class='#{get_word_identifier(line.split, index, reverse)}'>#{word}</a>" }.join(' ') + "</div>" + "\r\n"
        end 
        output
    end 

    def get_word_identifier(array, index, reverse=false)
        if reverse
            (array.length - index) - 1 
        else
            index
        end 
    end 
end
