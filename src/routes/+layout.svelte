<!-- layout component with navbar and main content -->
<script lang="ts">
	import '@picocss/pico/css/pico.min.css';
	import Navbar from '$components/Navbar.svelte';
	import type { navbarItem } from '$components/Navbar.svelte';

	const navbarItems: navbarItem[] = [
		// {
		// 	name: 'home',
		// 	label: 'Home',
		// 	link: '/'
		// },
		{
			name: 'portfolio',
			label: 'Portfolio',
			link: '/'
		}
	];
</script>

<Navbar {navbarItems} />
<slot />

<style>
</style>
