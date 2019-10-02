#include "script_component.hpp"

params ["_side", "_factionConfig"];
private _prettyNames = [];
private _values = [];
private _types = "true" configClasses (_factionConfig);
{
	private _typeName = getText (_x >> "name");
	private _groups = "true" configClasses (_x);
	{
		private _name = getText (_x >> "name");
		_prettyNames pushBack format ["%1 - %2", _typeName, _name];
		_values pushBack [_side, _x];
	} forEach _groups;
} forEach _types;

[_values, _prettyNames]
