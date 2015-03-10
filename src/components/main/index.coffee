template = require('./template')
  .locals
    ApplicationContainer: require '../concerns/applicationContainer'
    CommentBox: require './commentBox'

module.exports = React.createClass
  mixins: [Arda.mixin, require('./actions')]
  render: ->
    template @
