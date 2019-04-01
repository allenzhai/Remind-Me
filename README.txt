Allen Zhai, Maggie Chang, Jumer Caragay, Hannah Allen
Team JHAM

Our app - RemindMe, a reminders app

Prototype features
- when “Add” button (top right) is clicked, user will be directed to a new view where they can add to reminder text field, set priority, and add to notes text field
- when “Add” button (bottom) is clicked, data that is entered by user will be added to the Firebase database 
- in the Firebase database, each simulator/device has their own UID, so that when the app loads, only their own reminders will be loaded
- Cells are sorted with highest priority reminders at the top and low priority reminders at the bottom
- back button segues back to main table view 
- When you click on a cell, it shows reminder information
- Each table cell displays reminder name and notes as the subtitle 
- Edit button shows the delete button but the delete button does not delete the cell yet 

Next Steps
- Figure out how to delete data from the database programmatically (instead of manually)
- Add time created and time needed to complete by as reminder information
- Notify user about their reminder (if we end up implementing time)
- Beautify our app

