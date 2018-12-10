$(() => {
  exercisesIndex()
})

const exercisesIndex = () => {
  $(".all_exercises").on("click", (e) => {
    e.preventDefault()
    history.pushState(null, null, "exercises")
    $.get('/exercises.json').success(json => {
      $('#app').html("<h1>All Exercises</h1>")
      json.forEach(exercise => {
        let newExercise = new Exercise(exercise)
        let exerciseHtml = newExercise.formatIndex()
        $("#app").append(exerciseHtml)
      })
      $("#app").append(`<a href="/exercises/new">Create a New Exercise</a>`)
    })
  })
}

function Exercise(exercise) {
  this.id = exercise.id
  this.name = exercise.name
  this.sets = exercise.sets
  this.reps = exercise.reps
  this.description = exercise.description
  this.category_id = exercise.category_id
  this.user = exercise.user
}

Exercise.prototype.formatIndex = function() {
  let exerciseHtml = `
    <ul>
      <li><a href="/exercises/${this.id}">${this.name}</a> - ${this.user.username}</li>
    </ul>
  `
  return exerciseHtml
}
