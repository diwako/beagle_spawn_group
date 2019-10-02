#include "script_component.hpp"

if !([QGVAR(spawnGroup), _this] call FUNC(isSpawner)) exitWith {};
params ["_pos", "_side", "_config"];
[_pos, _side, _config] call BIS_fnc_spawnGroup;
