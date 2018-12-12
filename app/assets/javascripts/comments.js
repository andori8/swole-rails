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
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
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