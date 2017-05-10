# WriteLink

### Background:
In my past experience working with writers in both an academic and a business setting, I have found that people often have trouble assessing how well their writing communicates what they intend and therefore have trouble editing and improving their writing. This app helps address this problem by providing users with data about the tones present in their writing so users can have more concrete details about the effectiveness of their writing. 

### Features:
* Users log in through LinkedIn Oauth
* The app pulls in the user's LinkedIn profile summary from the LinkedIn API
* The user selects their profile summary text to be analyzed 
* When the user clicks "Analyze", the summary text is sent to IBM Watson's Tone Analyzer API, which then generates a report of tone data
  * Tone data currently comes as a percente likelihood that a given tone exists in the text. Tone categories are social tendencies (openness, conscientiousnesss, extraversion, agreeableness, emotional range), emotional tones (sadness, joy, anger, disgust, and fear), and language style (confident, analytical, tentative).

### Still To Do:
* **Editing Your Summary:** Users will be able to edit their profile summary and resubmit it for analysis.
* **See comparison reports:** It will be most useful to users to see how their analysis differs between drafts of their summary. Users will be able to choose two reports and see the different between them. For example, they could see that their edit improved their confidence score by 15%. 

### Running Locally:
1. Clone this repo
2. Run `bundle install` to install necessary gems
3. Set up the database: `rake db:create db:migrate`
3. Run `rails s` to fire up the development server
4. Navigate to `localhost:3000`
5. Run `rspec` to run the test suite

