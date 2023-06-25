<script lang="ts">
    import Versions from "./Versions.svelte";
    import type { StatusData } from "./StatusData";

    export let statusData: StatusData;
</script>

<div class="maininfo">
    {#if statusData.online}
        <h1 class="title">{statusData.name}</h1>
        <Versions versionString={statusData.version} />
        <div class="infoitems">
            <div class="players">
                <p>Players online:</p>
                <p class="content">{statusData.players} / {statusData.max_players}</p>
            </div>
        </div>
    {:else}
        <div class="serveroffline">
            <!-- <img src="../../public/assets/warning_720.png" alt="Server is down :("/> -->
            Server is offline :(
        </div>
    {/if}
</div>

<style>
    /* hr {
        align-self: center;
        width: 70%;
        margin-top: 40px;
        margin-bottom: 40px;
    } */

    .version {
        font-size: larger;
        padding-bottom: 80px;
    }

    .maininfo {
        margin: auto;
        margin-bottom: 25px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .infoitems {
        width: 40%;
        align-self: center;
        font-size: larger;
    }

    .players {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .serveroffline {
        font-size: x-large;
        color: white;
        background-color: red;
        width: fit-content;
        padding: 10px;
        align-self: center;
    }

    .content {
        font-weight: bold;
    }
</style>
