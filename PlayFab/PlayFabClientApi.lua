-- PlayFab Client API
-- This is the main file you should require in your game
-- All api calls are documented here: https://api.playfab.com/Documentation/Client
-- Example code:
-- local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
-- PlayFabClientApi.<ClientApiCall>(request, successCallbackFunc, errorCallbackFunc)

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")

local PlayFabClientApi = {
    settings = PlayFabSettings.settings
}

function PlayFabClientApi.IsClientLoggedIn()
    return (not (PlayFabSettings._internalSettings.sessionTicket == nil))
end

function PlayFabClientApi._MultiStepClientLogin(needsAttribution)
    if (needsAttribution and not PlayFabSettings.settings.disableAdvertising and PlayFabSettings.settings.advertisingIdType and PlayFabSettings.settings.advertisingIdValue) then
        local request = {}
        if (PlayFabSettings.settings.advertisingIdType == PlayFabSettings.settings.AD_TYPE_IDFA) then
            request.Idfa = PlayFabSettings.settings.advertisingIdValue
        elseif (PlayFabSettings.settings.advertisingIdType == PlayFabSettings.settings.AD_TYPE_ANDROID_ID) then
            request.Adid = PlayFabSettings.settings.advertisingIdValue
        else
            return
        end
        PlayFabClientApi.AttributeInstall(request, nil, nil)
    end
end

