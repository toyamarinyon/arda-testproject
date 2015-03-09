module.exports =
  hundleCommentSubmit: (comment) ->
    comments = @state.data
    newComments = comments.concat [comment]
    @setState
      data: newComments

