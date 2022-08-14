#Russian Case Practice Exercise Generator
#By: Julie Rudman-Melnick
#Last Updated: 8/14/22

#Purpose: This code provides a simple way to practice the system of Russian declension by generating exercises 

#Instructions: 
#1. Save the CSV file in desired location. Update the location of the CSV file in the russ_dict_data line
#2. Run code in RStudio (ensure that the manipulate package is installed)
#3. Click on the gray item in the upper left hand corner of the plot
#4. Select from the drop down menu the which case to practice (accusative, genitive, dative, instrumental, or prepositional). 
#Click new Exercise
#5. Answer the question that appears in the plot
#6. Check answer by looking at the latest line in the R console

#Possible future updates: 
#-expand the dictionary, including a variety of nouns and adjectives (with handling for e.g. animate vs. inanimate and other nuances)
#-add a way for user to input an answer (e.g. on screen Russian keyboard) and for the code to check if the user's answer is correct
#-Replatform to Python or Java
#-provide a mini context for the case requested (e.g. for instrumental case, C + _____)
#-add the option to practice a random case
#-write the rules for declension into the code instead of relying on a dictionary

library(manipulate)

russ_dict_data <- read.csv("C:\\Users\\Julie\\Downloads\\Dict_Data.csv")

tot_num_entries <- length(russ_dict_data$nominative_case)

manipulate({
    
  selected_entry <- round(runif(1, 1,tot_num_entries),0)
    
  plot(0, xaxt = 'n', yaxt = 'n', ann=FALSE, col = "white")
  
  if(newExercise) {
    
    text(x = 1, 
         y = 1, 
        paste("Provide ", selectedCase," case:", sep = "")
         )
    
    text(x = 1, 
         y = 0.5, 
         russ_dict_data$nominative_case[[selected_entry]]
         )
    
    paste(selectedCase, 
          " case of ",
          russ_dict_data$nominative_case[[selected_entry]], 
          " is: ",
          eval(parse(text  =  paste('russ_dict_data$', selectedCase,'_case[[selected_entry]]', sep = ""))),
          sep = "")
    }
}, 
  selectedCase = picker("accusative", "genitive", "dative", "instrumental", "prepositional"), 
  newExercise = button("New Exercise")
)

