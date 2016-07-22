require 'nokogiri'
require 'ap'

class JobList
    attr_reader :filename
    attr_reader :jobs
    
    def initialize (filename)
        @jobs = Array.new
        
        @jobs << "Company-1"
        @jobs << "Company-2"
        @jobs << "Company-3"
        @jobs << "Company-4"
    end
    
    def list (unneeded)
        @jobs.each {|job| ap job }
    end
end