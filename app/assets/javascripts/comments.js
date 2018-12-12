$(() => {
  loadComments()
  newComment()
})

const loadComments = () => {
  $(".load_comments").on("click", function(e) {
  	$.get(this.href).success(res => {
  		$("ul.comments").html(res)
  	})
    e.preventDefault()
  })
}

const newComment = () => {
	$("#new_comment").on("submit", function(e) {
    let url = this.action
    let data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'comment': {
        'content': $("#comment_content").val()
      }
    }

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        $("#comment_content").val("")
        let $ul = $("ul.comments")
        $ul.append(response)
      }
    })
		e.preventDefault()
	})
}
