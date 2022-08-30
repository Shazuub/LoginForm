AddEventHandler('onClientResourceStart', function(ressource)
    if ressource == GetCurrentResourceName() then
        Wait(100)
        SendNUIMessage({
            type = "show",
            status = true,
        })
        SendNUIMessage({ action = 'showbutton' })
        SetNuiFocus(true, true)
        ---
        CameraConnect = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
        SetCamCoord(CameraConnect, 606.99, 847.44, 357.91)
        SetCamRot(CameraConnect, 0.0, 0.0, 340.22)
        SetCamFov(CameraConnect, 45.97)
        ShakeCam(CameraConnect, "HAND_SHAKE", 0.2)
        SetCamActive(CameraConnect, true)
        RenderScriptCams(true, false, 2000, true, true)
        DisplayRadar(false)
    end
end)

RegisterNUICallback("button", function()
    SendNUIMessage({
        type = "show",
        status = false,
    })
    SendNUIMessage({ action = 'hidebutton' })
    SetNuiFocus(false, false)
    ---
    DoScreenFadeOut(1500)
    Wait(2000)
    RenderScriptCams(false, false, 0, true, true)
    Wait(1000)
    DoScreenFadeIn(2000)
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, 0)
    Wait(4000)
    ClearPedTasks(PlayerPedId())
    DisplayRadar(true)
    Notif.Custom()
end)