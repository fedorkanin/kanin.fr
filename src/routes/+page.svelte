<script lang="ts">
	import HorizontalGallery from '$components/HorizontalGallery.svelte';

	const portfolio_images_glob: any = import.meta.glob('$assets/images/portfolio/webp/*.webp', {
		eager: true
	});
	let image_paths_array: string[] = [];
	for (const path in portfolio_images_glob) {
		image_paths_array.push(portfolio_images_glob[path].default);
	}
</script>

<HorizontalGallery {image_paths_array} />

<style>
</style>
