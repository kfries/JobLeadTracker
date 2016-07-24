require 'nokogiri'
require 'ap'

class JobList
    attr_reader :jobs
    
    def initialize
        @filename = nil
        @jobs = Array.new
    end
    
    def read(filename)
        data = Nokogiri::XML(File.open(filename, "r"))
        data.xpath("//company").each do |company|
            ap company.inspect
            @jobs << company
        end
    end
end