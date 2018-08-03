////////////////////////////////////////////////////////////////////////////////
// Tomahawk Script [INIT]													  
// Created by Atunero													 	  
// Version 1.0																  
////////////////////////////////////////////////////////////////////////////////
//																			  
// Usage:																	
// null = [this, position frigate, 4, "RHS_ammo_BGM109", "ANPRC_117F"] execVM "scripts\tomahawk\initTomahawk.sqf";
//
// parameter1 -> player															  
// parameter2 -> launch position (try to avoid collisions)
// parameter3 -> amount of available tomahawk cruise missiles (optional, default 1)
// parameter4 -> missile classname (optional)	
// parameter5 -> required device to launch tomahawks (optional) 	
//
// You also need a laser designator
//															  

_player = _this select 0;
_launchPos = _this select 1;
_tomahawkAmount = _this select 2;
_tomahawkClassname = _this select 3;
_requiredDeviceClassname = _this select 4;

if(!isNull _player) then {
	if(!isNull _launchPos) then  {
		if(isNull _tomahawkAmount or _tomahawkAmount < 0) then {
			_tomahawkAmount = 1;
		};

		if(isNull _tomahawkClassname) then {
			_tomahawkClassname = "RHS_ammo_BGM109";
		};

		if(isNull _requiredDeviceClassname) then {
			_requiredDeviceClassname = "none";
		};

		_player setVariable ["tomahawk_launchPos", _launchPos];
		_player setVariable ["tomahawk_amount", _tomahawkAmount];
		_player setVariable ["tomahawk_classname", _tomahawkClassname];
		_player setVariable ["tomahawk_device", _requiredDeviceClassname];

		_player setVariable ["tomahawk_requested", false];

		null = _player addAction ["<t color='#00FF00'>Request BGM-109 Tomahawk strike</t>", "scripts\tomahawk\requestTomahawk.sqf", nil, 1.5, false, false, "", {(_this == _target) and (_target getVariable ["tomahawk_requested"] == false)}];
	};
};