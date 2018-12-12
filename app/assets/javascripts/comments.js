$(() => {
  loadComments()
})

const loadComments = () => {
  $(".load_comments").on("click", function(e) {
  	$.ajax({
  		method: "GET",
  		url: this.href
  	}).success(data => {
  		$("ul.comments").html(data)
  	})
    e.preventDefault()
  })
}
