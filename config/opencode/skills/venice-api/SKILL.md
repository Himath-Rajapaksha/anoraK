---
name: venice-api
description: Use when building apps with the Venice AI API for chat, image generation, text-to-speech, transcription, or video generation.
---

# Venice AI API

## When to Use This Skill
- Building chat completions with Venice AI models
- Generating images via the Venice image API
- Converting text to speech or audio to text
- Generating video content

## Workflow
1. Get an API key from Venice AI dashboard
2. Set the key: `export VENICE_API_KEY=<key>`
3. Chat completion: `POST /chat/completions` with model, messages, and parameters
4. Image generation: `POST /images/generations` with prompt and style parameters
5. Text-to-speech: `POST /audio/speech` with text and voice selection
6. Transcription: `POST /audio/transcriptions` with audio file
7. Video generation: `POST /video/generations` with prompt and parameters
8. Handle async responses with polling or callbacks as needed

## Rules
- Never expose API keys in client-side code
- Respect rate limits — implement backoff on 429 responses
- Validate model names before sending requests
- Store generated content with proper attribution if required
- Handle model availability — some models may be temporarily offline
