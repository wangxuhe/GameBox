--[[
	itemId: [number] 成就ID
	itemName: [string] 描述
	tasktype: [number] 任务类型（1 等级 2 金币 3 章节 4 击杀敌人数目）
	count: 总进度
	isEmail: [bool] 是否邮箱发送
	rewardtype: [number] 奖励类型(1金币 2体力 3弹药 4钻石 5勋章)
	rewardnum: [number] 奖励数目
	iconRes: [string] 图标资源名
]]

local AchieveConfig = {
	-- 完成状态
	NO_FINISH = 1,			-- 未完成
	FINISH_GET = 2,			-- 完成未领取
	FINISHED = 3,			-- 已领取
	OUT_DATE = 4,			-- 已过期
}

-- 任务类型
local _TASKTYPE = {
	NONE = 0,
	LEVEL = 1,				-- 等级
	MONEY = 2,				-- 金币
	CHAPTER = 3,			-- 章
	KILL_ALL = 4,			-- 击杀敌人数目
	KILL_GUN = 5,			-- 枪械击杀敌人数目
	KILL_KNIFE = 6,			-- 刀具击杀敌人数目

	COUNT = 7,
}
AchieveConfig.TASKTYPE = _TASKTYPE

-- 奖励类型

local _REWARD = {
	NONE = 0,
	MONEY = 1,				-- 金币
	POWER = 2,				-- 体力
	BULLET = 3,				-- 弹药
	DIAMOND = 4,			-- 钻石
	MEDAL = 5,				-- 勋章
}
AchieveConfig.REWARDTYPE = _REWARD

local config = {
	[1001] = {itemId = 1001,itemName = "玩家升到2级",tasktype = 1,count = 2,isEmail = true,rewardtype = 5,rewardnum = 10,iconRes = "",},
	[1002] = {itemId = 1002,itemName = "玩家升到5级",tasktype = 1,count = 5,isEmail = true,rewardtype = 5,rewardnum = 11,iconRes = "",},
	[1003] = {itemId = 1003,itemName = "玩家升到10级",tasktype = 1,count = 10,isEmail = true,rewardtype = 5,rewardnum = 12,iconRes = "",},
	[1004] = {itemId = 1004,itemName = "玩家升到15级",tasktype = 1,count = 15,isEmail = true,rewardtype = 5,rewardnum = 13,iconRes = "",},
	[1005] = {itemId = 1005,itemName = "玩家升到20级",tasktype = 1,count = 20,isEmail = true,rewardtype = 5,rewardnum = 14,iconRes = "",},
	[1006] = {itemId = 1006,itemName = "玩家升到25级",tasktype = 1,count = 25,isEmail = true,rewardtype = 5,rewardnum = 15,iconRes = "",},
	[1007] = {itemId = 1007,itemName = "玩家升到30级",tasktype = 1,count = 30,isEmail = true,rewardtype = 5,rewardnum = 16,iconRes = "",},
	[1008] = {itemId = 1008,itemName = "玩家升到40级",tasktype = 1,count = 40,isEmail = true,rewardtype = 5,rewardnum = 17,iconRes = "",},
	[1009] = {itemId = 1009,itemName = "玩家升到50级",tasktype = 1,count = 50,isEmail = true,rewardtype = 5,rewardnum = 18,iconRes = "",},
	[1010] = {itemId = 1010,itemName = "收集金币1000个",tasktype = 2,count = 1000,isEmail = true,rewardtype = 5,rewardnum = 19,iconRes = "",},
	[1011] = {itemId = 1011,itemName = "收集金币2000个",tasktype = 2,count = 2000,isEmail = true,rewardtype = 5,rewardnum = 20,iconRes = "",},
	[1012] = {itemId = 1012,itemName = "收集金币3000个",tasktype = 2,count = 3000,isEmail = true,rewardtype = 5,rewardnum = 21,iconRes = "",},
	[1013] = {itemId = 1013,itemName = "收集金币4000个",tasktype = 2,count = 4000,isEmail = true,rewardtype = 5,rewardnum = 22,iconRes = "",},
	[1014] = {itemId = 1014,itemName = "收集金币5000个",tasktype = 2,count = 5000,isEmail = true,rewardtype = 5,rewardnum = 23,iconRes = "",},
	[1015] = {itemId = 1015,itemName = "通关第一章",tasktype = 3,count = 1,isEmail = true,rewardtype = 5,rewardnum = 24,iconRes = "",},
	[1016] = {itemId = 1016,itemName = "通关第二章",tasktype = 3,count = 2,isEmail = true,rewardtype = 5,rewardnum = 25,iconRes = "",},
	[1017] = {itemId = 1017,itemName = "通关第三章",tasktype = 3,count = 3,isEmail = true,rewardtype = 5,rewardnum = 26,iconRes = "",},
	[1018] = {itemId = 1018,itemName = "通关第四章",tasktype = 3,count = 4,isEmail = true,rewardtype = 5,rewardnum = 27,iconRes = "",},
	[1019] = {itemId = 1019,itemName = "通关第五章",tasktype = 3,count = 5,isEmail = true,rewardtype = 5,rewardnum = 28,iconRes = "",},
	[1020] = {itemId = 1020,itemName = "通关第六章",tasktype = 3,count = 6,isEmail = true,rewardtype = 5,rewardnum = 29,iconRes = "",},
	[1021] = {itemId = 1021,itemName = "总共杀死10000个敌人",tasktype = 4,count = 10000,isEmail = true,rewardtype = 5,rewardnum = 30,iconRes = "",},
	[1022] = {itemId = 1022,itemName = "总共杀死20000个敌人",tasktype = 4,count = 20000,isEmail = true,rewardtype = 5,rewardnum = 31,iconRes = "",},
	[1023] = {itemId = 1023,itemName = "总共杀死30000个敌人",tasktype = 4,count = 30000,isEmail = true,rewardtype = 5,rewardnum = 32,iconRes = "",},
	[1024] = {itemId = 1024,itemName = "总共杀死40000个敌人",tasktype = 4,count = 40000,isEmail = true,rewardtype = 5,rewardnum = 33,iconRes = "",},
	[1025] = {itemId = 1025,itemName = "总共杀死50000个敌人",tasktype = 4,count = 50000,isEmail = true,rewardtype = 5,rewardnum = 34,iconRes = "",},
}

-- 获取成就列表
function AchieveConfig.getAchieveList()
	return config 
end 

-- 根据成就ID获取数据
function AchieveConfig.getAchieveDataById(itemId)
	return config[itemId]
end 

-- 根据成就ID获取任务类型
function AchieveConfig.getAchieveTypeById(itemId)
	local data = AchieveConfig.getAchieveDataById(itemId)
	return data.tasktype
end 

-- 根据成就ID获取奖励类型
function AchieveConfig.getAchieveTypeById(itemId)
	local data = AchieveConfig.getAchieveDataById(itemId)
	return data.rewardtype
end 

-- 根据任务类型获取指定的表数据
function AchieveConfig.getTaskDataBytype(tasktype)
	if not tonumber(tasktype) then 
		print("param illegal !!!")
		return 
	end 

	if tasktype <= _TASKTYPE.NONE or tasktype >= _TASKTYPE.COUNT then 
		print("param beyond the boundary !!!")
		return 
	end 

	local _tab = {}
	for i, data in pairs(config) do 
		if data.tasktype == tasktype then 
			table.insert(_tab, data)
		end 
	end  
	return _tab 
end 

return AchieveConfig