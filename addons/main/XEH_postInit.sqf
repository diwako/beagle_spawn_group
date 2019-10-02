#include "script_component.hpp"

if !(hasInterface || {isNil "zen_custom_modules_fnc_register"}) exitWith {};

["Beagle's factions", "Spawn Group", {
    params ["_pos", "_obj"];
    _pos = ASLToAGL _pos;
    [
        "Choose faction",
        [
            [
                "COMBO", "Faction",
                [
                    [
                        configfile >> "CfgGroups" >> "INDEP" >> "ALF",
                        configfile >> "CfgGroups" >> "EAST" >> "ISDF",
                        configfile >> "CfgGroups" >> "WEST" >> "UFW"
                        // configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F"
                    ],
                    [
                        "ALF",
                        "ISDF",
                        "UFW"
                        // "CTRG"
                    ],
                    0
                ]
            ], [
                "COMBO", "Side",
                [
                    [
                        blufor,
                        opfor,
                        independent,
                        civilian
                    ],
                    [
                        "Blufor",
                        "Opfor",
                        "Independent",
                        "Civilian"
                    ]
                ]
            ]
        ],
        {
            params ["_dialog", "_args"];
            _dialog params ["_factionInfo", "_side"];
            _args params ["_pos"];
            private _stuff = [_side, _factionInfo] call FUNC(getGroups);
            [{
                params ["_pos", "_stuff"];
                [
                    "Choose Group",
                    [
                        [
                            "COMBO", "Group",
                            [
                                _stuff select 0,
                                _stuff select 1,
                                0
                            ]
                        ]
                    ],
                    {
                        params ["_dialog", "_args"];
                        _dialog params ["_factionInfo"];
                        _args params ["_pos"];
                        [_pos, _factionInfo select 0, _factionInfo select 1] call FUNC(spawnGroup);
                    }, {}, [_pos] 
                ] call zen_dialog_fnc_create;
            }, [_pos, _stuff]] call CBA_fnc_execNextFrame;
        }, {}, [_pos]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;
