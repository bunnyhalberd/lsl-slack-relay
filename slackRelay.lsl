//
// LSL Slack Relay
//
// Written by Bunny Halberd!
//
//   This code is an extremely simple example of how to relay a message from
//   LSL into Slack. There's not much to it, but I wanted to provide a working
//   example in case anyone else would like to play with it.
//
//   If you do something neat with it, I'd love to know about it. :)
//
//
// This code is placed into the public domain.
//
// December, 2015
//

// Slack Hook
string outgoingWebhook = "https://hooks.slack.com/services/XXXXXXXXX/YYYYYY/zzzzzzzzzzzzzzzzzzzzzz";


sendMessageToSlack(string senderName, string message)
{
    
    string json = llList2Json(JSON_OBJECT, ["icon_emoji", ":purple_heart:", "text", message, "username", senderName, "channel", "#general"]); 
    debug("outgoing json: " + json);

    llHTTPRequest(outgoingWebhook, [HTTP_METHOD, "POST"], json);

}

debug(string message)
{
    llOwnerSay(message);
}


default
{

    touch_start(integer totalNumber)
    {
        debug("touched");
        sendMessageToSlack(llGetLinkName(LINK_ROOT), llGetDisplayName(llDetectedKey(0)) + " touched me.");
    }
}
