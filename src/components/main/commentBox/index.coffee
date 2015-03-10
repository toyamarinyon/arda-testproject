template = require('./template').locals
  CommentList: require './components/CommentList'
  CommentForm: require './components/CommentForm'

module.exports = React.createClass
  mixins: [Arda.mixin]
  componentDidMount: ->
    dom = @getDOMNode()
    offsetTop = dom.getBoundingClientRect().top
    stretchHeight = window.innerHeight - offsetTop
    componentHeight = dom.clientHeight
    if componentHeight < stretchHeight
      componentHeight = stretchHeight
    @dispatch "context:set-contents-height", componentHeight
  render: ->
    @data = [
      author: "Toyama Satoshi"
      comment: "Year!"
     ,
      author: "Tamurine"
      comment: "Ops!"
    ]

    template @
