class ActivitiesController < ApplicationController
    
    def reverse_paragraph
        @text = params[:t] || ''

        @reverse_text = ''

        if params[:t]
            params[:t].lines.each do |line|
                @reverse_text += line.split(' ').reverse.join(' ') + "\r\n"
            end
        end
    end

end
