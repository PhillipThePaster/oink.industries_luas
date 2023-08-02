local hudElements = {
    { name = "Health HUD", checkbox = false, hookName = "HideHealthHUD", hudName = "CHudHealth" },
    { name = "Battery HUD", checkbox = false, hookName = "HideBatteryHUD", hudName = "CHudBattery" },
    { name = "Ammo HUD", checkbox = false, hookName = "HideAmmoHUD", hudName = "CHudAmmo" },
    { name = "Secondary Ammo HUD", checkbox = false, hookName = "HideSecondaryAmmoHUD", hudName = "CHudSecondaryAmmo" }
}
oink.ui_context("HUD Elements")
for _, element in ipairs(hudElements) do
    oink.ui_checkbox("Hide " .. element.name, element.checkbox)
end
oink.event_listen("view_render_post", "oink_dupe_stealer", function()
    for _, element in ipairs(hudElements) do
        local hideHUD = oink.ui_get("HUD Elements", "Hide " .. element.name)
        if hideHUD then
            hook.Add("HUDShouldDraw", element.hookName, function(name)
                if name == element.hudName then return false end
            end)
        else
            hook.Remove("HUDShouldDraw", element.hookName)
        end
    end
end)
