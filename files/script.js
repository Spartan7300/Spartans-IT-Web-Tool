async function send() {
  const input = document.getElementById("input");
  const message = input.value;
  if (!message) return;
  input.value = "";

  // Show user message
  addMessage("You: " + message, "user");

  // Show waiting indicator
  const waitingMessage = addMessage("Bot is thinking... (Render may be waking up)", "bot");

  try {
    const res = await fetch("https://spartans-it-web-tool-1.onrender.com/chat", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ message }),
    });

    const data = await res.json();

    // Remove waiting message and show real response
    waitingMessage.remove();
    addMessage("Bot: " + data.reply, "bot");
  } catch (err) {
    console.error(err);
    waitingMessage.remove();
    addMessage("Bot: Could not connect to server. Try again in a few seconds.", "bot");
  }
}

// Helper to add messages
function addMessage(text, className) {
  const chat = document.getElementById("chat");
  const div = document.createElement("div");
  div.className = "msg " + className;
  div.textContent = text;
  chat.appendChild(div);
  chat.scrollTop = chat.scrollHeight;
  return div; // return the div so we can remove/update it later
}
