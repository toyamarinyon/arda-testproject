template = require('./template').locals
  CommentList: require './components/CommentList'
  CommentForm: require './components/CommentForm'

module.exports = React.createClass
  mixins: [Arda.mixin]
  render: ->
    @data = [
      author: "Toyama Satoshi"
      comment: "Year!"
     ,
      author: "Tamurine"
      comment: "Ops!"
    ]

    template @
