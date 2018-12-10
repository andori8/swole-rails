$(() => {
  workoutsIndex()
})

const workoutsIndex = () => {
  $(".all_workouts").on("click", (e) => {
    e.preventDefault()
    history.pushState(null, null, "workouts")
    $.get('/workouts.json').success(json => {
      $('#app').html('')
      json.forEach(workout => {
        let newWorkout = new Workout(workout)
        let workoutHtml = newWorkout.formatIndex()
        $("#app").append(workoutHtml)
      })
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
    <h1>${this.title}</h1>
  `

  return workoutHtml
}
