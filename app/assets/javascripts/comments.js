$(() => {
  loadComments()
  newComment()
})

const loadComments = () => {
  $(".load_comments").on("click", function(e) {
  	$.get(this.href).success(res => {
  		$("ul.comments").html("")
      res.forEach(comment => {
        let newComment = new Comment(comment)
        let commentHtml = newComment.formatComments()
        $("ul.comments").append(commentHtml)
      })
  	})
    e.preventDefault()
  })
}

const newComment = () => {
	$("#new_comment").on("submit", function(e) {
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        $("#comment_content").val("")
        let $ul = $("ul.comments")
        $ul.append(response)
      }
    })
		e.preventDefault()
	})
}

function Comment(comment) {
  this.id = comment.id
  this.user = comment.user
  this.workout = comment.workout
  this.content = comment.content
}

Comment.prototype.formatComments = function() {
  let commentHtml = `
    <li>${this.content} - ${this.user.username}
    <a href="/workouts/${this.workout.id}/comments/${this.id}/edit">Edit</a>
    <a href="/workouts/${this.workout.id}/comments/${this.id}" data-method="delete" rel="nofollow">Delete</a>
    </li>
  `

  return commentHtml
}
