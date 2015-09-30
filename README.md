# UIUC Counseling

Twelve years ago, I failed out of the University of Illinois Urbana-Champaign. In retrospect, I was suffering from [bipolar](http://baugues.com/bipolar) disorder and ADHD, but I didn't know that then. 

About seven years ago I started to get treatment. I take a pill for my bipolar every morning and [occasionally take stimulants for ADHD](http://baugues.com/adhd-meds) and life's been much improved. 

Over the last two years, I've spoken at a bunch of tech events on [developers and depression](http://devsanddepression.com). Last year I had the honor of returning to UIUC to speak to the students in the computer science program. That was a healing moment for me -- coming back to the site of my biggest life failure and speaking in the new CS building just blocks from the apartment where I slept away the worst year of my life. 

I have three goals whenever I speak about this stuff: 

1. Make it more okay to talk about depression and other mental illnesses by going first. 
2. Help folks realize that if they're struggling with certain symptoms, they may have a treatable mental health condition as opposed to just being a lazy bastard
3. Encourage them to seek professional help

As for #3: Students struggling with mental illness at UIUC have an advantage over the folks not in college: free counseling. Unfortunately, the UIUC counseling center only offers [same day appointments](http://counselingcenter.illinois.edu/making-appointment) and to set up that appointment you have to call them at 7:50am. 

![](/public/uiuc-counseling.png)

Now, I don't fault the counseling center at all for this. They are in a difficult *demand > supply* situation. If you think back to Econ 101, the two most common methods of allocating scarce resources are pricing and queuing (and sadly, counseling is a *very* scarce resource in this country). When you give away an in-demand resource for free, lines form. So I'm not sure the Counseling Center has any better plays here. 

(As an aside, this is why I'm one of the few fans of the recent increase in street meter parking prices in Chicago -- you can always find a spot when you need one. Unfortunately, that market mechanism doesn't translate over to mental health care where "I'm so depressed I can't keep a job" and "I'm so poor I can't treat my depression" causes a downward spiral that's bad for both the individual and society. But I digress...)

When I was depressed, the only way that I was awake at 7:50am was if I had been up all night. I heard similar sentiments from several of the students I spoke with after my talk: that it felt nearly impossible for to a) remember to do *anything* at a specific time b) wake up that early and make the call. 

So, I thought we might build something with Twilio to give those kids a fighting chance of getting an appointment. 

Here's what I have in mind: 

- If you want to see a therapist, you text a Twilio number. 
- Twilio responds, tells you that you've been signed up to the list. 
- At 7:49 every morning, our script calls everyone who has texted into the number. 
- If they pick up the phone, Twilio dials the counseling center and connects the two calls. 
- If they don't pick up the phone, we send them a text message, telling them we tried to reach them, and passing along the phone number of the counseling center should they wake up soon. 
- At any time, if a student wants to opt out and have us stop calling them, they can text in STOP and we'll remove them from the list. This could happen because they no longer want to see a therapist or, ideally, because they got through and were able to set up that appointment. 

I'm going back down to speak at UIUC again this weekend for [Reflections|Projections](https://www-s.acm.illinois.edu/conference/2015/) and would love to present this number during my talk. I'd also like to write up a tutorial of this app as a post for the [Twilio Blog](http://twilio.com/blog) as I imagine the inbound message handling, call scheduling, call forwarding could be useful for other folks. 

For tech stack: 

- I'll use Ruby and Sinatra since that's what I'm most productive in and time is a bit short. Rails always feels like a bit of overkill for simple Twilio apps. 

- Thinking about using plaintext files as a datastore. It's kind of hipster, but I'm not sure I need to pull in a database dependency simply to keep a list of numbers. Dunno. This will be one of those things that we'll figure out as we code I suppose. 

- Deployment I'll either use Digital Ocean or Heroku. The latter is a bit faster but more expensive. I'm also not sure the best way to schedule the job. Cronjob seems like the obvious choice, but I'm not really sure how that'll work when it's running inside a container. I *think* that you have to use an add-on to schedule jobs with Heroku which comes at an additional expense. For an app this simple it seems silly to be spending >$5+ a month on hosting. 

We'll see if we can bang this out in a couple hours of livecoding.tv. I'll keep a [TODO](TODO.md) list and knock things out as we go. 




