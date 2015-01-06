#ui-modal
A very simple full screen modal that can hold any content.


    require '../node_modules/ui-styles/animations.js'

    Polymer 'ui-modal',

##Events
###shown
###hidden

##Attributes and Change Handlers

##Methods
###show

      show: ->
        @removeAttribute 'offscreen'
        @fadeIn =>
          @$.display.removeAttribute 'offscreen'
          @$.display.fadeIn =>
            @fire 'shown'

###hide

      hide: (evt) ->
        @$.display.fadeOut =>
          @$.display.setAttribute 'offscreen', ''
          @fadeOut =>
            @setAttribute 'offscreen', ''
        evt?.stopPropagation()

      backgroundClick: (evt) ->
        return if @['ignore-background-click']?
        @hide(evt)

##Polymer Lifecycle

      created: ->

###ready
Look for any element with hide-modal, and hook up a click handler to hide. Boom!
Declarative hide support.

      ready: ->
        hides = @querySelectorAll('[hide-modal]')
        i=0
        while i<hides.length
          hides[i].addEventListener 'click', (evt) =>
            @hide(evt)
          i++

      attached: ->

      domReady: ->

      detached: ->
