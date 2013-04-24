module ApplicationHelper

    def helpful_tooltip
        "<a href='#' data-toggle='tooltip' title='This was helpful' class='helpful-tooltip'><i class='icon-thumbs-up'></i></a>"
    end

    def current_context
        if session[:current_context]
            Context.find_by_context_label(session[:current_context])
        else
            nil
        end
    end

    def link_to_context(context)
        flag = current_context.context_label == context.context_label ? "<span class='label label-warning'>LTI</span> " : ''

        link_to raw("#{flag}#{context.context_label} #{context.context_title}"), context

    end

end
