// ------------------------
// Default Answer Generator
// ------------------------
function getDefaultAnswer(style = "short", count = 0) {
    switch(style) {
        case "short":
            return `I found ${count} links on this page.`;
        case "detailed":
            return `This page contains ${count} links. Each link has a URL and visible text. You can read them aloud, export them, or process them further.`;
        case "technical":
            return `Extracted ${count} anchor elements with 'url' and 'text' properties Shortcut Inputin JSON format.`;
        default:
            return `I found ${count} links on this page.`;
    }
}

// ------------------------
// Determine Answer Style Dynamically
// ------------------------
var userInput = ""; // replace with actual user speech input if available
var style = "short";
if(userInput.toLowerCase().includes("detail")) style = "detailed";
else if(userInput.toLowerCase().includes("tech")) style = "technical";

// ------------------------
// Extract Links
// ------------------------
var links = [...document.querySelectorAll("a")].map(a => ({
    url: a.href,
    text: a.innerText.trim()
}));
var count = links.length;

// ------------------------
// Generate Message
// ------------------------
var message = getDefaultAnswer(style, count);

// ------------------------
// DLL-style Memory Storage
// ------------------------
var DLL = JSON.parse(localStorage.getItem("ai_DLL") || "[]");
DLL.push({
    timestamp: Date.now(),
    userIntent: "Extract Links",
    userInput: userInput,
    style: style,
    links: links,
    message: message
});
localStorage.setItem("ai_DLL", JSON.stringify(DLL));

// ------------------------
// Text-to-Speech Output
// ------------------------
if("speechSynthesis" in window){
    var utter = new SpeechSynthesisUtterance(message);
    speechSynthesis.speak(utter);
}

// ------------------------
// Return Result
// ------------------------
completion({
    links: links,
    message: message,
    DLL: DLL
});
