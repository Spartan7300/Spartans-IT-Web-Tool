async function send() {
  const input = document.getElementById("input");
  const message = input.value;
  input.value = "";

  addMessage("You: " + message, "user");

  const res = await fetch("https://spartans-it-web-tool.onrender.com/chat", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ message })
  });

  const data = await res.json();
  addMessage("Bot: " + data.reply, "bot");
}
