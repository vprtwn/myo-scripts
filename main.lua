

scriptId = 'com.thalmic.examples.outputeverything'

-- function onPoseEdge(pose, edge)
--     myo.debug("onPoseEdge: " .. pose .. ", " .. edge)
-- end

function onPeriodic()
end

function onForegroundWindowChange(app, title)
    -- myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    return true
end

function activeAppName()
end

function onActiveChange(isActive)
end

-- Effects
function moveRightSpace()
    myo.keyboard("right_arrow", "press", "control")
    myo.debug("right")
end

function moveLeftSpace()
    myo.keyboard("left_arrow", "press", "control")
    myo.debug("left")
end

-- Helpers

-- Makes use of myo.getArm() to swap wave out and wave in when the armband is being worn on
-- the left arm. This allows us to treat wave out as wave right and wave in as wave
-- left for consistent direction. The function has no effect on other poses.
function conditionallySwapWave(pose)
    if myo.getArm() == "left" then
        if pose == "waveIn" then
            pose = "waveOut"
        elseif pose == "waveOut" then
            pose = "waveIn"
        end
    end
    return pose
end

-- Unlock mechanism

-- function unlock()
--     unlocked = true
--     extendUnlock()
-- end

-- function extendUnlock()
--     unlockedSince = myo.getTimeMilliseconds()
-- end

-- Implement Callbacks

function onPoseEdge(pose, edge)
    -- Unlock
    if pose == "waveOut" then
        if edge == "on" then
            moveLeftSpace()
        end
    end

    -- Forward/backward and shuttle.
    if pose == "waveIn" then
        if edge == "on" then
            moveRightSpace()
        end
    end
end