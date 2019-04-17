Group Project - README Template
===

# Tasty Recipe Finder

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Tasty Recipe Finder is an app that allows people to exchange various recipes from all over the world. You can search for different recipes based on critreria you choose. You can also follow other users and view their profiles. In other words, it will be an interactive social media network that allows people to share their recipes with the world.

### App Evaluation
- **Category:** Food / Social Networking
- **Mobile:** This app will be primarily developed to function on a mobile phone but could be modified to be compatible with a computer system in the future.
- **Story:** This app allows usesrs to post recipes and discover other people's recipes based on what they search for. Users would be able to follow others to allow for people to keep up to date on their favorite chefs.
- **Market:** This app would be available to any invidual who enjoys cooking and trying new recipes. 
- **Habit:** This app allows for people to use it whenever they would like to. It would be useful everyday for someone who likes to experiment in the kitchen and/or share their own recipes. 
- **Scope:** As of right now, our short term goal is to allow users to share their recipes with people who share the same food preferences as them. Later on this app could allow for live streaming of cooking sessions and/or posting videos of recipes. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] Users can sign up.   
* [x] Users can sign in.    
* Users can search for preferred recipes.  
* Users can search for and refine their results by continents, diets etc.   
* Users can attach pictures of meals to their posts. 
* Users can add comments to posts on their feed.   
* Users can follow other users.  
* Users can favorite recipes.  
* [x] Profile pages for each user   
* Settings (Accesibility, Notification, General, etc.) 

**Optional Nice-to-have Stories**

* List of suggested recipes based on past liked posts.
* Users can set to block certain posts.
* Users can block other users to deny seeing their posts.
* Users can attach gifs or pictures to their posts.

### 2. Screen Archetypes
* Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in or sign up to gain access to their profile.
* Explore Screen
   * Upon selecting continent choice users get to select which type of meal they want to work on and decide on different factors of the meal. The refinement of this screen can be by region of origin, breakfast, dinner, time it takes to make, etc. By default it will show the most recent posts. 
* Post Screen
   * This screen will allow users to create a post. Users can add a picture, title, steps, and other details of thwe meal to make searching for it easy. 
* Feed Screen
   * Allows user see the current posts made by people that they are following. 
* Profile Screen.
   * Allows user to upload photos of meals they have prepared.Similar to a Facebook bio,a user will have the option of sharing personal information such as school attended, state they are from, etc.  
* Settings Screen
   * Lets people change profile and app notification settings.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Add/Create Recipe
* Profile
* Settings
* Search for recipe (Explore)

**Flow Navigation** (Screen to Screen)

* Sign up-> Account creation if no log in is available
   * once logged in it'll go to the explore screen.
* Explore -> goes to feed on selection
   * can select feed or explore.
* Profile -> profile can be modified
   * can modify profile and view who you are following and posts you made.
* Settings -> toggle settings
   * this will allow you to change your settings.
* Post -> can create a post
   * This will allow you to create a post. 

## Wireframes
<img src="https://github.com/tastyrecipefinder/TastyRecipeFinder/blob/master/Screen%20Shot%202019-03-26%20at%2010.53.01%20PM.png?raw=true" width=600>





### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
### post model
| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| objectId | string  | individual ids for users to post recipes and ingredients  |
| user  | string  | user's name  |
| user image | file | user's picture on profile |
| postimage |file | Recipe |
| caption | string | comment created by user based on his or her recipe |
| post At| date/time | time at which user posted his recipe |
| title | string | Name of food user wants to share |
| like count | Number | Number of likes|
| comment count | number | number of comments |
### explore model
| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| refine | string | sets of string that make precise searching |
| user  | string  | user's name  |
| postimage |file | Recipe |
| caption | string | comment created by user based on his or her recipe |
| post At| date/time | time at which user posted his recipe |
| title | string | Name of food user wants to share |
### search model
| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| search box | textbox | box to type what you are searching for |
| cancel | button | button to stop searching and oush the kepad down |
| clear | button | delet all the words typed and start typing a new search|
### settings model
| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| help | button | leads you to a page of most asked questions and their answers |
| display | button | adjust and customize theview of your app|
| logout | button | choose to sign out and log back in the next time|
| about | button | description about the app|
| notifications| button | choose whether to get notified or not |
| account | button | change your account setup|
| acknowledgements | button | creators of the application |



### Networking

Sign Up/Sign In

* Make a new account

        var user = PFUser()
        user.username = usernameBox.text
        user.password = passwordBox.text
        user.signUpInBackground { (success, error) in
            if error != nil {
                self.performSegue(withIdentifier: "loginsuccess", sender: nil)
            } else {
                print ("Error: \(error?.localizedDescription)")
            }

* Sign in

        let username = usernameBox.text!
        let password = passwordBox.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginsuccess", sender: nil)
            }else{
                print ("Error: \(error?.localizedDescription)")
            }

Explore
* query all posts
* create new like on a post
* create new comment on a post
* date created
* refine page to show posts from logged in user's following users



Profile
* get logged in user information
* update user image
* get all users that logged in user is following
* count number of likes
* count number of posts of logged in user
* query all posts where author is logged in user


Post
* Create a new post object


Settings
* update font size
* update notification settings





- [OPTIONAL: List endpoints if using existing API such as Yelp]



Build as of 4/9/19:


<img src="http://g.recordit.co/nPU5sPw46M.gif" width=200>



Build as of 4/16/19:


<img src="http://g.recordit.co/N1y45dVUuL.gif" width=200>
