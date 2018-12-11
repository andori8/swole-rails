$(() => {
  workoutsIndex()
})

const workoutsIndex = () => {
  $(".all_workouts").on("click", (e) => {
    e.preventDefault()
    history.pushState(null, null, "workouts")
    $.get('/workouts.json').success(json => {
      $('#app').html("<h1>All Workouts</h1>")
      json.forEach(workout => {
        let newWorkout = new Workout(workout)
        let workoutHtml = newWorkout.formatIndex()
        $("#app").append(workoutHtml)
      })
      $("#app").append(`<a href="/workouts/new">Create a New Workout</a>`)
    })
  })
}

function Workout(workout) {
  this.id = workout.id
  this.title = workout.title
  this.time = workout.time
  this.user = workout.user
}

Workout.prototype.formatIndex = function() {
  let workoutHtml = `
    <ul>
      <a href="/workouts/${this.id}"><li>${this.title}</li></a>
    </ul>
  `
  return workoutHtml
}
