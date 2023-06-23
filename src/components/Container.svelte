<script>
    import { onMount } from "svelte";

    import MainInfo from "./MainInfo.svelte";
    import JobCard from "./JobCard.svelte";

    const statusUri = "/api/status";
    //const statusUri = "http://localhost:8081/api/status";

    let data = {};
    $: jobs = data.jobs ? data.jobs : [];

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
            data = await response.json();
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
    <title>Hermod - {data.name}</title>
</svelte:head>

<div id="box">
    <MainInfo {data} />
    <div id="jobs">
        {#each jobs as job}
            <JobCard jobProps={job} />
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
