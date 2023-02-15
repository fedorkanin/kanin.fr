<script lang="ts" context="module">
	export interface navbarItem {
		name: string;
		label: string;
		link: string;
	}
</script>

<script lang="ts">
	import { page } from '$app/stores';

	export let navbarItems: navbarItem[];
</script>

<!-- navbar with underline animation -->
<nav class="navbar">
	<h2>Fedor Kanin</h2>
	<ul class="navbar__list">
		{#each navbarItems as item}
			<li class="navbar__item">
				<a class="navbar__link" href={item.link} class:active={$page.url.pathname === item.link}>
					{item.label}
				</a>
			</li>
		{/each}
	</ul>
</nav>

<!-- navbar with underline animation -->
<style>
	.navbar {
		--navbar-height: 4.5rem;
		--navbar-underline-height: 0.2rem;
		--navbar-underline-color: var(--color-primary);
		--navbar-underline-transition: 0.3s ease-in-out;
		--navbar-font-size: 1.8rem;

		position: sticky;
		width: 100%;
		height: var(--navbar-height);
		display: flex;
		justify-content: center;
		z-index: 2;
	}

	h2 {
		position: absolute;
		left: 2rem;
		top: 50%;
		transform: translateY(-50%);
		font-weight: 200;
		font-size: var(--navbar-font-size);
	}

	.navbar__list {
		display: flex;
		align-items: center;
		height: 100%;
		gap: 2rem;
	}

	.navbar__item {
		position: relative;
		padding: 0;
	}

	.navbar__link {
		display: block;
		padding: 0;
		height: 100%;
		line-height: var(--navbar-height);
		color: var(--color-text);
		text-decoration: none;
		transition: color 0.2s ease-in-out;
		font-size: var(--navbar-font-size);
	}

	.navbar__link:hover {
		color: var(--color-primary);
	}

	.navbar__link.active {
		color: var(--color-primary);
	}

	.navbar__link::after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		height: var(--navbar-underline-height);
		background-color: var(--navbar-underline-color);
		transform: scaleX(0);
		transform-origin: left;
		transition: transform var(--navbar-underline-transition);
	}

	.navbar__link.active::after {
		transform: scaleX(1);
	}
</style>
