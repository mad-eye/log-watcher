LogEntries = new Meteor.Collection("logEntries")

logLevelMap =
    1: 'DEBUG'
    2: 'INFO'
    3: 'WARN'
    4: 'ERROR'
    
if Meteor.isClient
    Meteor.startup ->
                
    Template.logs.helpers
        entries: ->
            LogEntries.find(
                {
                    message: {$regex: Session.get "filterText"}
                    level: {$gte: parseInt(Session.get("filterLevel") ? 1)}
                },
                {limit:20, sort:{timestamp:-1}},
            ).fetch()
            
        logLevel: ->
            logLevelMap[Session.get('filterLevel') ? 1]
            

    Template.controls.events
        'keyup #search-filter': (event)->
            Session.set "filterText", $("#search-filter").val()
        
        'change #level-filter': (event) ->
            Session.set "filterLevel", $('#level-filter').val()
            
