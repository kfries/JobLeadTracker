Feature: Reporting Actions
    In order to make data available easitly
    As the end user
    I want to output the results of an action
        
    Scenario: Invalid should display an error
        When I run `jlt invalid`
        Then stderr should contain "Invalid Action"
        And the exit status should not be 0
    
    Scenario: List should display all the current list items
        When I run `jlt list`
        Then output should contain "Company-1"
        And output should contain "Company-2"
        And output should contain "Company-3"
        And output should contain "Company-4"
        And the exit status should be 0
