$(() => {
  loadComments()
})

const loadComments = () => {
  $(".load_comments").on("click", function(e) {
  	$.get(this.href).success(res => {
  		$("ul.comments").html(res)
  	})
    e.preventDefault()
  })
}
