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
        anim = @$.display.animate [
          {transform: 'translateY(2000em) rotateX(90deg)', offset: 0}
          {transform: 'translateY(500%) rotateX(90deg)', offset: 0.01}
          {transform: 'translateY(200%) rotateX(90deg)', offset: 0.1}
          {transform: 'translateY(-8%) rotateX(0deg)', offset: 0.5}
          {transform: 'translateY(1%) rotateX(0deg)', offset: 0.65}
          {transform: 'translateY(-1%) rotateX(0deg)', offset: 0.8}
          {transform: 'translateY(1%) rotateX(0deg)', offset: 0.95}
          {transform: 'translateY(0%) rotateX(0deg)', offset: 1}
        ], duration: 1000
        anim.onfinish = =>
          console.log 'done'
          @fire 'shown'

###hide

      hide: (evt) ->
        anim = @$.display.animate [
          {transform: 'translateY(0%) rotateX(0deg)', offset: 0}
          {transform: 'translateY(200%) rotateX(90deg)', offset: 0.30}
          {transform: 'translateY(500%) rotateX(90deg)', offset: 0.99}
          {transform: 'translateY(2000em) rotateX(90deg)', offset: 1}
        ], duration: 1000
        anim.onfinish = =>
          console.log 'done'
          @setAttribute 'offscreen', ''
          @fire 'hidden'
        evt?.stopPropagation()

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->

      domReady: ->

      detached: ->
