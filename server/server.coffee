Meteor.setInterval ->
    entry = makeEvent()
    LogEntries.insert entry
    console.log "Made log entry", entry
, 2*1000

Meteor.startup ->
    LogEntries.allow {
      remove: -> true
    }
    
Meteor.methods
    log: (level, message)->
        makeEvent(level, message)

levelMap = {1:'DEBUG', 2:'INFO', 3:'WARN', 4:'ERROR'}

cleanDigit = (digit) ->
    if digit < 10
        digit = "0#{digit}"
    else
        digit = "#{digit}"


makeEvent = (level, message)->
    level = randomLevel() unless level
    message = randomMessage() unless message
    now = new Date()
    seconds = cleanDigit now.getSeconds()
    minutes = cleanDigit now.getminutes()
    hours = cleanDigit now.gethours()
    formattedTimestamp = "#{now.getFullYear()}-#{now.getMonth()+1}-#{now.getDate()}"
    formattedTimestamp += " #{hours}:#{minutes}:#{seconds}"
    event =
        timestamp: now
        formattedTimestamp: formattedTimestamp
        level: level
        levelMessage : levelMap[level]
        message: message
  
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
    else if p > 0.75
        'GET request for more cat videos.'
    else if p > 0.65
        'T-minus 3 days.'
    else if p > 0.55
        'POST request to update stuff.'
    else if p > 0.45
        'Starting up ice-cream server.'
    else if p > 0.35
        "I've run out of funny."
    else if p > 0.25
        'Potential issue with null form.'
    else if p > 0.20
        'Too many cats on the keyboard.'
    else if p > 0.15
        'Node moved behind the router.'
    else if p > 0.10
        'The sheep is too warm.'
    else if p > 0.05
        'Instance hacking going on.'
    else
        'Core dump breached.'

