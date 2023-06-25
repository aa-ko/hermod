// TODO: Add type of mods array.
//       I have no mods installed, so I don't know what this is supposed to be.
export type StatusData = {
    name: string,
    version: string,
    players: number,
    max_players: number,
    map: string,
    online: boolean,
    bepinex: {
        enabled: boolean,
        mods: Array<any>
    },
    jobs: Array<JobData>
};

export type JobData = {
    name: string,
    enabled: boolean,
    schedule: string
};
