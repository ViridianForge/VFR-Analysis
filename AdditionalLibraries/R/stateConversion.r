#Function to convert state FIPS codes to full state names or vice-versa [as factor levels for downstream grouping]:
#x is a vector of state abbreviations, or full state names.
#direction (name to code, or code to name) is determined automatically based on the supplied data
#depending on ultimate use of the returned set, users may wish to retain factor levels for all states (default) or only those states for which data was passed to the function. factor levels (faclevs) should be indicated ('all' or 'selected') so as to return the desired state factors for downstream use (default is to supply factor levels only for those states supplied in the dataset).
#
#Originally taken from:  https://favorableoutcomes.wordpress.com/2014/10/28/updated-r-function-state-conversion-for-converting-state-codes-to-full-state-name/
#
#06/23/2015 -- Added ability to convert State names to all lower or all uppercase.  Done for choroplethr compatibility.
#Added by Wayne Manselle

stateConversion <- function(x, faclevs = 'selected', case = 'none') {
  
  st.codes <- data.frame(state = as.factor(c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI",
                                             "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN",
                                             "MO", "MS",  "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH",
                                             "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT",
                                             "WA", "WI", "WV", "WY")),
                         full = as.factor(c("Alaska","Alabama" ,  "Arkansas", "Arizona","California" , "Colorado" ,
                                            "Connecticut", "District of Columbia","Delaware" ,  "Florida" , "Georgia" ,
                                            "Hawaii","Iowa" ,"Idaho" , "Illinois" , "Indiana" ,  "Kansas" ,
                                            "Kentucky" , "Louisiana" , "Massachusetts", "Maryland" ,"Maine" ,
                                            "Michigan" , "Minnesota" , "Missouri" ,"Mississippi" ,  "Montana" ,
                                            "North Carolina","North Dakota", "Nebraska" , "New Hampshire" , "New Jersey" ,  "New Mexico" ,
                                            "Nevada" ,"New York" , "Ohio" , "Oklahoma" ,
                                            "Oregon" , "Pennsylvania" , "Puerto Rico", "Rhode Island" , "South Carolina", "South Dakota" ,
                                            "Tennessee" , "Texas" , "Utah" ,  "Virginia","Vermont" ,
                                            "Washington" , "Wisconsin", "West Virginia" , "Wyoming"))
  )
  
  if (nchar(x[1]) == 2) { 
    st.x <- data.frame(state = x); 
    refac.x <- st.codes$full[match(tolower(st.x$state), tolower(st.codes$state))] 
  } else { 
    st.x <- data.frame(full = x); 
    refac.x <- st.codes$state[match(tolower(st.x$full), tolower(st.codes$full))] 
  }
  
  if(case != 'none'){
    if(case == 'lower'){
      refac.x <- tolower(refac.x)
    } else if (case == 'upper'){
      refac.x <- toupper(refac.x)
    } else {
      simpleError('Invalid Arguemtn. Valid arguments to case are "none", "lower" and "upper".')
    }
  }
  
  if(faclevs == 'all') {
    return(refac.x)
  } else {
    return(factor(refac.x))
  }
  
}