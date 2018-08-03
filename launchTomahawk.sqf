////////////////////////////////////////////////////////////////////////////////
// Tomahawk Script [LAUNCH]
// Created by Atunero
// Version 1.0
////////////////////////////////////////////////////////////////////////////////

//Initialization
_player = _this select 0;

if(!isNull _player) then {
	_requested = _player getVariable ["tomahawk_requested"];
	if(!isNull _requested) then{
		if(!_requested) then {
			_amount = _player getVariable ["tomahawk_amount"];
			if(!isNull _amount) then {
				if(_amount > 0) then {
					_launchPos = _player getVariable ["tomahawk_launchPos"];
					if(!isNull _launchPos) then {
						_tomahawkClassname = _player getVariable ["tomahawk_classname"];
						if(!isNull _tomahawkClassname) then {
							_requiredDeviceClassname = _player getVariable ["tomahawk_device"];
							if(!isNull _requiredDeviceClassname) then {
								if(_requiredDeviceClassname in (items _player + assignedItems _player)) then {
									_tomahawkHeight = 5.0;
									_target = laserTarget _player;
									if(!isNull _target) then {
										_tomahawkTick = 100;
										_tomahawkSpeed = 300;

										_startPos = [_launchPos select 0, _launchPos select 1, _tomahawkHeight];

										_tomahawk = _tomahawkClassname createVehicle _startPos;

										while {alive _tomahawk} do {
											if (_tomahawk distance _target > (_tomahawkSpeed / 10)) then {
												_horizontalVector = [_tomahawk, _target] call BIS_fnc_DirTo;
												_tomahawk setDir _horizontalVector;

												_verticalVector = asin ((((getPosASL _tomahawk) select 2) - ((getPosASL _target) select 2)) / (_target distance _tomahawk));
												_verticalVector = (_verticalVector * -1);
												[_tomahawk, _verticalVector, 0] call BIS_fnc_setPitchBank;

												_cruiseTime = (_target distance _tomahawk) / _tomahawkSpeed;
												_vX = (((getPosASL _target) select 0) - ((getPosASL _tomahawk) select 0)) / _cruiseTime;
												_vY = (((getPosASL _target) select 1) - ((getPosASL _tomahawk) select 1)) / _cruiseTime;
												_vZ = (((getPosASL _target) select 2) - ((getPosASL _tomahawk) select 2)) / _cruiseTime;
												_tomahawk setVelocity [_vX, _vY, _vZ];

												sleep(1 / _tomahawkTick);
											};
										};
									}else{
										hintSilent "Invalid target";
									};
								}else{
									hintSilent format["You need to carry a %1 in order to call for Tomahawks", _requiredDeviceClassname];
								};
							};
						};
					};
				}else{
					hintSilent "No more Tomahawks.";
				};
			};
		}else{
			hintSilent "Tomahawk already requested, please wait.";
		};
	};
};
