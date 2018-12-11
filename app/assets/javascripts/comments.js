$(() => {
  loadComments()
})

const loadComments = () => {
  $(".load_comments").on("click", (e) => {
    e.preventDefault()
    console.log(this)
  })
}
