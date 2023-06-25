<script lang="ts">
    import { onMount } from "svelte";

    import MainInfo from "./MainInfo.svelte";
    import JobCard from "./JobCard.svelte";

    import type { StatusData } from "./StatusData";

    import { dev } from "$app/environment";

    const statusUri = "/api/status";

    let statusData: StatusData;

    onMount(async () => {
        await refreshData();
        setInterval(async () => {
            await refreshData();
        }, 5000);
    });

    async function refreshData() {
        var response = await fetch(statusUri, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
            cache: "no-cache",
        });
        if (response.ok) {
            statusData = await response.json();
            if (!statusData.jobs) {
                statusData.jobs = [];
            }
            // This was useful for testing.
            // var now = new Date();
            // statusData.players = now.getSeconds();
        } else {
            console.error("Request failed.");
            console.error(await response.blob());
        }
    }

    // TODO: Add mod list display.
</script>

<svelte:head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link
        rel="preconnect"
        href="https://fonts.gstatic.com"
        crossorigin="anonymous"
    />
    <link
        href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet"
    />
    {#if statusData}
        <title>Hermod - {statusData.name}</title>
    {:else}
        <title>Hermod</title>
    {/if}
</svelte:head>

<div id="box">
    {#if statusData}
        <MainInfo {statusData} />
        <div id="jobs">
            {#each statusData.jobs as job}
                <JobCard jobData={job} />
            {/each}
        </div>
    {:else}
        <p>No status data.</p>
    {/if}
</div>

<style>
    * {
        font-family: Cinzel, serif;
    }

    #box {
        border-radius: 45px;
        border-style: solid;
        border-color: rgba(240, 248, 255, 0.6);
        background-color: rgba(240, 248, 255, 0.6);
        padding: 24px;
    }

    #jobs {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-between;
    }
</style>
