#ui-modal
A very simple full screen modal that can hold any content.


    Polymer 'ui-modal',

##Events
###shown
###hidden

##Attributes and Change Handlers

##Methods
###show

      show: ->
        @removeAttribute 'offscreen'
        @removeAttribute 'hide'
        @showing = true

###hide

      hide: (evt) ->
        @$.display.setAttribute 'hide', ''
        @hiding = true
        evt?.stopPropagation()


##Event Handlers
The animation is two parts, background and content. The order of transition
animation is different whether you show or hide.

      displayAnimation: (evt) ->
        if @showing
          @$.display.removeAttribute 'hide'
          @showing = false
          @fire 'shown'
        if @hiding and not @hasAttribute('hide')
          @setAttribute 'hide', ''
          setTimeout =>
            @setAttribute 'offscreen', ''
          , 400
          @hiding = false
          @fire 'hidden'

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->

      domReady: ->

      detached: ->
