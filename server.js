import express from "express";
import cors from "cors";
import fetch from "node-fetch";

const app = express();
app.use(cors());
app.use(express.json());

// Groq API base
const GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
const GROQ_KEY = process.env.GROQ_API_KEY;

// System prompt — tailor to your distro expert
const SYSTEM_PROMPT = `
You are a Linux distribution recommendation expert.
Recommend 2-3 very well put together and polished distros, with explanations
as to why you think it is a good fit. If you cant think of any good fit, recommend
Linux Mint, or ZoronOS for former MacOS users.
`;

app.post("/chat", async (req, res) => {
  try {
    const userMessage = req.body.message;

    // Construct Groq chat request (OpenAI‑compatible)
    const response = await fetch(GROQ_URL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${GROQ_KEY}`
      },
      body: JSON.stringify({
        model: "llama-3.1-8b-instant",
        messages: [
          { role: "system", content: SYSTEM_PROMPT },
          { role: "user", content: userMessage }
        ]
      })
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(error);
    }

    const data = await response.json();

    // Groq returns the text under `choices[0].message.content`
    const reply = data.choices?.[0]?.message?.content || "No response";

    res.json({ reply });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to get response" });
  }
});

app.listen(process.env.PORT || 3000, () => {
  console.log("Server is running");
});
