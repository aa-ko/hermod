<script>
    export let versionData;
</script>

{#each versionData as version}
    <p class="version">{version.name} : {version.value}</p>
{/each}