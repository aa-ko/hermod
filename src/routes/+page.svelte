<script lang="ts">
	import { onMount } from "svelte";

	import Container from "../components/Container.svelte";

	let imagePath: String;

	onMount(async () => {
		await setBackgroundImage();
	});

	async function setBackgroundImage() {
		var num = new Date().getDay();
		imagePath = `/images/${num.toString()}.png`;
		console.log(imagePath);
		var bg_image = document.getElementById("bg-image");
		if (!bg_image) {
			console.log("Unable to set background image!");
		} else {
			bg_image.style["backgroundImage"] = `url(${imagePath})`;
		}
	}
</script>

<div id="bg-border">
	<div id="bg-image" />
	<main>
		<Container />
	</main>
</div>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;

		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		z-index: 2;
		width: 90%;
		padding: 20px;
		text-align: center;
	}

	@media (min-width: 640px) {
		main {
			max-width: 1700px;
		}
	}

	* {
		box-sizing: border-box;
	}

	#bg-border {
		height: 100%;
	}

	#bg-image {
		/* Background image is set dynamically via inline style. */

		filter: blur(1px);
		-webkit-filter: blur(1px);

		height: 100%;
		width: 100%;
		top: 0;
		left: 0;

		background-position: center;
		background-repeat: no-repeat;
		background-size: 100% 100%;
		background-color: darkgrey;

		filter: brightness(90%);

		z-index: -1;
		position: fixed;
	}
</style>
