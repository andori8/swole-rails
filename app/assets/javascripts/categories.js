$(() => {
  categoriesIndex()
})

function compare(a, b) {
  const first = a.name.toUpperCase();
  const second = b.name.toUpperCase();

  if (first < second) {
    return -1;
  }
  if (first > second) {
    return 1;
  }
  return 0;
}

const reverse = () => {
  $(".reverse").on("click", function(e) {
    e.preventDefault()
    history.pushState(null, null, "reversed")
    fetch(this.attributes.href.value)
    .then(res => res.json())
    .then(json => {
      let reversed = json.sort(compare).reverse()
      $('#app').html("<h1>Categories</h1>")
      reversed.forEach(category => {
        let reversedCategory = new Category(category)
        let reversedHtml = reversedCategory.formatIndex()
        $("#app").append(reversedHtml)
      })
      $('#app').append(`<button class="alphabetize" href="/categories.json">Alphabetize</button>`)
      alphabetize()
    })
  })
}

const alphabetize = () => {
  $(".alphabetize").on("click", function(e) {
    e.preventDefault()
    history.pushState(null, null, "alphabetized")
    fetch(this.attributes.href.value)
    .then(res => res.json())
    .then(json => {
      let sorted = json.sort(compare)
      $('#app').html("<h1>Categories</h1>")
      sorted.forEach(category => {
        let sortedCategory = new Category(category)
        let sortedHtml = sortedCategory.formatIndex()
        $("#app").append(sortedHtml)
      })
      $("#app").append(`<button class="reverse" href="/categories.json">Reverse</button>`)
      reverse()
    })
  })
}

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
      $('#app').append(`<button class="alphabetize" href="/categories.json">Alphabetize</button>`)
      alphabetize()
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