-- Accepts an open trade (one that has not yet been accepted or cancelled), if the locally signed-in player is in the
-- allowed player list for the trade, or it is open to all players. If the call is successful, the offered and accepted
-- items will be swapped between the two players' inventories.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AcceptTrade
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AcceptTradeRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AcceptTradeResponse
function PlayFabClientApi.AcceptTrade(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AcceptTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At
-- least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AddFriend
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddFriendRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddFriendResult
function PlayFabClientApi.AddFriend(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AddFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab
-- ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as
-- authentication credentials, as the intent is that it is easily accessible by other players.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AddGenericID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddGenericIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddGenericIDResult
function PlayFabClientApi.AddGenericID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AddGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Adds or updates a contact email to the player's profile.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AddOrUpdateContactEmail
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddOrUpdateContactEmailRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddOrUpdateContactEmailResult
function PlayFabClientApi.AddOrUpdateContactEmail(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AddOrUpdateContactEmail", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users
-- in the group can add new members. Shared Groups are designed for sharing data between a very small number of players,
-- please see our guide: https://api.playfab.com/docs/tutorials/landing-players/shared-groups
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AddSharedGroupMembers
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddSharedGroupMembersRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddSharedGroupMembersResult
function PlayFabClientApi.AddSharedGroupMembers(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AddSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Adds playfab username/password auth to an existing account created via an anonymous auth method, e.g. automatic device
-- ID login.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AddUsernamePassword
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddUsernamePasswordRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddUsernamePasswordResult
function PlayFabClientApi.AddUsernamePassword(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AddUsernamePassword", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Increments the user's balance of the specified virtual currency by the stated amount
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AddUserVirtualCurrency
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AddUserVirtualCurrencyRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ModifyUserVirtualCurrencyResult
function PlayFabClientApi.AddUserVirtualCurrency(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AddUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Registers the Android device to receive push notifications
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AndroidDevicePushNotificationRegistration
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AndroidDevicePushNotificationRegistrationRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AndroidDevicePushNotificationRegistrationResult
function PlayFabClientApi.AndroidDevicePushNotificationRegistration(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/AndroidDevicePushNotificationRegistration", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Attributes an install for advertisment.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/AttributeInstall
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AttributeInstallRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.AttributeInstallResult
function PlayFabClientApi.AttributeInstall(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    PlayFabSettings.settings.advertisingIdType = PlayFabSettings.settings.advertisingIdType .. "_Successful"
    IPlayFabHttps.MakePlayFabApiCall("/Client/AttributeInstall", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Cancels an open trade (one that has not yet been accepted or cancelled). Note that only the player who created the trade
-- can cancel it via this API call, to prevent griefing of the trade system (cancelling trades in order to prevent other
-- players from accepting them, for trades that can be claimed by more than one player).
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/CancelTrade
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.CancelTradeRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.CancelTradeResponse
function PlayFabClientApi.CancelTrade(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/CancelTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Confirms with the payment provider that the purchase was approved (if applicable) and adjusts inventory and virtual
-- currency balances as appropriate
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ConfirmPurchase
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ConfirmPurchaseRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ConfirmPurchaseResult
function PlayFabClientApi.ConfirmPurchase(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ConfirmPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ConsumeItem
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ConsumeItemRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ConsumeItemResult
function PlayFabClientApi.ConsumeItem(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Grants the player's current entitlements from Xbox Live, consuming all availble items in Xbox and granting them to the
-- player's PlayFab inventory. This call is idempotent and will not grant previously granted items to the player.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ConsumeXboxEntitlements
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ConsumeXboxEntitlementsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ConsumeXboxEntitlementsResult
function PlayFabClientApi.ConsumeXboxEntitlements(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeXboxEntitlements", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the
-- group. Upon creation, the current user will be the only member of the group. Shared Groups are designed for sharing data
-- between a very small number of players, please see our guide:
-- https://api.playfab.com/docs/tutorials/landing-players/shared-groups
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/CreateSharedGroup
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.CreateSharedGroupRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.CreateSharedGroupResult
function PlayFabClientApi.CreateSharedGroup(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/CreateSharedGroup", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Executes a CloudScript function, with the 'currentPlayerId' set to the PlayFab ID of the authenticated player.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ExecuteCloudScript
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ExecuteCloudScriptRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ExecuteCloudScriptResult
function PlayFabClientApi.ExecuteCloudScript(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ExecuteCloudScript", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the user's PlayFab account details
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetAccountInfo
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetAccountInfoRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetAccountInfoResult
function PlayFabClientApi.GetAccountInfo(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetAccountInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be
-- evaluated with the parent PlayFabId to guarantee uniqueness.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetAllUsersCharacters
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ListUsersCharactersRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ListUsersCharactersResult
function PlayFabClientApi.GetAllUsersCharacters(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetAllUsersCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the specified version of the title's catalog of virtual goods, including all defined properties
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetCatalogItems
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCatalogItemsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCatalogItemsResult
function PlayFabClientApi.GetCatalogItems(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetCatalogItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the title-specific custom data for the character which is readable and writable by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetCharacterData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterDataResult
function PlayFabClientApi.GetCharacterData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the specified character's current inventory of virtual goods
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetCharacterInventory
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterInventoryRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterInventoryResult
function PlayFabClientApi.GetCharacterInventory(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetCharacterLeaderboard
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterLeaderboardRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterLeaderboardResult
function PlayFabClientApi.GetCharacterLeaderboard(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the title-specific custom data for the character which can only be read by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetCharacterReadOnlyData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterDataResult
function PlayFabClientApi.GetCharacterReadOnlyData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the details of all title-specific statistics for the user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetCharacterStatistics
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterStatisticsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetCharacterStatisticsResult
function PlayFabClientApi.GetCharacterStatistics(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned
-- URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the
-- content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded,
-- the query to retrieve the data will fail. See this post for more information:
-- https://community.playfab.com/hc/en-us/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also,
-- please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetContentDownloadUrl
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetContentDownloadUrlRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetContentDownloadUrlResult
function PlayFabClientApi.GetContentDownloadUrl(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetContentDownloadUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Get details about all current running game servers matching the given parameters.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetCurrentGames
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.CurrentGamesRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.CurrentGamesResult
function PlayFabClientApi.GetCurrentGames(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetCurrentGames", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a list of ranked friends of the current player for the given statistic, starting from the indicated point in
-- the leaderboard
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetFriendLeaderboard
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetFriendLeaderboardRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardResult
function PlayFabClientApi.GetFriendLeaderboard(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a list of ranked friends of the current player for the given statistic, centered on the requested PlayFab
-- user. If PlayFabId is empty or null will return currently logged in user.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetFriendLeaderboardAroundPlayer
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetFriendLeaderboardAroundPlayerRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetFriendLeaderboardAroundPlayerResult
function PlayFabClientApi.GetFriendLeaderboardAroundPlayer(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from
-- linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetFriendsList
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetFriendsListRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetFriendsListResult
function PlayFabClientApi.GetFriendsList(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendsList", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Get details about the regions hosting game servers matching the given parameters.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetGameServerRegions
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GameServerRegionsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GameServerRegionsResult
function PlayFabClientApi.GetGameServerRegions(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetGameServerRegions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetLeaderboard
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardResult
function PlayFabClientApi.GetLeaderboard(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a list of ranked characters for the given statistic, centered on the requested Character ID
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetLeaderboardAroundCharacter
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardAroundCharacterRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardAroundCharacterResult
function PlayFabClientApi.GetLeaderboardAroundCharacter(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundCharacter", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a list of ranked users for the given statistic, centered on the requested player. If PlayFabId is empty or
-- null will return currently logged in user.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetLeaderboardAroundPlayer
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardAroundPlayerRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardAroundPlayerResult
function PlayFabClientApi.GetLeaderboardAroundPlayer(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a list of all of the user's characters for the given statistic.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetLeaderboardForUserCharacters
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardForUsersCharactersRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetLeaderboardForUsersCharactersResult
function PlayFabClientApi.GetLeaderboardForUserCharacters(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardForUserCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- For payments flows where the provider requires playfab (the fulfiller) to initiate the transaction, but the client
-- completes the rest of the flow. In the Xsolla case, the token returned here will be passed to Xsolla by the client to
-- create a cart. Poll GetPurchase using the returned OrderId once you've completed the payment.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPaymentToken
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPaymentTokenRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPaymentTokenResult
function PlayFabClientApi.GetPaymentToken(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPaymentToken", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Gets a Photon custom authentication token that can be used to securely join the player into a Photon room. See
-- https://api.playfab.com/docs/using-photon-with-playfab/ for more details.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPhotonAuthenticationToken
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPhotonAuthenticationTokenRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPhotonAuthenticationTokenResult
function PlayFabClientApi.GetPhotonAuthenticationToken(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPhotonAuthenticationToken", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves all of the user's different kinds of info.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayerCombinedInfo
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerCombinedInfoRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerCombinedInfoResult
function PlayFabClientApi.GetPlayerCombinedInfo(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerCombinedInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the player's profile
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayerProfile
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerProfileRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerProfileResult
function PlayFabClientApi.GetPlayerProfile(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerProfile", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- List all segments that a player currently belongs to at this moment in time.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayerSegments
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerSegmentsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerSegmentsResult
function PlayFabClientApi.GetPlayerSegments(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerSegments", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the indicated statistics (current version and values for all statistics, if none are specified), for the local
-- player.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayerStatistics
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerStatisticsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerStatisticsResult
function PlayFabClientApi.GetPlayerStatistics(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the information on the available versions of the specified statistic.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayerStatisticVersions
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerStatisticVersionsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerStatisticVersionsResult
function PlayFabClientApi.GetPlayerStatisticVersions(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatisticVersions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Get all tags with a given Namespace (optional) from a player profile.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayerTags
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerTagsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerTagsResult
function PlayFabClientApi.GetPlayerTags(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Gets all trades the player has either opened or accepted, optionally filtered by trade status.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayerTrades
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerTradesRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayerTradesResponse
function PlayFabClientApi.GetPlayerTrades(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTrades", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromFacebookIDs
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromFacebookIDsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromFacebookIDsResult
function PlayFabClientApi.GetPlayFabIDsFromFacebookIDs(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromFacebookIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Game identifiers.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromFacebookInstantGamesIds
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromFacebookInstantGamesIdsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromFacebookInstantGamesIdsResult
function PlayFabClientApi.GetPlayFabIDsFromFacebookInstantGamesIds(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromFacebookInstantGamesIds", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Game Center identifiers (referenced in the Game Center
-- Programming Guide as the Player Identifier).
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromGameCenterIDs
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromGameCenterIDsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromGameCenterIDsResult
function PlayFabClientApi.GetPlayFabIDsFromGameCenterIDs(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGameCenterIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the
-- service name plus the service-specific ID for the player, as specified by the title when the generic identifier was
-- added to the player account.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromGenericIDs
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromGenericIDsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromGenericIDsResult
function PlayFabClientApi.GetPlayFabIDsFromGenericIDs(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGenericIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Google identifiers. The Google identifiers are the IDs for
-- the user accounts, available as "id" in the Google+ People API calls.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromGoogleIDs
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromGoogleIDsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromGoogleIDsResult
function PlayFabClientApi.GetPlayFabIDsFromGoogleIDs(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGoogleIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Kongregate identifiers. The Kongregate identifiers are the
-- IDs for the user accounts, available as "user_id" from the Kongregate API methods(ex:
-- http://developers.kongregate.com/docs/client/getUserId).
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromKongregateIDs
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromKongregateIDsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromKongregateIDsResult
function PlayFabClientApi.GetPlayFabIDsFromKongregateIDs(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromKongregateIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch identifiers.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromNintendoSwitchDeviceIds
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromNintendoSwitchDeviceIdsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromNintendoSwitchDeviceIdsResult
function PlayFabClientApi.GetPlayFabIDsFromNintendoSwitchDeviceIds(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromNintendoSwitchDeviceIds", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile
-- IDs for the user accounts, available as SteamId in the Steamworks Community API calls.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromSteamIDs
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromSteamIDsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromSteamIDsResult
function PlayFabClientApi.GetPlayFabIDsFromSteamIDs(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromSteamIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the unique PlayFab identifiers for the given set of Twitch identifiers. The Twitch identifiers are the IDs for
-- the user accounts, available as "_id" from the Twitch API methods (ex:
-- https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser).
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPlayFabIDsFromTwitchIDs
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromTwitchIDsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPlayFabIDsFromTwitchIDsResult
function PlayFabClientApi.GetPlayFabIDsFromTwitchIDs(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromTwitchIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the key-value store of custom publisher settings
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPublisherData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPublisherDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPublisherDataResult
function PlayFabClientApi.GetPublisherData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves a purchase along with its current PlayFab status. Returns inventory items from the purchase that are still
-- active.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetPurchase
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPurchaseRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetPurchaseResult
function PlayFabClientApi.GetPurchase(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves data stored in a shared group object, as well as the list of members in the group. Non-members of the group
-- may use this to retrieve group data, including membership, but they will not receive data for keys marked as private.
-- Shared Groups are designed for sharing data between a very small number of players, please see our guide:
-- https://api.playfab.com/docs/tutorials/landing-players/shared-groups
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetSharedGroupData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetSharedGroupDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetSharedGroupDataResult
function PlayFabClientApi.GetSharedGroupData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the set of items defined for the specified store, including all prices defined
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetStoreItems
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetStoreItemsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetStoreItemsResult
function PlayFabClientApi.GetStoreItems(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetStoreItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the current server time
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetTime
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTimeRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTimeResult
function PlayFabClientApi.GetTime(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetTime", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the key-value store of custom title settings
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetTitleData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTitleDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTitleDataResult
function PlayFabClientApi.GetTitleData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the title news feed, as configured in the developer portal
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetTitleNews
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTitleNewsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTitleNewsResult
function PlayFabClientApi.GetTitleNews(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleNews", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Returns the title's base 64 encoded RSA CSP blob.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetTitlePublicKey
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTitlePublicKeyRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTitlePublicKeyResult
function PlayFabClientApi.GetTitlePublicKey(request, onSuccess, onError)
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitlePublicKey", request, nil, nil, onSuccess, onError)
end

-- Gets the current status of an existing trade.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetTradeStatus
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTradeStatusRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetTradeStatusResponse
function PlayFabClientApi.GetTradeStatus(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetTradeStatus", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the title-specific custom data for the user which is readable and writable by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetUserData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataResult
function PlayFabClientApi.GetUserData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the user's current inventory of virtual goods
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetUserInventory
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserInventoryRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserInventoryResult
function PlayFabClientApi.GetUserInventory(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the publisher-specific custom data for the user which is readable and writable by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetUserPublisherData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataResult
function PlayFabClientApi.GetUserPublisherData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the publisher-specific custom data for the user which can only be read by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetUserPublisherReadOnlyData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataResult
function PlayFabClientApi.GetUserPublisherReadOnlyData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Retrieves the title-specific custom data for the user which can only be read by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetUserReadOnlyData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetUserDataResult
function PlayFabClientApi.GetUserReadOnlyData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Requests a challenge from the server to be signed by Windows Hello Passport service to authenticate.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GetWindowsHelloChallenge
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetWindowsHelloChallengeRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GetWindowsHelloChallengeResponse
function PlayFabClientApi.GetWindowsHelloChallenge(request, onSuccess, onError)
    IPlayFabHttps.MakePlayFabApiCall("/Client/GetWindowsHelloChallenge", request, nil, nil, onSuccess, onError)
end

-- Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated
-- with the parent PlayFabId to guarantee uniqueness.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/GrantCharacterToUser
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GrantCharacterToUserRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.GrantCharacterToUserResult
function PlayFabClientApi.GrantCharacterToUser(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/GrantCharacterToUser", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Android device identifier to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkAndroidDeviceID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkAndroidDeviceIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkAndroidDeviceIDResult
function PlayFabClientApi.LinkAndroidDeviceID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the custom identifier, generated by the title, to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkCustomID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkCustomIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkCustomIDResult
function PlayFabClientApi.LinkCustomID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Facebook account associated with the provided Facebook access token to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkFacebookAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkFacebookAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkFacebookAccountResult
function PlayFabClientApi.LinkFacebookAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Facebook Instant Games Id to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkFacebookInstantGamesId
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkFacebookInstantGamesIdRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkFacebookInstantGamesIdResult
function PlayFabClientApi.LinkFacebookInstantGamesId(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkFacebookInstantGamesId", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Game Center account associated with the provided Game Center ID to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkGameCenterAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkGameCenterAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkGameCenterAccountResult
function PlayFabClientApi.LinkGameCenterAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the currently signed-in user account to their Google account, using their Google account credentials
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkGoogleAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkGoogleAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkGoogleAccountResult
function PlayFabClientApi.LinkGoogleAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the vendor-specific iOS device identifier to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkIOSDeviceID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkIOSDeviceIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkIOSDeviceIDResult
function PlayFabClientApi.LinkIOSDeviceID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Kongregate identifier to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkKongregate
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkKongregateAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkKongregateAccountResult
function PlayFabClientApi.LinkKongregate(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the NintendoSwitchDeviceId to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkNintendoSwitchDeviceId
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkNintendoSwitchDeviceIdRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkNintendoSwitchDeviceIdResult
function PlayFabClientApi.LinkNintendoSwitchDeviceId(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkNintendoSwitchDeviceId", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Steam account associated with the provided Steam authentication ticket to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkSteamAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkSteamAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkSteamAccountResult
function PlayFabClientApi.LinkSteamAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Twitch account associated with the token to the user's PlayFab account.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkTwitch
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkTwitchAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkTwitchAccountResult
function PlayFabClientApi.LinkTwitch(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Link Windows Hello authentication to the current PlayFab Account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkWindowsHello
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkWindowsHelloAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkWindowsHelloAccountResponse
function PlayFabClientApi.LinkWindowsHello(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Links the Xbox Live account associated with the provided access code to the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LinkXboxAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkXboxAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LinkXboxAccountResult
function PlayFabClientApi.LinkXboxAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/LinkXboxAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Signs the user in using the Android device identifier, returning a session identifier that can subsequently be used for
-- API calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithAndroidDeviceID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithAndroidDeviceIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithAndroidDeviceID(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithAndroidDeviceID", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a custom unique identifier generated by the title, returning a session identifier that can
-- subsequently be used for API calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithCustomID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithCustomIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithCustomID(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithCustomID", request, nil, nil, onSuccess, onError)
end

-- Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls
-- which require an authenticated user. Unlike most other login API calls, LoginWithEmailAddress does not permit the
-- creation of new accounts via the CreateAccountFlag. Email addresses may be used to create accounts via
-- RegisterPlayFabUser.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithEmailAddress
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithEmailAddressRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithEmailAddress(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithEmailAddress", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a Facebook access token, returning a session identifier that can subsequently be used for API
-- calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithFacebook
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithFacebookRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithFacebook(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithFacebook", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a Facebook Instant Games ID, returning a session identifier that can subsequently be used for
-- API calls which require an authenticated user. Requires Facebook Instant Games to be configured.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithFacebookInstantGamesId
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithFacebookInstantGamesIdRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithFacebookInstantGamesId(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithFacebookInstantGamesId", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be
-- used for API calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithGameCenter
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithGameCenterRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithGameCenter(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGameCenter", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using their Google account credentials
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithGoogleAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithGoogleAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithGoogleAccount(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGoogleAccount", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using the vendor-specific iOS device identifier, returning a session identifier that can subsequently
-- be used for API calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithIOSDeviceID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithIOSDeviceIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithIOSDeviceID(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithIOSDeviceID", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a Kongregate player account.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithKongregate
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithKongregateRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithKongregate(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithKongregate", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a Nintendo Switch Device ID, returning a session identifier that can subsequently be used for
-- API calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithNintendoSwitchDeviceId
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithNintendoSwitchDeviceIdRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithNintendoSwitchDeviceId(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithNintendoSwitchDeviceId", request, nil, nil, onSuccess, onError)
end

-- Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls
-- which require an authenticated user. Unlike most other login API calls, LoginWithPlayFab does not permit the creation of
-- new accounts via the CreateAccountFlag. Username/Password credentials may be used to create accounts via
-- RegisterPlayFabUser, or added to existing accounts using AddUsernamePassword.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithPlayFab
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithPlayFabRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithPlayFab(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithPlayFab", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a Steam authentication ticket, returning a session identifier that can subsequently be used for
-- API calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithSteam
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithSteamRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithSteam(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithSteam", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a Twitch access token.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithTwitch
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithTwitchRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithTwitch(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithTwitch", request, nil, nil, onSuccess, onError)
end

-- Completes the Windows Hello login flow by returning the signed value of the challange from GetWindowsHelloChallenge.
-- Windows Hello has a 2 step client to server authentication scheme. Step one is to request from the server a challenge
-- string. Step two is to request the user sign the string via Windows Hello and then send the signed value back to the
-- server.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithWindowsHello
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithWindowsHelloRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithWindowsHello(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithWindowsHello", request, nil, nil, onSuccess, onError)
end

-- Signs the user in using a Xbox Live Token, returning a session identifier that can subsequently be used for API calls
-- which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/LoginWithXbox
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginWithXboxRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.LoginWithXbox(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithXbox", request, nil, nil, onSuccess, onError)
end

-- Attempts to locate a game session matching the given parameters. If the goal is to match the player into a specific
-- active session, only the LobbyId is required. Otherwise, the BuildVersion, GameMode, and Region are all required
-- parameters. Note that parameters specified in the search are required (they are not weighting factors). If a slot is
-- found in a server instance matching the parameters, the slot will be assigned to that player, removing it from the
-- availabe set. In that case, the information on the game session will be returned, otherwise the Status returned will be
-- GameNotFound.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/Matchmake
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.MatchmakeRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.MatchmakeResult
function PlayFabClientApi.Matchmake(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/Matchmake", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Opens a new outstanding trade. Note that a given item instance may only be in one open trade at a time.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/OpenTrade
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.OpenTradeRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.OpenTradeResponse
function PlayFabClientApi.OpenTrade(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/OpenTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Selects a payment option for purchase order created via StartPurchase
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/PayForPurchase
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.PayForPurchaseRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.PayForPurchaseResult
function PlayFabClientApi.PayForPurchase(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/PayForPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Buys a single item with virtual currency. You must specify both the virtual currency to use to purchase, as well as what
-- the client believes the price to be. This lets the server fail the purchase if the price has changed.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/PurchaseItem
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.PurchaseItemRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.PurchaseItemResult
function PlayFabClientApi.PurchaseItem(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/PurchaseItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Adds the virtual goods associated with the coupon to the user's inventory. Coupons can be generated via the
-- Economy->Catalogs tab in the PlayFab Game Manager.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RedeemCoupon
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RedeemCouponRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RedeemCouponResult
function PlayFabClientApi.RedeemCoupon(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/RedeemCoupon", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Registers the iOS device to receive push notifications
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RegisterForIOSPushNotification
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RegisterForIOSPushNotificationRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RegisterForIOSPushNotificationResult
function PlayFabClientApi.RegisterForIOSPushNotification(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterForIOSPushNotification", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Registers a new Playfab user account, returning a session identifier that can subsequently be used for API calls which
-- require an authenticated user. You must supply either a username or an email address.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RegisterPlayFabUser
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RegisterPlayFabUserRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RegisterPlayFabUserResult
function PlayFabClientApi.RegisterPlayFabUser(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterPlayFabUser", request, nil, nil, onSuccess, onError)
end

-- Registers a new PlayFab user account using Windows Hello authentication, returning a session ticket that can
-- subsequently be used for API calls which require an authenticated user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RegisterWithWindowsHello
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RegisterWithWindowsHelloRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.LoginResult
function PlayFabClientApi.RegisterWithWindowsHello(request, onSuccess, onError)
    request.TitleId = PlayFabSettings.settings.titleId

    local externalOnSuccess = onSuccess
    function wrappedOnSuccess(result)
        PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket
        if (result.Entity) then PlayFabSettings._internalSettings.entityToken = result.Entity.EntityToken end
        if (externalOnSuccess) then
            externalOnSuccess(result)
        end
        PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
    end
    onSuccess = wrappedOnSuccess
    IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterWithWindowsHello", request, nil, nil, onSuccess, onError)
end

-- Removes a contact email from the player's profile.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RemoveContactEmail
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveContactEmailRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveContactEmailResult
function PlayFabClientApi.RemoveContactEmail(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveContactEmail", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Removes a specified user from the friend list of the local user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RemoveFriend
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveFriendRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveFriendResult
function PlayFabClientApi.RemoveFriend(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Removes the specified generic service identifier from the player's PlayFab account.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RemoveGenericID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveGenericIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveGenericIDResult
function PlayFabClientApi.RemoveGenericID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the
-- group can remove members. If as a result of the call, zero users remain with access, the group and its associated data
-- will be deleted. Shared Groups are designed for sharing data between a very small number of players, please see our
-- guide: https://api.playfab.com/docs/tutorials/landing-players/shared-groups
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RemoveSharedGroupMembers
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveSharedGroupMembersRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RemoveSharedGroupMembersResult
function PlayFabClientApi.RemoveSharedGroupMembers(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Write a PlayStream event to describe the provided player device information. This API method is not designed to be
-- called directly by developers. Each PlayFab client SDK will eventually report this information automatically.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ReportDeviceInfo
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.DeviceInfoRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.EmptyResponse
function PlayFabClientApi.ReportDeviceInfo(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ReportDeviceInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title
-- can take action concerning potentially toxic players.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ReportPlayer
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ReportPlayerClientRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ReportPlayerClientResult
function PlayFabClientApi.ReportPlayer(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ReportPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Restores all in-app purchases based on the given restore receipt
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/RestoreIOSPurchases
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RestoreIOSPurchasesRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.RestoreIOSPurchasesResult
function PlayFabClientApi.RestoreIOSPurchases(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/RestoreIOSPurchases", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Forces an email to be sent to the registered email address for the user's account, with a link allowing the user to
-- change the password.If an account recovery email template ID is provided, an email using the custom email template will
-- be used.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/SendAccountRecoveryEmail
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.SendAccountRecoveryEmailRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.SendAccountRecoveryEmailResult
function PlayFabClientApi.SendAccountRecoveryEmail(request, onSuccess, onError)
    IPlayFabHttps.MakePlayFabApiCall("/Client/SendAccountRecoveryEmail", request, nil, nil, onSuccess, onError)
end

-- Updates the tag list for a specified user in the friend list of the local user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/SetFriendTags
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.SetFriendTagsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.SetFriendTagsResult
function PlayFabClientApi.SetFriendTags(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/SetFriendTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's
-- secret use the Admin or Server API method SetPlayerSecret.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/SetPlayerSecret
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.SetPlayerSecretRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.SetPlayerSecretResult
function PlayFabClientApi.SetPlayerSecret(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/SetPlayerSecret", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Start a new game server with a given configuration, add the current player and return the connection information.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/StartGame
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.StartGameRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.StartGameResult
function PlayFabClientApi.StartGame(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/StartGame", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Creates an order for a list of items from the title catalog
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/StartPurchase
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.StartPurchaseRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.StartPurchaseResult
function PlayFabClientApi.StartPurchase(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/StartPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC
-- balance negative with this API.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/SubtractUserVirtualCurrency
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.SubtractUserVirtualCurrencyRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ModifyUserVirtualCurrencyResult
function PlayFabClientApi.SubtractUserVirtualCurrency(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/SubtractUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Android device identifier from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkAndroidDeviceID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkAndroidDeviceIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkAndroidDeviceIDResult
function PlayFabClientApi.UnlinkAndroidDeviceID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related custom identifier from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkCustomID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkCustomIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkCustomIDResult
function PlayFabClientApi.UnlinkCustomID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Facebook account from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkFacebookAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkFacebookAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkFacebookAccountResult
function PlayFabClientApi.UnlinkFacebookAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Facebook Instant Game Ids from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkFacebookInstantGamesId
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkFacebookInstantGamesIdRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkFacebookInstantGamesIdResult
function PlayFabClientApi.UnlinkFacebookInstantGamesId(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkFacebookInstantGamesId", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Game Center account from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkGameCenterAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkGameCenterAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkGameCenterAccountResult
function PlayFabClientApi.UnlinkGameCenterAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Google account from the user's PlayFab account
-- (https://developers.google.com/android/reference/com/google/android/gms/auth/GoogleAuthUtil#public-methods).
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkGoogleAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkGoogleAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkGoogleAccountResult
function PlayFabClientApi.UnlinkGoogleAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related iOS device identifier from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkIOSDeviceID
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkIOSDeviceIDRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkIOSDeviceIDResult
function PlayFabClientApi.UnlinkIOSDeviceID(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Kongregate identifier from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkKongregate
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkKongregateAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkKongregateAccountResult
function PlayFabClientApi.UnlinkKongregate(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related NintendoSwitchDeviceId from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkNintendoSwitchDeviceId
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkNintendoSwitchDeviceIdRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkNintendoSwitchDeviceIdResult
function PlayFabClientApi.UnlinkNintendoSwitchDeviceId(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkNintendoSwitchDeviceId", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Steam account from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkSteamAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkSteamAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkSteamAccountResult
function PlayFabClientApi.UnlinkSteamAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Twitch account from the user's PlayFab account.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkTwitch
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkTwitchAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkTwitchAccountResult
function PlayFabClientApi.UnlinkTwitch(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlink Windows Hello authentication from the current PlayFab Account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkWindowsHello
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkWindowsHelloAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkWindowsHelloAccountResponse
function PlayFabClientApi.UnlinkWindowsHello(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Unlinks the related Xbox Live account from the user's PlayFab account
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlinkXboxAccount
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkXboxAccountRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlinkXboxAccountResult
function PlayFabClientApi.UnlinkXboxAccount(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkXboxAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Opens the specified container, with the specified key (when required), and returns the contents of the opened container.
-- If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented,
-- consistent with the operation of ConsumeItem.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlockContainerInstance
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlockContainerInstanceRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlockContainerItemResult
function PlayFabClientApi.UnlockContainerInstance(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerInstance", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Searches target inventory for an ItemInstance matching the given CatalogItemId, if necessary unlocks it using an
-- appropriate key, and returns the contents of the opened container. If the container (and key when relevant) are
-- consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UnlockContainerItem
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlockContainerItemRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UnlockContainerItemResult
function PlayFabClientApi.UnlockContainerItem(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Update the avatar URL of the player
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdateAvatarUrl
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateAvatarUrlRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.EmptyResponse
function PlayFabClientApi.UpdateAvatarUrl(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateAvatarUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Creates and updates the title-specific custom data for the user's character which is readable and writable by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdateCharacterData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateCharacterDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateCharacterDataResult
function PlayFabClientApi.UpdateCharacterData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Updates the values of the specified title-specific statistics for the specific character. By default, clients are not
-- permitted to update statistics. Developers may override this setting in the Game Manager > Settings > API Features.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdateCharacterStatistics
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateCharacterStatisticsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateCharacterStatisticsResult
function PlayFabClientApi.UpdateCharacterStatistics(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Updates the values of the specified title-specific statistics for the user. By default, clients are not permitted to
-- update statistics. Developers may override this setting in the Game Manager > Settings > API Features.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdatePlayerStatistics
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdatePlayerStatisticsRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdatePlayerStatisticsResult
function PlayFabClientApi.UpdatePlayerStatistics(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdatePlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Adds, updates, and removes data keys for a shared group object. If the permission is set to Public, all fields updated
-- or added in this call will be readable by users not in the group. By default, data permissions are set to Private.
-- Regardless of the permission setting, only members of the group can update the data. Shared Groups are designed for
-- sharing data between a very small number of players, please see our guide:
-- https://api.playfab.com/docs/tutorials/landing-players/shared-groups
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdateSharedGroupData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateSharedGroupDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateSharedGroupDataResult
function PlayFabClientApi.UpdateSharedGroupData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Creates and updates the title-specific custom data for the user which is readable and writable by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdateUserData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateUserDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateUserDataResult
function PlayFabClientApi.UpdateUserData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Creates and updates the publisher-specific custom data for the user which is readable and writable by the client
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdateUserPublisherData
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateUserDataRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateUserDataResult
function PlayFabClientApi.UpdateUserPublisherData(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Updates the title specific display name for the user
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/UpdateUserTitleDisplayName
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateUserTitleDisplayNameRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.UpdateUserTitleDisplayNameResult
function PlayFabClientApi.UpdateUserTitleDisplayName(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserTitleDisplayName", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Validates with Amazon that the receipt for an Amazon App Store in-app purchase is valid and that it matches the
-- purchased catalog item
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ValidateAmazonIAPReceipt
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateAmazonReceiptRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateAmazonReceiptResult
function PlayFabClientApi.ValidateAmazonIAPReceipt(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateAmazonIAPReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Validates a Google Play purchase and gives the corresponding item to the player.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ValidateGooglePlayPurchase
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateGooglePlayPurchaseRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateGooglePlayPurchaseResult
function PlayFabClientApi.ValidateGooglePlayPurchase(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateGooglePlayPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Validates with the Apple store that the receipt for an iOS in-app purchase is valid and that it matches the purchased
-- catalog item
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ValidateIOSReceipt
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateIOSReceiptRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateIOSReceiptResult
function PlayFabClientApi.ValidateIOSReceipt(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateIOSReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Validates with Windows that the receipt for an Windows App Store in-app purchase is valid and that it matches the
-- purchased catalog item
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/ValidateWindowsStoreReceipt
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateWindowsReceiptRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.ValidateWindowsReceiptResult
function PlayFabClientApi.ValidateWindowsStoreReceipt(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateWindowsStoreReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Writes a character-based event into PlayStream.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/WriteCharacterEvent
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.WriteClientCharacterEventRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.WriteEventResponse
function PlayFabClientApi.WriteCharacterEvent(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/WriteCharacterEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Writes a player-based event into PlayStream.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/WritePlayerEvent
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.WriteClientPlayerEventRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.WriteEventResponse
function PlayFabClientApi.WritePlayerEvent(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/WritePlayerEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

-- Writes a title-based event into PlayStream.
-- API Method Documentation: https://api.playfab.com/Documentation/Client/method/WriteTitleEvent
-- Request Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.WriteTitleEventRequest
-- Result Documentation: https://api.playfab.com/Documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.WriteEventResponse
function PlayFabClientApi.WriteTitleEvent(request, onSuccess, onError)
    if (not PlayFabClientApi.IsClientLoggedIn()) then error("Must be logged in to call this method") end
    IPlayFabHttps.MakePlayFabApiCall("/Client/WriteTitleEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

return PlayFabClientApi
