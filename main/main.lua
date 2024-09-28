-- Main Library Table
local GuiLibrary = {}

-- Helper function to create UI elements with properties
local function Create(instanceType, properties)
    local instance = Instance.new(instanceType)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

-- Function to create a new screen GUI
function GuiLibrary:CreateGui(name)
    local ScreenGui = Create("ScreenGui", {
        Name = name,
        Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"),
        ResetOnSpawn = false
    })
    return ScreenGui
end

-- Function to create a new window
function GuiLibrary:CreateWindow(parent, title)
    local Window = Create("Frame", {
        Name = title .. "Window",
        Size = UDim2.new(0, 500, 0, 400),
        Position = UDim2.new(0.5, -250, 0.5, -200),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0,
        Parent = parent
    })

    local WindowTitle = Create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Text = title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 24,
        BorderSizePixel = 0,
        Parent = Window
    })

    local Tabs = Create("Frame", {
        Name = "Tabs",
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0, 50),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
        Parent = Window
    })

    local TabHolder = Create("Frame", {
        Name = "TabHolder",
        Size = UDim2.new(1, 0, 1, -90),
        Position = UDim2.new(0, 0, 0, 90),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0,
        Parent = Window
    })

    return Window, Tabs, TabHolder
end

-- Function to create a new tab
function GuiLibrary:CreateTab(parent, title, tabHolder)
[22:56]
local TabButton = Create("TextButton", {
        Name = title .. "Tab",
        Size = UDim2.new(0, 100, 1, 0),
        Position = UDim2.new(#parent:GetChildren() * 100, 0, 0, 0),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Text = title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 20,
        BorderSizePixel = 0,
        Parent = parent
    })

    local TabContent = Create("Frame", {
        Name = title .. "Content",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        Visible = false,
        Parent = tabHolder
    })

    TabButton.MouseButton1Click:Connect(function()
        for _, child in pairs(tabHolder:GetChildren()) do
            child.Visible = false
        end
        TabContent.Visible = true
    end)

    return TabButton, TabContent
end

-- Function to create a button
function GuiLibrary:CreateButton(parent, text, callback)
    local Button = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Text = text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 24,
        BorderSizePixel = 0,
        Parent = parent
    })

    Button.MouseButton1Click:Connect(callback)

    return Button
end

-- Function to create a slider
function GuiLibrary:CreateSlider(parent, text, min, max, callback)
    local SliderFrame = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 50),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        BorderSizePixel = 0,
        Parent = parent
    })

    local SliderText = Create("TextLabel", {
        Size = UDim2.new(0.5, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Text = text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 24,
        BorderSizePixel = 0,
[22:56]
Parent = SliderFrame
    })

    local Slider = Create("TextButton", {
        Size = UDim2.new(0.5, -10, 1, -10),
        Position = UDim2.new(0.5, 10, 0, 5),
        BackgroundColor3 = Color3.fromRGB(70, 70, 70),
        Text = "0",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 24,
        BorderSizePixel = 0,
        Parent = SliderFrame
    })

    local dragging = false
    local function updateInput(input)
        local delta = input.Position - SliderFrame.AbsolutePosition
        local value = math.clamp(delta.X / SliderFrame.AbsoluteSize.X, 0, 1)
        local result = math.floor(value * (max - min) + min)
        Slider.Position = UDim2.new(value, 10, 0, 5)
        Slider.Text = tostring(result)
        callback(result)
    end

    Slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    Slider.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    SliderFrame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateInput(input)
        end
    end)

    return SliderFrame
end

-- Function to create a toggle
function GuiLibrary:CreateToggle(parent, text, callback)
    local ToggleFrame = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 50),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        BorderSizePixel = 0,
        Parent = parent
    })

    local ToggleButton = Create("TextButton", {
        Size = UDim2.new(0.8, -10, 1, -10),
        Position = UDim2.new(0.1, 5, 0, 5),
        BackgroundColor3 = Color3.fromRGB(70, 70, 70),
        Text = text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextSize = 24,
[22:56]
BorderSizePixel = 0,
        Parent = ToggleFrame
    })

    local Enabled = false
    ToggleButton.MouseButton1Click:Connect(function()
        Enabled = not Enabled
        if Enabled then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
        callback(Enabled)
    end)

    return ToggleFrame
end

return GuiLibrary
