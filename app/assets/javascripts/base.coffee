
window.App ||= {}
class App.Base

  constructor: ->
    App.transitions = new Element.Transitions
    return this


window.Element ||= {}
class Element.Transitions

  constructor: ->

        # Turbolinks < 5
    $(document).one 'page:fetch.transition', @out
    $(document).one 'page:change.transition', @in
    $(document).one 'page:before-unload.transition', @remove
    $(document).one 'page:restore.transition', @remove
    
    # Turbolinks < 5
    $(document).one 'turbolinks:request-start.transition', @out
    $(document).one 'turbolinks:load.transition', @in
    $(document).one 'turbolinks:before-cache.transition', @remove

    return this


  out: =>
    $('#main-container .page-content').addClass('animated fadeOut')
    App.transitionLoader = setTimeout( ->
      $('#ajax-loader').fadeIn('fast')
    , 100
    )
    return


  in: =>
    $('#main-container .page-content').addClass('animated fadeIn')
    setTimeout( @remove, 200 )
    window.clearTimeout(App.transitionLoader) if App.transitionLoader?
    return


  remove: =>
    $('#main-container .page-content').removeClass('animated fadeOut fadeIn')
    $('#ajax-loader').hide()
    window.clearTimeout(App.transitionLoader) if App.transitionLoader?
    return
