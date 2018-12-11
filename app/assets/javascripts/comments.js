$(() => {
  loadComments()
})

const loadComments = () => {
  $(".load_comments").on("click", (e) => {
    e.preventDefault()
    $.ajax({
      method: "GET",
      url: this.href
    }).success(data => {
      console.log(data)
    })
  })
}
