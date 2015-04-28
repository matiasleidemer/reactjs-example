$ ->

  OneTimeClickLink = React.createClass
    getInitialState: ->
      {clicked: false}
    linkClicked: (event) ->
      @setState(clicked: true)
    child: ->
      {
        false: React.DOM.a({href: 'javascript:void(0)', onClick: @linkClicked}, 'Click Me'),
        true: React.DOM.span({}, 'You clicked the link')
      }[@state.clicked]
    render: ->
      React.DOM.div({id: 'one-time-click-link'}, @child())

  React.render(
    React.createElement(OneTimeClickLink)
    document.body
  )

  # --
  # virtualDomAfterClick = React.DOM.div(
  #   {id: 'render-me-react-please'},
  #   React.DOM.span({}, 'You clicked the link')
  # )
  #
  # linkClicked = (event) ->
  #   React.render(
  #     virtualDomAfterClick,
  #     document.body
  #   )
  #
  # virtualDomBeforeClick = React.DOM.div(
  #   {id: 'render-me-react-please'},
  #   React.DOM.a(
  #     {href: 'javascript:void(0)', onClick: linkClicked},
  #     'Click me'
  #   )
  # )
  #
  # React.render(
  #   virtualDomBeforeClick,
  #   document.body
  # )

  # --
  # React.render(
  #   React.DOM.div({id: 'render-me-react-please'}, 'Hello World'),
  #   document.body
  # )

  # linkClicked = (event) ->
  #   console.log(event)
  #   console.log(event.target)
  #   alert('you clicked me')
  #
  # virtualDom = React.DOM.div(
  #   {id: 'render-2-tags'},
  #   React.DOM.a(
  #     {href:'javascript:void(0)', onClick: linkClicked},
  #     'Click me'
  #   )
  # )
  #

  # --
  # React.render(
  #   virtualDom,
  #   document.body
  # )
