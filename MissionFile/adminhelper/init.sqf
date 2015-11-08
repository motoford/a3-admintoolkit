/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
// make functions available
missionNamespace setVariable ['adminhelper_fetchPlayers', compileFinal preprocessFileLineNumbers "adminhelper\adminhelper_fetchPlayers.sqf"];
missionNamespace setVariable ['adminhelper_fetchVehicles', compileFinal preprocessFileLineNumbers "adminhelper\adminhelper_fetchVehicles.sqf"];
missionNamespace setVariable ['adminhelper_fetchWeapons', compileFinal preprocessFileLineNumbers "adminhelper\adminhelper_fetchWeapons.sqf"];
missionNamespace setVariable ['adminhelper_weaponMagazine', compileFinal preprocessFileLineNumbers "adminhelper\adminhelper_weaponMagazine.sqf"];

missionNamespace setVariable ['adminhelper_buttonEvents', compileFinal preprocessFileLineNumbers "adminhelper\adminhelper_buttonEvents.sqf"];
missionNamespace setVariable ['adminhelper_buttonAction', compileFinal preprocessFileLineNumbers "adminhelper\adminhelper_buttonAction.sqf"];
missionNamespace setVariable ['adminhelper_bindEvents', compileFinal preprocessFileLineNumbers "adminhelper\adminhelper_bindEvents.sqf"];

missionNamespace setVariable ['adminhelper_selectedPlayer', ''];

waitUntil {!isNull (findDisplay 46)};

// event handler for map click event using Alt + click to teleport the player
//['adminhelper_mapAction', 'onMapSingleClick', {if (_alt) then { [_this, _pos] call adminhelper_buttonAction; }; true} , 'tp2pos'] call BIS_fnc_addStackedEventHandler;
player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call adminhelper_buttonAction; true; } else { false; };";

// call bindEvents once mail dialog is finished,, at this time F2 key should work
(findDisplay 46) displayAddEventHandler ["KeyDown","call adminhelper_bindEvents;"];