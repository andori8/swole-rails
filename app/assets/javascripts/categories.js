$(() => {
  categoriesIndex()
})

const categoriesIndex = () => {
  $(".all_categories").on("click", (e) => {
    e.preventDefault()
    history.pushState(null, null, "categories")
    $.get('/categories.json').success(json => {
      $('#app').html("<h1>Categories</h1>")
      json.forEach(category => {
        let newCategory = new Category(category)
        let categoryHtml = newCategory.formatIndex()
        $("#app").append(categoryHtml)
      })
    })
  })
}

function Category(category) {
  this.id = category.id
  this.name = category.name
}

Category.prototype.formatIndex = function() {
  let categoryHtml = `
  <a href="/categories/${this.id}">${this.name}</a><br>
  `
  return categoryHtml
}
