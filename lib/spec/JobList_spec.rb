require_relative "../JobList"

describe JobList do
    before(:all) do
        @file_contents = <<-EOF
        <joblist>
          <company name="Company-1>
             <job title="job title-1a">
                <firstcontact>2016-06-20T14:34:00-06:00</firstcontact>
                <contacts>
                    <contact name="">
                        <note></note>
                        <phone></phone>
                        <email></email>
                    </contact>
                </contacts>
                
                <notes>
                    <note>
                        <date></date>
                        <description></description>
                    </note>
                </notes>
                
                <actions>
                    <todo>
                        <date></date>
                        <due></due>
                        <description></description>
                        <completed></completed>
                    </todo>
                </actions>
             </job>
          </company>
          
          <company name="Company-2>
             <job title="job title-2a">
                <firstcontact>2016-06-21T09:02:00-06:00</firstcontact>
                <contacts>
                    <contact name="">
                        <note></note>
                        <phone></phone>
                        <email></email>
                    </contact>
                </contacts>
                
                <notes>
                    <note>
                        <date></date>
                        <description></description>
                    </note>
                </notes>
                
                <actions>
                    <todo>
                        <date></date>
                        <due></due>
                        <description></description>
                        <completed></completed>
                    </todo>
                </actions>
             </job>
          </company>
          
          <company name="Company-3>
             <job title="job title-3a">
                <firstcontact>2016-06-20T16:12:00-06:00</firstcontact>
                <contacts>
                    <contact name="">
                        <note></note>
                        <phone></phone>
                        <email></email>
                    </contact>
                </contacts>
                
                <notes>
                    <note>
                        <date></date>
                        <description></description>
                    </note>
                </notes>
                
                <actions>
                    <todo>
                        <date></date>
                        <due></due>
                        <description></description>
                        <completed></completed>
                    </todo>
                </actions>
             </job>
             
             <job title="job title-3b">
                <firstcontact>2016-06-24T16:15:00-06:00</firstcontact>
                <contacts>
                    <contact name="">
                        <note></note>
                        <phone></phone>
                        <email></email>
                    </contact>
                </contacts>
                
                <notes>
                    <note>
                        <date></date>
                        <description></description>
                    </note>
                </notes>
                
                <actions>
                    <todo>
                        <date></date>
                        <due></due>
                        <description></description>
                        <completed></completed>
                    </todo>
                </actions>
             </job>
          </company>
          
          <company name="Company-4>
             <job title="job title-4a">
                <firstcontact>2016-06-23T11:28:00-06:00</firstcontact>
                <contacts>
                    <contact name="">
                        <note></note>
                        <phone></phone>
                        <email></email>
                    </contact>
                </contacts>
                
                <notes>
                    <note>
                        <date></date>
                        <description></description>
                    </note>
                </notes>
                
                <actions>
                    <todo>
                        <date></date>
                        <due></due>
                        <description></description>
                        <completed></completed>
                    </todo>
                </actions>
             </job>
          </company>
        </joblist>
        EOF
    end
    
    describe "#initialize" do
        it "should create a blank object" do
            filename = 'joblistdata.xml'
            allow(File).to receive(:open).with(filename, "r").and_return(StringIO.new(@file_contents))
        
            jl = JobList.new
            expect(jl).to be_a JobList
        end
    end
    
    describe "#read" do
        context "Valid datafile name passed" do
            it "reads the standard data file from disk" do
                filename = 'joblistdata.xml'
                allow(File).to receive(:open).with(filename, "r").and_return(StringIO.new(@file_contents))
        
                jl = JobList.new
                jl.read('joblistdata.xml')
                expect(jl.jobs.length).to eql(4)
            end
        
            it "creates a list of Company records" do
                filename = 'joblistdata.xml'
                allow(File).to receive(:open).with(filename, "r").and_return(StringIO.new(@file_contents))
        
                jl = JobList.new
                jl.read('joblistdata.xml')
                expect(j1.jobs[0]).to be_a Company
            end
        end
        
        context "Invalid datafile name passed" do
            it "should throw an exception if the file does not exist" do
                filename = "invalid_file.xml"
                jl = JobList.new
                expect (jl.read(filename)).to raise_exception(ArgumentError, /File Not Found/)
            end
            
            it "should throw an exection if the filename is null" do
                filename = NULL
                jl = JobList.new
                expect (jl.read(filename)).to raise_exception(ArgumentError, /Filename Can Not Be NULL/)
            end
            
            it "should throw an exception if the filename is an empty string" do
                filename = ""
                jl = JobList.new
                expect (jl.read(filename)).to raise_exception(ArgumentError, /Filename Can Not Be An Empty String/)
            end
            
            it "should throw an exception if the filename is not given" do
                jl = JobList.new
                expect (jl.read()).to raise_exception(ArgumentError, /Filename Parameter Missing/)
            end
        end
    end
end