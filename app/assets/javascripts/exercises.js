$(() => {
	bindClick()
})

const bindClick = () => {
	$('.all_exercises').on('click', (e) => {
		e.preventDefault()
		console.log("Hello")
	})
}