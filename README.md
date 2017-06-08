# GeoTask

“GeoTask” - that will enable users to create their ‘Areas’ on the map, add local places (POIs - points of interest) inside the designated area and track their own activities on the selected POI (for example, direct marketing activities, like leaving flyers, catalogs, presenting products or services, etc). 

Main app screen should contain Map view and provide UI for drawing polygon for defining user ‘working’ Area. User can create multiple Areas. User flow should be: 
1.	’Start drawing’ button tap 
2.	tap on more than 2 locations on the map to define polygon points. 
3.	‘End drawing’ button tap that will connect the points into the polygon and draw it on Map 

Start/End drawing should be one button having two states. Cancel button should also be placed on screen so user can opt out of the drawing flow without creating the polygon.) 

Only after the Area is drawn on the Map user can start creating POIs, but only inside his Area (or Areas, if there are more then one). POIs are created by ‘long tap’ gesture on the Map view and should be displayed as standard marker (or pin). After creation and positioning on the Map, address of the POI should be obtained from reverse geocoding service. 

Tap on POI should present the POI details screen that should have: 
- header with POI Info (address, latitude, longitude) 
- list of user Activities 
- button to add new Activity 

Activity screen simply just provides the UI for editing an Activity. Data consists of only title (one line of text) and description (multi-line text). 

All user created data must be persisted on the device and loaded on subsequent application runs. 

Bonus features: 
•	On Main screen, add an option to show all the POIs in List view instead of Map view, and order them by distance to the user (display the distance in list). 
•	Tap on POI shows the popup on Map instead of opening details screen, and display some basic poi info, address (or name, see below) and number of user activities. Tap on the popup (or button inside popup) should then open the POI details. 
•	On POI details screen add the possibility to name the POI, so user can customise the POI display for himself (Adapt the header 
layout so all information is visible). 


Instalation:
pod install
