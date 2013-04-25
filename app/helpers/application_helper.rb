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
        if current_context.respond_to? :context_label
            flag = current_context.context_label == context.context_label ? "<span class='label label-warning'>LTI</span> " : ''

            link_to raw("#{flag}#{context.context_label} #{context.context_title}"), context
        end
    end

    def get_review_type_form_state(prompt, review_type_id)
        if prompt.review_types.map(&:review_type).include?(review_type_id.to_s)
            1
        else
            nil
        end
    end


end
