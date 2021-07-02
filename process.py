log_file = open("um-server-01.txt") #This opens the um-server-01.txt file from Python and gives it the name/variable log_file


def sales_reports(log_file): #def is a function or method called sales_reports that calls on the log_file
    for line in log_file:   #Initiates a loop called line to be executed on the log_file
        line = line.rstrip() #Returns a copy of a string & removes trailing characters or spaces. In this case spaces.
        day = line[0:3] # Index 0, 3 characters 
        if day == "Mon": # if the day is equal to the string value
            print(line) #Print the line from the txt file.


sales_reports(log_file) #Method called upon
