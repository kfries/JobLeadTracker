require 'nokogiri'
require 'ap'

class JobList
    attr_reader :filename
    attr_reader :jobs
    
    def initialize (filename)
        @jobs = Array.new
        
        @filename = filename.nil? ? "joblistdata.xml" : filename
        data = Nokogiri::XML(File.read(@filename,))
        
        unless data.nil?
            data.root.children.each do |child|
                ap child.child
            end
                
            # @jobs << data.search("job")["Company"]
        end
        
        ap @jobs
    end
end