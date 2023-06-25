<script lang="ts">
    import { onMount } from "svelte";

    import MainInfo from "./MainInfo.svelte";
    import JobCard from "./JobCard.svelte";

    import type { StatusData } from "./StatusData";

    const statusUri = "/api/status";

    let statusData: StatusData;
    $: jobs = statusData.jobs;

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
        } else {
            console.error("Request failed.");
            console.error(await response.blob());
        }
    }

    // TODO: Add mod list display.
</script>

<svelte:head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet"
    />
    <title>Hermod - {statusData.name}</title>
</svelte:head>

<div id="box">
    <MainInfo statusData={statusData} />
    <div id="jobs">
        {#each jobs as job}
            <JobCard jobData={job} />
        {/each}
    </div>
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
