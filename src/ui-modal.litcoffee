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
        anim = @animate [
          {opacity: 0, offset: 0}
          {opacity: 1, offset: 1}
        ], duration: 100
        anim.onfinish = =>
          @$.display.removeAttribute 'offscreen'
          anim = @$.display.animate [
            {transform: 'translateY(1000em) rotateX(90deg)', offset: 0}
            {transform: 'translateY(500%) rotateX(90deg)', offset: 0.01}
            {transform: 'translateY(100%) rotateX(90deg)', offset: 0.1}
            {transform: 'translateY(-8%) rotateX(0deg)', offset: 0.5}
            {transform: 'translateY(1%)', offset: 0.65}
            {transform: 'translateY(-1%)', offset: 0.8}
            {transform: 'translateY(1%)', offset: 0.95}
            {transform: 'translateY(0%)', offset: 1}
          ], duration: 800
          anim.onfinish = =>
            @fire 'shown'

###hide

      hide: (evt) ->
        anim = @$.display.animate [
          {transform: 'translateY(0%) rotateX(0deg)', offset: 0}
          {transform: 'translateY(100%) rotateX(90deg)', offset: 0.50}
          {transform: 'translateY(1000em) rotateX(90deg)', offset: 1}
        ], duration: 400
        anim.onfinish = =>
          @$.display.setAttribute 'offscreen', ''
          anim = @animate [
            {opacity: 1, offset: 0}
            {opacity: 0, offset: 1}
          ], duration: 100
          anim.onfinish = =>
            @setAttribute 'offscreen', ''
        evt.stopPropagation()

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
