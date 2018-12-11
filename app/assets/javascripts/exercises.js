$(() => {
  exercisesIndex()
})

const exercisesIndex = () => {
  $(".all_exercises").on("click", (e) => {
    history.pushState(null, null, "exercises")
    e.preventDefault()
    $.get('/exercises.json').success(json => {
      $('#app').html("<h1>All Exercises</h1>")
      json.forEach(exercise => {
        let newExercise = new Exercise(exercise)
        let exerciseHtml = newExercise.formatIndex()
        $("#app").append(exerciseHtml)
      })
      $("#app").append(`<a href="/exercises/new">Create a New Exercise</a><br>
                        <a href="/exercises/ten">Exercises with ten reps or more</a>`)
    })
  })

  $(".next_exercise").on("click", function(e) {
    let id = $("#exercise_id").text()
    $.get(`/exercises/${id}/next`).success(exercise => {
      $(".exercise_show").empty()
      let nextExercise = new Exercise(exercise)
      let exerciseHtml = nextExercise.formatShow()
      $(".exercise_show").append(exerciseHtml)
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
      <li><a href="/exercises/${this.id}" data-id="${this.id}">${this.name}</a> - ${this.user.username}</li>
    </ul>
  `
  return exerciseHtml
}

Exercise.prototype.formatShow = function() {
  let exerciseHtml = `
    <h1>${this.name}</h1>
    <h3>Sets: ${this.sets}</h3><br>
    <h3>Reps: ${this.reps}</h3><br><br>
    <h3>Description:</h3><br>
    <p>${this.description}</p><br>
    <p id="exercise_id">${this.id}</p>
  `
  return exerciseHtml
}
