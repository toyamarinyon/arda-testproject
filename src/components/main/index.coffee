template = require('./template')
  .locals
    CommentBox: require './commentBox'

module.exports = React.createClass
  mixins: [Arda.mixin, require('./actions')]
  render: ->
    template @
