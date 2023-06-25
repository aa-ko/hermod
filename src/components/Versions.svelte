<script lang="ts">
    type VersionTuple = {
        name: String;
        value: String;
    };

    export let versionString: String;

    function parseVersionString(v: String): Array<VersionTuple> {
        var result = new Array<VersionTuple>();
        v.split(",").map((kvp) => {
            var k = kvp
                .split("=")
                .map((x) => x.replace('"', "").replace('"', ""));
            if (k.length == 2) {
                result.push({
                    name: k[0],
                    value: k[1],
                });
            }
        });
        return result;
    }

    let parsedVersions = parseVersionString(versionString);
</script>

<div class="versions">
    {#each parsedVersions as version}
        <p class="version">{version.name} : {version.value}</p>
    {/each}
</div>

<style>
    .versions {
        padding-bottom: 20px;
    }

    .version {
        font-size: larger;
    }
</style>
