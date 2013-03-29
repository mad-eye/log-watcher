LogEntries = new Meteor.Collection("logEntries")

if Meteor.isClient
                
    Template.logs.helpers
        entries: ->
            LogEntries.find(
                {
                    message: {$regex: Session.get "filterText"}
                },
                {limit:20, sort:{timestamp:-1}},
            ).fetch()
            

    Template.controls.events
        'keyup #search-filter': (event)->
            Session.set "filterText", $("#search-filter").val()
