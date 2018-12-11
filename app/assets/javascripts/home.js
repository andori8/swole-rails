$(() => {
  homeIndex()
})

const homeIndex = () => {
  $(".my_workouts").on("click", (e) => {
    e.preventDefault()
    history.pushState(null, null, "home")
    $.get('/home.json').success(json => {
      $('#app').html("<h1>My Workouts</h1>")
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
    <ol>
      <a href="/workouts/${this.id}"><li>${this.title}</li></a>
    </ol>
  `
  return workoutHtml
}
