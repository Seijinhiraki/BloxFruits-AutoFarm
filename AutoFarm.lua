if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
    game.StarterGui:SetCore("SendNotification", {
      Icon = "rbxassetid://9152775759";
          Title = "Seijin Hub", 
      Text = "Welcome Seijin Hub!"
  })
  
  wait(1)
  
  game.StarterGui:SetCore("SendNotification", {
      Icon = "rbxassetid://9152775759";
      Title = "Seijin Hub    ", 
      Text = "Loading Ui..."
  })
  
  wait(10)
  
   
      game:GetService("Players").LocalPlayer.Idled:connect(function()
          game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
          wait(1)
          game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      end)
  
      _G.Color = Color3.fromRGB(255,0,0)
      if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
      
      repeat wait() until game:GetService("Players")
      
      if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
          
      wait(1)
      
      do
          local ui = game.CoreGui:FindFirstChild("Seijin hubGUI")
          if ui then
              ui:Destroy()
          end
      end
      
      local UserInputService = game:GetService("UserInputService")
      local TweenService = game:GetService("TweenService")
      
      local function MakeDraggable(topbarobject, object)
          local Dragging = nil
          local DragInput = nil
          local DragStart = nil
          local StartPosition = nil
      
          local function Update(input)
              local Delta = input.Position - DragStart
              local pos =
                  UDim2.new(
                      StartPosition.X.Scale,
                      StartPosition.X.Offset + Delta.X,
                      StartPosition.Y.Scale,
                      StartPosition.Y.Offset + Delta.Y
                  )
              local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
              Tween:Play()
          end
      
          topbarobject.InputBegan:Connect(
              function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                      Dragging = true
                      DragStart = input.Position
                      StartPosition = object.Position
      
                      input.Changed:Connect(
                          function()
                              if input.UserInputState == Enum.UserInputState.End then
                                  Dragging = false
                              end
                          end
                      )
                  end
              end
          )
      
          topbarobject.InputChanged:Connect(
              function(input)
                  if
                      input.UserInputType == Enum.UserInputType.MouseMovement or
                      input.UserInputType == Enum.UserInputType.Touch
                  then
                      DragInput = input
                  end
              end
          )
      
          UserInputService.InputChanged:Connect(
              function(input)
                  if input == DragInput and Dragging then
                      Update(input)
                  end
              end
          )
      end
      
      local library = {}
      
      function library:AddWindow(text,keybind)
          local bind = keybind or Enum.KeyCode.RightControl
          local ff = false
          local currenttab = ""
      
          local DoctorShiba = Instance.new("ScreenGui")
          DoctorShiba.Name = "Seijin Hub GUI"
          DoctorShiba.Parent = game.CoreGui
          DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      
          local Main = Instance.new("Frame")
          Main.Name = "Main"
          Main.Parent = DoctorShiba
          Main.AnchorPoint = Vector2.new(0.5, 0.5)
          Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
          Main.BackgroundTransparency = 0.100
          Main.BorderSizePixel = 0
          Main.ClipsDescendants = true
          Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
          Main.Size = UDim2.new(0, 600, 0, 350)
      
          local Top = Instance.new("Frame")
          Top.Name = "Top"
          Top.Parent = Main
          Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          Top.BackgroundTransparency = 1.000
          Top.BorderSizePixel = 0
          Top.Size = UDim2.new(0, 600, 0, 20)
      
          local Page = Instance.new("Frame")
          Page.Name = "Page"
          Page.Parent = Main
          Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
          Page.BackgroundTransparency = 0.100
          Page.BorderSizePixel = 0
          Page.Size = UDim2.new(0, 125, 0, 350)
      
          local NameHub = Instance.new("TextLabel")
          NameHub.Name = "NameHub"
          NameHub.Parent = Page
          NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          NameHub.BackgroundTransparency = 1.000
          NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
          NameHub.Size = UDim2.new(0, 110, 0, 20)
          NameHub.Font = Enum.Font.GothamSemibold
          NameHub.Text = text
          NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
          NameHub.TextSize = 11.000
          NameHub.TextXAlignment = Enum.TextXAlignment.Left
      
          local User = Instance.new("Frame")
          User.Name = "User"
          User.Parent = Page
          User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          User.BackgroundTransparency = 1.000
          User.Position = UDim2.new(0, 0, 0.8, 30)
          User.Size = UDim2.new(0, 125, 0, 40)
      
          local UserText = Instance.new("TextLabel")
          UserText.Name = "UserText"
          UserText.Parent = User
          UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          UserText.BackgroundTransparency = 1.000
          UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
          UserText.Size = UDim2.new(0, 80, 0, 20)
          UserText.Font = Enum.Font.Gotham
          UserText.Text = tostring(game.Players.LocalPlayer.Name) 
          spawn(function()
              while wait() do
                  pcall(function()
                      wait(0.1) 
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(255, 0, 0)}
                      ):Play() 
                      wait(.5)            
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(255, 155, 0)}
                      ):Play() 
                      wait(.5)            
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(255, 255, 0)}
                      ):Play() 
                      wait(.5)            
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(0, 255, 0)}
                      ):Play() 
                      wait(.5)            
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(0, 255, 255)}
                      ):Play() 
                      wait(.5)            
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(0, 155, 255)}
                      ):Play() 
                      wait(.5)            
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(255, 0, 255)}
                      ):Play() 
                      wait(.5)            
                      game:GetService('TweenService'):Create(
                          UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                          {TextColor3 = Color3.fromRGB(255, 0, 155)}
                      ):Play() 
                      wait(.5)
                  end)
              end
          end)
          UserText.TextScaled = true
          UserText.TextSize = 11.000
          UserText.TextWrapped = true
          UserText.TextXAlignment = Enum.TextXAlignment.Left
      
          local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
          UITextSizeConstraint.Parent = UserText
          UITextSizeConstraint.MaxTextSize = 11
      
          local UserImage = Instance.new("ImageLabel")
          UserImage.Name = "UserImage"
          UserImage.Parent = User
          UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
          UserImage.Position = UDim2.new(0, 10, 0, 9)
          UserImage.Size = UDim2.new(0, 25, 0, 25)
          UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
      
          local UserImageCorner = Instance.new("UICorner")
          UserImageCorner.CornerRadius = UDim.new(0, 100)
          UserImageCorner.Name = "UserImageCorner"
          UserImageCorner.Parent = UserImage
      
          local ScrollPage = Instance.new("ScrollingFrame")
          ScrollPage.Name = "ScrollPage"
          ScrollPage.Parent = Page
          ScrollPage.Active = true
          ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          ScrollPage.BackgroundTransparency = 1.000
          ScrollPage.BorderSizePixel = 0
          ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
          ScrollPage.Size = UDim2.new(0, 125, 0, 290)
          ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
          ScrollPage.ScrollBarThickness = 0
          local PageList = Instance.new("UIListLayout")
          PageList.Name = "PageList"
          PageList.Parent = ScrollPage
          PageList.SortOrder = Enum.SortOrder.LayoutOrder
          PageList.Padding = UDim.new(0, 7)
      
          local PagePadding = Instance.new("UIPadding")
          PagePadding.Name = "PagePadding"
          PagePadding.Parent = ScrollPage
          PagePadding.PaddingTop = UDim.new(0, 5)
          PagePadding.PaddingLeft = UDim.new(0, 28)
      
          local TabFolder = Instance.new("Folder")
          TabFolder.Name = "TabFolder"
          TabFolder.Parent = Main
      
          MakeDraggable(Top,Main)
      
          local uihide = false
      
          UserInputService.InputBegan:Connect(function(input)
              if input.KeyCode == bind then
                  if uihide == false then
                      uihide = true
                      Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
                  else
                      uihide = false
                      Main:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
                  end
              end
          end)
      
          local uitab = {}
      
          function uitab:AddTab(text,image)
              local Image = image or 6023426915
      
              local PageButton = Instance.new("TextButton")
              PageButton.Name = "PageButton"
              PageButton.Parent = ScrollPage
              PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              PageButton.BackgroundTransparency = 1.000
              PageButton.BorderSizePixel = 0
              PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
              PageButton.Size = UDim2.new(0, 97, 0, 20)
              PageButton.AutoButtonColor = false
              PageButton.Font = Enum.Font.GothamSemibold
              PageButton.Text = text
              PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
              PageButton.TextSize = 11.000
              PageButton.TextXAlignment = Enum.TextXAlignment.Left
              
              local PageImage = Instance.new("ImageLabel")
              PageImage.Name = "PageImage"
              PageImage.Parent = PageButton
              PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              PageImage.BackgroundTransparency = 1.000
              PageImage.Position = UDim2.new(0, -20, 0, 3)
              PageImage.Size = UDim2.new(0, 15, 0, 15)
              PageImage.Image = "rbxassetid://"..tostring(Image)
      
              local MainTab = Instance.new("Frame")
              MainTab.Name = "MainTab"
              MainTab.Parent = TabFolder
              MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
              MainTab.BorderSizePixel = 0
              MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
              MainTab.Size = UDim2.new(0, 475, 0, 350)
              MainTab.Visible = false
      
              local ScrollTab = Instance.new("ScrollingFrame")
              ScrollTab.Name = "ScrollTab"
              ScrollTab.Parent = MainTab
              ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              ScrollTab.BackgroundTransparency = 1.000
              ScrollTab.BorderSizePixel = 0
              ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
              ScrollTab.Size = UDim2.new(0, 475, 0, 330)
              ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
              ScrollTab.ScrollBarThickness = 3
      
              local TabList = Instance.new("UIListLayout")
              TabList.Name = "TabList"
              TabList.Parent = ScrollTab
              TabList.SortOrder = Enum.SortOrder.LayoutOrder
              TabList.Padding = UDim.new(0, 5)
      
              local TabPadding = Instance.new("UIPadding")
              TabPadding.Name = "TabPadding"
              TabPadding.Parent = ScrollTab
              TabPadding.PaddingLeft = UDim.new(0, 10)
              TabPadding.PaddingTop = UDim.new(0, 10)
      
              PageButton.MouseButton1Click:Connect(function()
                  currenttab = MainTab.Name
                  for i,v in next, TabFolder:GetChildren() do 
                      if v.Name == "MainTab" then
                          v.Visible = false
                      end
                  end
                  MainTab.Visible = true
      
                  for i,v in next, ScrollPage:GetChildren() do 
                      if v:IsA("TextButton") then
                          TweenService:Create(
                              v,
                              TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                              {TextColor3 = Color3.fromRGB(225, 225, 225)}
                          ):Play()
                      end
                      TweenService:Create(
                          PageButton,
                          TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                          {TextColor3 = Color3.fromRGB(255,0,0)}
                      ):Play()
                  end
              end)
      
              if ff == false then
                  TweenService:Create(
                      PageButton,
                      TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                      {TextColor3 = Color3.fromRGB(255,0,0)}
                  ):Play()
                  for i,v in next, TabFolder:GetChildren() do 
                      if v.Name == "MainTab" then
                          v.Visible = false
                      end
                      MainTab.Visible = true
                  end
                  ff = true
              end
      
              game:GetService("RunService").Stepped:Connect(function()
                  pcall(function()
                      ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                      ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
                  end)
              end)
              
              local main = {}
              
              function main:AddButton(text,callback)
                  local Button = Instance.new("TextButton")
      
                  Button.Name = "Button"
                  Button.Parent = ScrollTab
                  Button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                  Button.BackgroundTransparency = 0.1
                  Button.BorderSizePixel = 0
                  Button.Size = UDim2.new(0, 455, 0, 30)
                  Button.AutoButtonColor = false
                  Button.Font = Enum.Font.Gotham
                  Button.Text = text
                  Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                  Button.TextSize = 11.000
                  Button.TextWrapped = true
                  
                  local ButtonCorner = Instance.new("UICorner")
                  ButtonCorner.Name = "ButtonCorner"
                  ButtonCorner.CornerRadius = UDim.new(0, 5)
                  ButtonCorner.Parent = Button
                  
                  Button.MouseEnter:Connect(function()
                      TweenService:Create(
                          Button,
                          TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                          {TextColor3 = Color3.fromRGB(255,0,0)}
                      ):Play()
                  end)
                  
                  Button.MouseLeave:Connect(function()
                      TweenService:Create(
                          Button,
                          TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                          {TextColor3 = Color3.fromRGB(225, 225, 225)}
                      ):Play()
                  end)
                  
                  Button.MouseButton1Click:Connect(function()
                      callback()
                      Button.TextSize = 0
                      TweenService:Create(
                          Button,
                          TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                          {TextSize = 11}
                      ):Play()
                  end)
              end
              
              function main:AddToggle(text,config,callback)
                  local ToggleImage = Instance.new("Frame")
                  
                  local Toggle = Instance.new("TextButton")
                  Toggle.Name = "Toggle"
                  Toggle.Parent = ScrollTab
                  Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                  Toggle.BackgroundTransparency = 0.1
                  Toggle.BorderSizePixel = 0
                  Toggle.AutoButtonColor = false
                  Toggle.Size = UDim2.new(0, 455, 0, 30)
                  Toggle.Font = Enum.Font.SourceSans
                  Toggle.Text = ""
                  Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                  Toggle.TextSize = 14.000
                  
                  local ToggleCorner = Instance.new("UICorner")
                  ToggleCorner.Name = "ToggleCorner"
                  ToggleCorner.CornerRadius = UDim.new(0, 5)
                  ToggleCorner.Parent = Toggle
      
                  local ToggleLabel = Instance.new("TextLabel")
                  ToggleLabel.Name = "ToggleLa
