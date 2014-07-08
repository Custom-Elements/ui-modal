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
        @$.display.setAttribute 'offscreen', ''
        @removeAttribute 'offscreen'
        @removeAttribute 'hide'
        @showing = true

###hide

      hide: (evt) ->
        @$.display.setAttribute 'slidedown', ''
        @hiding = true
        evt?.stopPropagation()


##Event Handlers
The animation is two parts, background and content. The order of transition
animation is different whether you show or hide.

      backgroundAnimation: (evt) ->
        console.log 'transition', evt
        if @showing
          @$.display.setAttribute 'slideup', ''
        if @hiding
          @setAttribute 'offscreen', ''
          @hiding = false
          @fire 'hidden'

      displayAnimation: (evt) ->
        console.log 'animation', evt
        if @showing
          @$.display.removeAttribute 'offscreen'
          @$.display.removeAttribute 'slideup'
          @showing = false
          @fire 'shown'
        if @hiding
          @$.display.setAttribute 'offscreen', ''
          @$.display.removeAttribute 'slidedown'
          @setAttribute 'hide', ''

##Polymer Lifecycle

      created: ->

      ready: ->

Polymer doesn't understand declarative binding for animation events, so manual
binding here.

      attached: ->
        @addEventListener 'webkitAnimationEnd', (evt) => @displayAnimation evt

      domReady: ->

      detached: ->
