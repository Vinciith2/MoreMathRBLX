local Character = script.Parent -- Make sure to put in "StarterCharacterScripts"
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character.PrimaryPart or Character:WaitForChild("HumanoidRootPart")

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage") -- Getting the services

local MoreMath = require(ReplicatedStorage:WaitForChild("MoreMath")) -- Wherever you put your module.

local WalkSound = Instance.new("Sound",RootPart) -- Make the walking sound.
WalkSound.RollOffMaxDistance = 10
WalkSound.Looped = true
WalkSound.Volume = .05

local Running = false
Humanoid.Running:Connect(function(Speed)
	Running = Speed > .1 -- If the speed is greater than .1, they are running.
end)

local Footsteps = { -- Adding the footstep sounds.
	[Enum.Material.Concrete] = "rbxassetid://6362185620";
	[Enum.Material.Marble] = "rbxassetid://6362185620";
	[Enum.Material.Asphalt] = "rbxassetid://6362185620";
	[Enum.Material.Pavement] = "rbxassetid://6362185620";
	[Enum.Material.Wood] = "rbxassetid://9083826864";
	[Enum.Material.WoodPlanks] = "rbxassetid://9083826864";
	[Enum.Material.Metal] = "rbxassetid://9083841139";
	[Enum.Material.Foil] = "rbxassetid://9083841139";
	[Enum.Material.Glacier] = "rbxassetid://9083841139";
	[Enum.Material.Glass] = "rbxassetid://9083841139";
	[Enum.Material.DiamondPlate] = "rbxassetid://9083841139";
	[Enum.Material.CorrodedMetal] = "rbxassetid://9083841139";
	[Enum.Material.Grass] = "rbxassetid://9083837523";
	[Enum.Material.LeafyGrass] = "rbxassetid://9083822528";
	[Enum.Material.Ground] = "rbxassetid://9083822528";
	[Enum.Material.Plastic] = "rbxasset://sounds/action_footsteps_plastic.mp3";
	[Enum.Material.Ice] = "rbxasset://sounds/action_footsteps_plastic.mp3";
	[Enum.Material.SmoothPlastic] = "rbxasset://sounds/action_footsteps_plastic.mp3";
	[Enum.Material.Cobblestone] = "rbxassetid://9069875453";
	[Enum.Material.Pebble] = "rbxassetid://9069875453";
	[Enum.Material.Brick] = "rbxassetid://9069875453";
	[Enum.Material.CrackedLava] = "rbxassetid://9069875453";
	[Enum.Material.Basalt] = "rbxassetid://9069875453";
	[Enum.Material.Limestone] = "rbxassetid://9069875453";
	[Enum.Material.Sandstone] = "rbxassetid://9069875453";
	[Enum.Material.Granite] = "rbxassetid://9069875453";
	[Enum.Material.Sand] = "rbxassetid://9083846829";
	[Enum.Material.Snow] = "rbxassetid://9083846829";
	[Enum.Material.Fabric] = "rbxassetid://9083849830";
}

local CurrentMaterial
RunService.Stepped:Connect(function(DeltaTime)
	if Running then
		local Material = MoreMath.Surface(Humanoid)
		if Footsteps[Material] then
			if Material ~= CurrentMaterial then
				WalkSound.SoundId = Footsteps[Material]
				WalkSound:Play()
				CurrentMaterial = Material
			end
		else
			WalkSound:Stop()
			CurrentMaterial = nil
		end
	else
		WalkSound:Stop()
		CurrentMaterial = nil
	end
end)