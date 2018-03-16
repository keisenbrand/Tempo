Tempo App

Overview: Tempo is an iOS app to display performance management data from various brands.

How to use: 
Log in using your google email (all of which should be registered for google auth already, for Google analytics)
Select the brands you want to view, click done
Use the left side menu to switch between brand dashboards

For dev:
Run Database (Tempo/Database/DynamoDb rundb)


Run Server (Tempo/Server python TempoServer.py)


Implemented:
Protocol Buffer Object:
Script to install necessary packages, frameworks, and modules: Tempo/protoinstallation.sh
Wrote prototype for the User and Brand models to use in database/server/client code (Tempo/ProtoSchema/user.proto)
Wrote script that uses Google Protobuf to generate User model in both Python and Swift (Tempo/ProtoSchema/user.proto)
Python model: Tempo/ProtoSchema/user_pb2.py
Swift model: Tempo/ProtoSchema/user.pb.swift

Server:
Using a local version of DynamoDB for development
Created the main User table: Tempo/Server/Schema.py
DB Helper methods: Tempo/Server/Database.py
Generate dummy data for development
Helper methods for CRUD operations (create, read, update, delete) as put, get, update, remove methods
Server code: Tempo/Server/TempoServer.py
App routing utilizes DB helper methods for CRUD operations

Database:
All DynamoDB generated set-up code is in Tempo/Database/DynamoDb

Client:
iOS native, written in Swift 4
All client code is contained in Tempo/Tempo
Server API Code in Tempo/Models/Networking
3 views:
Sign-in: Google OAuth 2.0
NUX (New User Experience): Select brands you regularly check up on
Home: Brand dashboards
Google Auth implemented
Todo: token authorization on the backend
NUX implemented
Todo: only show if new user, add saveUser functionality to send to backend
Home:
Implemented:
Hamburger menu functionality
Todo:
Display brands to toggle between in the hamburger menu
Use real data in the menu
Allow user to edit bookmarked brands
Data visualizations:
Use Mode endpoint to get brand data as json
Choose mobile data visualization library to show the info (d3, high charts)


To-do:
Lower image resolution so they load faster on Brand NUX
Make it so NUX only appears for first-time users
Fix server code for update users + their brand preferences
Add editing brand preferences to tableview on HomeViewController
Do data visualizations
Error handling


Summary:
Most of the backend leg work is done — I generalized the network and server routing from the client side, so you should be able to add methods and modify the methods in TempoServer.py without breaking anything.
Future developers will want to set up dynamoDB locally on their machine to complete development.
Client UI shell is set up, the biggest thing left to do is the data visualizations for the home page. This is a fairly big task. Future developer will have to use the Mode endpoint to get all the brand data to be displayed, get it as json instead of a white label embed, and choose a data visualization library to display it with.
