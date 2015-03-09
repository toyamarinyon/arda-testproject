template = require('./template').locals
  Comment: require '../Comment'

module.exports = React.createClass
  mixins: [Arda.mixin]
  render: ->
    @comments = @props.data
    template @

