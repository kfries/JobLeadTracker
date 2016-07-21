Feature: Help and Version switches
    In order to insure users can easitly use this program
    As the developer
    I want to insure that the program responds correctly to request for help and version
    
    Scenario: jlt should respond to -h
        When I run `jlt -h`
        Then the output should contain "Job Listing Tracker -- Help"
        And the exit status should be 0
    
    Scenario: jlt should respond to --help
        When I run `jlt --help`
        Then the output should contain "Job Listing Tracker -- Help"
        And the exit status should be 0
    
    Scenario: jlt should respond to -v
        When I run `jlt -v`
        Then the output should contain "Job Listing Tracker: 0.0.1"
        And the exit status should be 0
    
    Scenario: jlt should respond to --version
        When I run `jlt --version`
        Then the output should contain "Job Listing Tracker: 0.0.1"
        And the exit status should be 0
    
