class ActivitiesController < ApplicationController
    
    def reverse_paragraph
        @text = params[:t] || ''

        @reverse_text = ''

        @markup_text = ''

        if params[:t]
            @markup_text = add_markup(@text)
        end

        if params[:t]
            @text.lines.each do |line|
                @reverse_text += line.split(' ').reverse.join(' ') + "\r\n"
            end
        end

        @reverse_text = add_markup(@reverse_text, true)

    end

    protected

    def add_markup(input, reverse=false)
        output = ''
        input.lines.each do |line|
            output += line.split.map { |word| "<a href='#' class='#{get_word_identifier(line.split, word, reverse)}'>#{word}</a>" }.join(' ') + "\r\n"
        end
        output
    end

    def get_word_identifier(array, value, reverse=false)
        if reverse
            (array.length - array.index(value)) - 1
        else
            array.index(value)
        end
    end
end
