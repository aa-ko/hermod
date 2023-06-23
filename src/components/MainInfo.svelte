<script>
    import Versions from "./Versions.svelte";
    
    export let data;

    function parseVersion(v) {
        return v
            .split(",")
            .map((kvp) => {
                var k = kvp.split("=").map((x) => x.replace('"', "").replace('"', ""));
                if (k.length == 2) {
                    return {
                        name: k[0],
                        value: k[1]
                    }
                } else {
                    return undefined;
                }
            })
            .filter((x) => x != undefined);
    }
</script>

<div class="maininfo">
    {#if data.online}
        <h1 class="title">{data.name}</h1>
        <Versions versionData={parseVersion(data.version)} />
        <div class="infoitems">
            <div class="players">
                <p>Players online:</p>
                <p class="content">{data.players} / {data.max_players}</p>
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

    .version {
        padding-bottom: 80px;
    }

    .content {
        font-weight: bold;
    }
</style>
