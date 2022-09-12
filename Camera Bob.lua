local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MoreMath = require(ReplicatedStorage:WaitForChild("MoreMath"))

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local Running = false
local RunSpeed = 0

Humanoid.Running:Connect(function(Speed)
	Running = Speed > .1
	RunSpeed = Speed
end)

RunService.RenderStepped:Connect(function(dt)
	Humanoid.CameraOffset = MoreMath.Sine(Humanoid.CameraOffset,Humanoid.CameraOffset,tick(),2)
	if Running then
		Humanoid.CameraOffset = MoreMath.Sway(Humanoid.CameraOffset,tick(),RunSpeed/(Humanoid.WalkSpeed/2))
		Humanoid.CameraOffset = MoreMath.Bob(Humanoid.CameraOffset,tick(),RunSpeed,Humanoid.WalkSpeed/640)
	else
		Humanoid.CameraOffset = MoreMath.Lerp(Humanoid.CameraOffset,Vector3.new(0,0,0),.15)
	end
end)