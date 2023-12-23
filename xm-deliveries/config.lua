Config = {}

Config.ThirdEye = true              -- U wan alt selekt?
Config.Blip     = false             -- Do you want the blip on the map? Default : false

Config.Account  = "cash"           -- default: cash (bank/crypto) 

Config.Locations = {
    [1] = {                     -- Create a dropoff location [Mirror Park House]
        location    = { 980.68, -709.99, 57.65, 133.45 },   -- Waypoint Location
        zone        = { 979.31, -716.1, 58.22 },            -- Dropoff location
        payout      =   500,
    },
    [2] = {                     -- Arcade
        location    = { 722.26, -828.98, 24.61, 0.28 },
        zone        = { 726.4, -822.44, 24.85 },
        payout      =   500,
    },
    [3] = {                     -- Deep Pile Nation
        location    = { 481.64, -1517.18, 29.29, 102.44 },
        zone        = { 485.29, -1528.98, 29.3 },
        payout      =   900,
    },
    [4] = {                     -- KTown Alley
        location    = { -681.87, -888.88, 24.5, 358.58 },
        zone        = { -676.65, -885.07, 24.46 },
        payout      =   1250,
    },
    [5] = {                     -- VU Alley
        location    = { 186.06, -1262.72, 29.2, 158.68 },
        zone        = { 180.9, -1264.25, 29.2 },
        payout      =   750,
    },
    [6] = {                     -- Lester
        location    = { 215.51, -2016.92, 18.72, 40.63 },
        zone        = { 200.76, -2003.02, 18.86 },
        payout      =   1000,
    },
}