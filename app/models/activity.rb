class Activity < ActiveRecord::Base

    def self.sanitize_dots(string)
        string.gsub(/[.]( *\d+)/, '##\1')
        .gsub(/(al|mr|ms|dr|mrs|vs|ie|eg|ex|ex)[.][|"|'|,]* /i, '\1## ')
        .gsub(/[.]([a-z|A-Z]+)/, '##\1')
        .gsub(/([a-zA-Z#]+)[.]( [a-z])/, '\1##\2')
    end

    def self.restore_dots!(string)
        string.gsub!("##", '.')
    end

end
