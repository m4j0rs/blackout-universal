-- BLACKOUT // universal dispatcher
-- Load with: loadstring(game:HttpGet("https://raw.githubusercontent.com/m4j0rs/blackout-universal/refs/heads/main/main.lua"))()

local PATCHES = {
    [286090429]  = "https://raw.githubusercontent.com/m4j0rs/blackout-arsenal/refs/heads/main/arsenal%20blackout.lua",
    [7041939546] = "https://raw.githubusercontent.com/m4j0rs/catalog-blackout/refs/heads/main/catalog.lua",
    [142823291]  = "https://raw.githubusercontent.com/m4j0rs/mm2-blackout/refs/heads/main/mm2.lua",
    [893973440]  = "https://raw.githubusercontent.com/m4j0rs/blackout-flee/refs/heads/main/flee.lua",
}

local FALLBACK_URL = "https://raw.githubusercontent.com/m4j0rs/universal-blackout-fallback/refs/heads/main/uni"

local url = PATCHES[game.PlaceId]

if not url then
    warn("[Blackout] No dedicated patch for PlaceId " .. tostring(game.PlaceId) .. " — loading universal fallback.")
    url = FALLBACK_URL
end

local ok, err = pcall(function()
    loadstring(game:HttpGet(url, true))()
end)

if not ok then
    warn("[Blackout] Failed to load script for " .. tostring(game.PlaceId) .. ": " .. tostring(err))
end
