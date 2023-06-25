<script lang="ts">
    import cronstrue from "cronstrue";
    import type { JobData } from "./StatusData";

    export let jobData: JobData;

    let prettyName = (() => {
        switch (jobData.name) {
            case "AUTO_UPDATE":
                return "Auto Update";
            case "AUTO_BACKUP":
                return "Auto Backup";
            default:
                return "-";
        }
    })();

    let prettyEnabled = (() => {
        switch (jobData.enabled) {
            case true:
                return "Yes";
            case false:
                return "No";
            default:
                return "-";
        }
    })();
</script>

<div id="container">
    <div class="header">
        <div class="name infoValue">{prettyName}</div>
    </div>

    <div class="header">
        <div class="enabled infoKey">Active:</div>
        <div class="enabled infoValue">{prettyEnabled}</div>
    </div>

    <div class="header">
        <div class="schedule infoKey">Schedule:</div>
        <div class="schedule infoValue" title={jobData.schedule}>
            {cronstrue.toString(jobData.schedule)}
        </div>
    </div>
</div>

<style>
    .name {
        font-size: larger;
        font-weight: bold;
    }

    .infoValue {
        font-weight: bold;
    }

    #container {
        width: 45%;
        height: 105px;
        margin: 10px 20px 10px 20px;
        padding: 14px;
        border: 1px;
        border-style: solid;
        border-radius: 12px;
        border-color: rgba(0, 0, 0, 0.55);
    }

    .header {
        display: flex;
        justify-content: space-between;
        flex-flow: row;
        padding-bottom: 10px;
    }    
</style>
