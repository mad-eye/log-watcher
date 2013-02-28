Meteor.setTimeout ->
    LogEvents.insert makeEvent() 
, 2*1000

makeEvent = ->
    event =
        timestamp: new Date
        level: randomLevel()
        message: randomMessage()
  
randomLevel = ->
    #TODO: Make a random level
    p = Math.random()
    if p > 0.90
        'ERROR'
    else if p > 0.70
        'WARN'
    else if p > 0.40
        'INFO'
    else
        'DEBUG'

randomMessage = ->
    #TODO: Make a random message
    p = Math.random()
    if p > 0.95
        'Emacs detected.'
    else if p > 0.85
        'Found a null something-or-other.'
    else if p > 0.70
        'GET request with fileId 12345'
    else if p > 0.60
        'POST request to update project.'
    else if p > 0.45
        'Starting up server.'
    else if p > 0.30
        "I've run out of funny."
    else if p > 0.10
        'Potential issue with null form.'
    else
        'Core dump breached.'

