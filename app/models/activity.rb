class Activity < ActiveRecord::Base

    def self.sanitize_dots(string)
        string.gsub(/[.]( *\d+)/, '##\1').gsub(/(al|Mr|Ms|Dr|Mrs|vs|Vs|i.e|I.e|ex|EX|e.x|E.X)[.]["|'|,]* /, '\1## ')
    end

    def self.restore_dots!(string)
        string.gsub!("##", '.')
    end

end
