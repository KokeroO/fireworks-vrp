local cfg = {}

cfg.permissions = {
	'manager.permissao',
	'admin.god'
}

cfg.locs = {
	['vinewood'] = {
		[1] = {['pedx'] = 721.15, ['pedy'] = 1171.70, ['pedz'] = 313.24, ['pedh'] = 288.24, ['shotx'] = 766.00, ['shoty'] = 1184.00, ['shotz'] = 357.00},
		[2] = {['pedx'] = 637.25, ['pedy'] = 1200.76, ['pedz'] = 316.15, ['pedh'] = 263.81, ['shotx'] = 793.00, ['shoty'] = 1167.00, ['shotz'] = 372.00},
		[3] = {['pedx'] = 762.47, ['pedy'] = 1157.24, ['pedz'] = 312.58, ['pedh'] = 57.71, ['shotx'] = 656.00, ['shoty'] = 1215.00, ['shotz'] = 378.00},
		[4] = {['pedx'] = 745.35, ['pedy'] = 1161.87, ['pedz'] = 314.12, ['pedh'] = 49.60, ['shotx'] = 708.00, ['shoty'] = 1203.00, ['shotz'] = 370.00},
		[5] = {['pedx'] = 709.19, ['pedy'] = 1178.76, ['pedz'] = 314.21, ['pedh'] = 313.51, ['shotx'] = 728.00, ['shoty'] = 1193.00, ['shotz'] = 365.00},
		[6] = {['pedx'] = 796.28, ['pedy'] = 1189.06, ['pedz'] = 325.57, ['pedh'] = 94.15, ['shotx'] = 707.00, ['shoty'] = 1114.00, ['shotz'] = 443.00},
		[7] = {['pedx'] = 737.04, ['pedy'] = 1207.71, ['pedz'] = 326.94, ['pedh'] = 179.88, ['shotx'] = 772.00, ['shoty'] = 1126.00, ['shotz'] = 384.67},
		[8] = {['pedx'] = 690.49, ['pedy'] = 1118.38, ['pedz'] = 293.34, ['pedh'] = 326.88, ['shotx'] = 720.00, ['shoty'] = 1183.00, ['shotz'] = 361.67}
	},
	['observatory'] = {
		[1] = {['pedx'] = -521.51, ['pedy'] = 1169.52, ['pedz'] = 320.279, ['pedh'] = 216.24, ['shotx'] = -443.00, ['shoty'] = 1030.00, ['shotz'] = 354.00},
		[2] = {['pedx'] = -513.75, ['pedy'] = 1170.72, ['pedz'] = 323.11, ['pedh'] = 205.83, ['shotx'] = -447.00, ['shoty'] = 1096.00, ['shotz'] = 358.00},
		[3] = {['pedx'] = -532.77, ['pedy'] = 1099.74, ['pedz'] = 259.58, ['pedh'] = 57.71, ['shotx'] = -409.00, ['shoty'] = 1093.00, ['shotz'] = 371.00},
		[4] = {['pedx'] = -395.52, ['pedy'] = 1050.20, ['pedz'] = 319.07, ['pedh'] = 102.60, ['shotx'] = -421.00, ['shoty'] = 1003.00, ['shotz'] = 335.00}
	}
}

cfg.particles = {
	['case'] = "scr_indep_fireworks",
	['caseExtra'] = "proj_indep_firework",
	['battery'] = "scr_indep_fireworks",
	['cone'] = "scr_indep_fireworks"
}

cfg.objects = {
	['case'] = "ind_prop_firework_03",
	['battery'] = "ind_prop_firework_03",
	['cone'] = "ind_prop_firework_04",
	['rocket'] = "ind_prop_firework_01"
}

return cfg