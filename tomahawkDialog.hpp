
#define true  1
#define false 0

class TomahawkDialog {
	idd = -1;					
	movingEnable = true;			
	enableSimulation = false;		
	controlsBackground[] = { TomahawkDialogBackground, TomahawkDialogTitle };	
	objects[] = { };			
	controls[] = { TomahawkDialogLaunchButton, TomahawkDialogCancelButton, TomahawkDialogGridText, TomahawkDialogHeightText };

	class TomahawkDialogBackground: IGUIBack
	{
		idc = 2200;
		x = 12 * GUI_GRID_W + GUI_GRID_X;
		y = 8 * GUI_GRID_H + GUI_GRID_Y;
		w = 14 * GUI_GRID_W;
		h = 10 * GUI_GRID_H;
	};
	class TomahawkDialogLaunchButton: RscButtonMenuOK
	{
		text = "Launch"; //--- ToDo: Localize;
		x = 13 * GUI_GRID_W + GUI_GRID_X;
		y = 16 * GUI_GRID_H + GUI_GRID_Y;
		w = 5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		colorBackground[] = {0,0,255,255};
		sizeEx = 2 * GUI_GRID_H;
	};
	class TomahawkDialogCancelButton: RscButtonMenuCancel
	{
		x = 21 * GUI_GRID_W + GUI_GRID_X;
		y = 16 * GUI_GRID_H + GUI_GRID_Y;
		w = 4 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		colorBackground[] = {255,0,0,1};
		action = "closeDialog 0";
	};
	class TomahawkDialogGridText: RscEdit
	{
		idc = 1400;
		text = "Grid"; //--- ToDo: Localize;
		x = 13 * GUI_GRID_W + GUI_GRID_X;
		y = 10 * GUI_GRID_H + GUI_GRID_Y;
		w = 12 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		tooltip = "Grid"; //--- ToDo: Localize;
	};
	class TomahawkDialogHeightText: RscEdit
	{
		idc = 1401;
		text = "Height"; //--- ToDo: Localize;
		x = 13 * GUI_GRID_W + GUI_GRID_X;
		y = 13 * GUI_GRID_H + GUI_GRID_Y;
		w = 12 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		tooltip = "Height"; //--- ToDo: Localize;
	};
	class TomahawkDialogTitle: RscText
	{
		idc = 1000;
		text = "Launch Tomahawk"; //--- ToDo: Localize;
		x = 12 * GUI_GRID_W + GUI_GRID_X;
		y = 8 * GUI_GRID_H + GUI_GRID_Y;
		w = 14 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		colorText[] = {255,255,255,1};
		colorBackground[] = {0,20,0,1};
	};
};

