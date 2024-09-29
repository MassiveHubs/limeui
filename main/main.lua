-- Custom GUI Library
local CustomGUI = {}

function CustomGUI:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")

    ScreenGui.Name = "CustomGUI"
    ScreenGui.Parent = game.CoreGui

    Frame.Name = "MainFrame"
    Frame.Parent = ScreenGui
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Frame.Size = UDim2.new(0, 400, 0, 300)
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.SourceSans
    Title.TextSize = 24
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    self.Frame = Frame
    return self
end

function CustomGUI:CreateSection()
    local Section = Instance.new("Frame")
    Section.Name = "Section"
    Section.Parent = self.Frame
    Section.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Section.Size = UDim2.new(1, -20, 1, -70)
    Section.Position = UDim2.new(0, 10, 0, 60)
    
    self.Section = Section
    return self
end

function CustomGUI:CreateLabel(text)
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Parent = self.Section
    Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Label.Size = UDim2.new(1, 0, 0, 30)
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 18
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Position = UDim2.new(0, 0, 0, 0)

    -- Adjust section height to fit new content
    self.Section.Size = self.Section.Size + UDim2.new(0, 0, 0, 40)
    return self
end

function CustomGUI:CreateInput(placeholder, flag)
    local TextBox = Instance.new("TextBox")
    TextBox.Name = "TextBox"
    TextBox.Parent = self.Section
    TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
[15:50]
TextBox.Size = UDim2.new(1, 0, 0, 30)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.TextSize = 18
    TextBox.Text = ""
    TextBox.PlaceholderText = placeholder
    TextBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Position = UDim2.new(0, 0, 0, 40)

    -- Store flag value
    self.Flags = self.Flags or {}
    self.Flags[flag] = TextBox

    -- Adjust section height to fit new content
    self.Section.Size = self.Section.Size + UDim2.new(0, 0, 0, 40)
    return self
end

function CustomGUI:CreateButton(text, callback)
    local Button = Instance.new("TextButton")
    Button.Name = "Button"
    Button.Parent = self.Section
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 18
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Position = UDim2.new(0, 0, 0, 80)

    Button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    -- Adjust section height to fit new content
    self.Section.Size = self.Section.Size + UDim2.new(0, 0, 0, 40)
    return self
end

return CustomGUI
