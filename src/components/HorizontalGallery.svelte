<script lang="ts">
	import { scroll, animate, ScrollOffset } from 'motion';
	import { onMount } from 'svelte';
	export let image_paths_array: string[] = [];

	let gallery: any;
	export let section: HTMLElement | null = null;

	function animateShift() {
		// animate gallery left-right shift
		const gallery_items: NodeListOf<HTMLElement> = gallery.querySelectorAll('li');
		// width including overflow
		const translate_target: number =
			gallery.scrollWidth -
			gallery.clientWidth +
			gallery_items[0].clientWidth +
			gallery_items[gallery_items.length - 1].clientWidth;

		// animate shift
		const shift_animation: any = animate(gallery, {
			transform: ['none', `translateX(-${translate_target}px)`]
		});

		scroll(shift_animation, {
			target: document.querySelector('section') as HTMLElement
		});

		// set section height
		const section_height: number = translate_target;
		if (section) section.style.height = `${section_height}px`;
	}

	onMount(() => {
		animateShift();
		// animate gallery enlarge
		// change height of gallery to 100vh
		const enlarge_animation: any = animate(gallery, {
			height: [' calc(100vh - 4rem)', '100vh'],
			top: ['4.5rem', '0']
		});
		const navbar: HTMLElement = document.querySelector('nav') as HTMLElement;
		scroll(enlarge_animation, { target: navbar, offset: ScrollOffset.Exit });
	});

	function onResize() {
		animateShift();
	}
</script>

<svelte:window on:resize={onResize} />

<section bind:this={section}>
	<ul id="gallery" bind:this={gallery}>
		{#each image_paths_array as path}
			<li>
				<img src={path} alt="portfolio" />
			</li>
		{/each}
	</ul>
</section>

<style>
	/* section height is set by js */
	:global(body) {
		overflow-x: hidden;
	}

	section {
		margin-bottom: 0;
	}

	ul,
	li {
		list-style: none;
		margin: 0;
		padding: 0;
	}
	ul {
		display: flex;
		position: sticky;
		/* 4 rem is navbar height */
		top: 4rem;
		height: calc(100vh - 4rem);
		width: fit-content;
		margin: 0 1rem;
	}
	li {
		display: flex;
		width: fit-content;
		height: 100%;
		width: auto;
		margin: 0 1rem;
		flex: 0 0 auto;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		overflow: hidden;
	}
	img {
		height: 80%;
		width: auto;
		/* aspect-ratio: 4/5; */
		/* object-fit: cover; */
	}
</style>
