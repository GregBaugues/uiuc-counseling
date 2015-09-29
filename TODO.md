# UIUC Counseling TODO list

## Questions? 
- Do we want users to text in their name? Don't think so. Anonymity. Typically helpful if we ask them to text in something to avoid analysis paralysis. Spirit animal? Favorite movie or video game character? Use that as proxy identity?
- Should I write tests? 

## Setup
- setup a Twilio number to serve as surrogate counseling number for testing
- set up development environment

## Inbound messages
- Reply to inbound message. Tell them they can reply with STOP to be removed
- Add sender's phone number to the "to send list"
- If they've requested STOP, remove from the list
- If they're already added.... do nothing? 

## Phone Call
- Standalone script (not in Sintra) to run through list of folks, place a call, and forward it if they pickup. 

## Post Call
- If a call is connected, ask the user if they got an appointment set. Can do this with a callback on the phonecall. 
- Worth storing this info? Don't think so. 

## Datastore
- Add user to the list
- move user from active to inactive
- figure out if flatfile or CSV is the right way to do this or if I'm just going to reinvent a bunch of wheels. 

## Deployment
- Choose Digital Ocean or Heroku 
- Deploy it
- Set Twilio ENV vars on deployment 
- Setup Cron job or equivalent
- Any special security concerns? 

## Stretch Goals
- come up with a good name for this
- register a domain
- create a landing page with instructions

# Done