AAPSettings = {};

function AAP_OnEvent(self, event)
    _G["QuestAutoAcceptCheckbox"]:SetChecked(AAPSettings.QuestAutoAccept);
end

function AAP_OnLoad(self)
    -- Listen for events
    self:RegisterEvent("PLAYER_LOGIN");

    -- Set the name for the Category for the Options Panel
    AzerothAutoPilotPanel.name = "Azeroth Auto Pilot";

    -- Create checkbox
    local locationCheckbox = CreateFrame("CheckButton", "QuestAutoAcceptCheckbox", self, "InterfaceOptionsCheckButtonTemplate");
    _G[locationCheckbox:GetName().."Text"]:SetText("Auto-accept Quests");
    locationCheckbox.tooltipText = "If checked, will automatically accept quests. Can also be manually toggled by control-clicking.";
    locationCheckbox:SetPoint("TOPLEFT", self, "TOPLEFT", 10, -10);
    locationCheckbox:SetScript("OnClick", function(self, button, down) 
        AAPSettings.QuestAutoAccept = locationCheckbox:GetChecked();
        if AAPSettings.QuestAutoAccept then
            DEFAULT_CHAT_FRAME:AddMessage(("%s: %s"):format("|cffffff7fAzeroth Auto Pilot|r", ("Auto-Accept Quests is now %s."):format("|cff00ff00enabled|r")));
        else
            DEFAULT_CHAT_FRAME:AddMessage(("%s: %s"):format("|cffffff7fAzeroth Auto Pilot|r", ("Auto-Accept Quests is now %s."):format("|cffff0000disabled|r")));
        end
    end);

    -- Add the panel to the Interface Options
    InterfaceOptions_AddCategory(self);
end