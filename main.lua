local StarterGui = game:GetService("StarterGui")

local fontTypes = {
    { Enum.FontWeight.Regular, Enum.FontStyle.Normal },
    { Enum.FontWeight.Bold, Enum.FontStyle.Normal },
    { Enum.FontWeight.Regular, Enum.FontStyle.Italic },
    { Enum.FontWeight.Bold, Enum.FontStyle.Italic }
}

local function getFontIds(): {number}
    -- HttpService:GetAsync("https://apis.roblox.com/toolbox-service/v1/marketplace/73")

    return {
        11702779517,
        8836875837,
        11322590111,
        11702779240,
        11598121416,
        11598289817,
        8764312106,
        11702779409
    }
end

local function createUi(): Frame
    local screenGui = Instance.new("ScreenGui")
    local containerFrame = Instance.new("Frame")

    containerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    containerFrame.Position = UDim2.fromScale(0.5, 0.5)
    containerFrame.Size = UDim2.fromOffset(440, 430)
    containerFrame.Parent = screenGui

    local fontStylesFrame = Instance.new("Frame")

    fontStylesFrame.Size = UDim2.new(1, 0, 0, 30)
    fontStylesFrame.Parent = containerFrame

    local uiListLayout = Instance.new("UIListLayout")

    uiListLayout.FillDirection = Enum.FillDirection.Horizontal
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.Parent = fontStylesFrame

    local indexLabel = Instance.new("TextLabel")

    indexLabel.Size = UDim2.fromOffset(40, 30)
    indexLabel.Text = "Index"
    indexLabel.TextScaled = true
    indexLabel.Parent = fontStylesFrame

    for index, fontType in fontTypes do
        local fontWeight, fontStyle = unpack(fontType)
        local label = Instance.new("TextLabel")

        label.LayoutOrder = index
        label.Size = UDim2.fromOffset(100, 30)
        label.Text = string.format("%s - %s", fontWeight.Name, fontStyle.Name)
        label.TextScaled = true
        label.Parent = fontStylesFrame
    end

    local fontExamplesFrame = Instance.new("ScrollingFrame")

    fontExamplesFrame.Position = UDim2.fromOffset(0, 30)
    fontExamplesFrame.Size = UDim2.new(1, 0, 1, -30)
    fontExamplesFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    fontExamplesFrame.CanvasSize = UDim2.fromScale(0, 0)
    fontExamplesFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    fontExamplesFrame.ScrollBarThickness = 2
    fontExamplesFrame.Parent = containerFrame

    local uiListLayout = Instance.new("UIListLayout")

    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.Parent = fontExamplesFrame

    screenGui.Parent = StarterGui

    return fontExamplesFrame
end

local function createLabels()
    local ui = createUi()
    local fontIds = getFontIds()

    for index, fontId in ipairs(fontIds) do
        local fontContainerFrame = Instance.new("Frame")

        fontContainerFrame.LayoutOrder = index
        fontContainerFrame.Name = index
        fontContainerFrame.Size = UDim2.new(1, 0, 0, 100)
        fontContainerFrame.Parent = ui

        local uiListLayout = Instance.new("UIListLayout")

        uiListLayout.FillDirection = Enum.FillDirection.Horizontal
        uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        uiListLayout.Parent = fontContainerFrame

        local indexLabel = Instance.new("TextLabel")

        indexLabel.BackgroundTransparency = 1
        indexLabel.Size = UDim2.fromOffset(40, 30)
        indexLabel.Text = index
        indexLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        indexLabel.TextScaled = true
        indexLabel.Parent = fontContainerFrame

        for _, fontType in fontTypes do
            local fontWeight, fontStyle = unpack(fontType)
            local label = Instance.new("TextLabel")

            label.BackgroundTransparency = 1
            label.Size = UDim2.fromOffset(100, 100)
            label.FontFace = Font.fromId(fontId, fontWeight, fontStyle)
            label.Text = string.format("%s\n%s", fontWeight.Name, fontStyle.Name)
            label.TextColor3 = Color3.fromRGB(0, 0, 0)
            label.TextScaled = true
            label.Parent = fontContainerFrame
        end
    end
end

createLabels()
