Meteor.setInterval ->
    entry = makeEvent()
    LogEntries.insert entry
    console.log "Made log entry", entry
, 2*1000

Meteor.startup ->
    LogEntries.allow {
      remove: -> true
    }

levelMap = {1:'DEBUG', 2:'INFO', 3:'WARN', 4:'ERROR'}

makeEvent = ->
    level = randomLevel()
    now = new Date()
    seconds = now.getSeconds()
    if seconds < 10
        seconds = "0#{seconds}"
    else
        seconds = "#{seconds}"
    formattedTimestamp = "#{now.getFullYear()}-#{now.getMonth()+1}-#{now.getDate()}"
    formattedTimestamp += " #{now.getHours()}:#{now.getMinutes()}:#{seconds}"
    event =
        timestamp: now
        formattedTimestamp: formattedTimestamp
        level: level
        levelMessage : levelMap[level]
        message: randomMessage()
  
randomLevel = ->
    p = Math.random()
    if p > 0.90
        4
    else if p > 0.70
        3
    else if p > 0.40
        2
    else
        1

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

