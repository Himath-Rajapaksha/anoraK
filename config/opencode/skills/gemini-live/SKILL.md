---
name: gemini-live
description: Use when building real-time bidirectional apps with Gemini Live API. Covers audio/video streaming, live function calling, and session management.
---

# Gemini Live API

## When to Use This Skill
- Building real-time voice or video interfaces
- Implementing bidirectional streaming with Gemini
- Calling functions during live audio/video sessions
- Managing session state across real-time interactions

## Workflow
1. Set up a WebSocket connection to the Gemini Live endpoint
2. Configure audio/video input and output codecs
3. Implement session initialization with system instructions
4. Set up real-time audio capture and playback
5. Define tool schemas for live function calling
6. Handle incoming tool call responses during streaming
7. Implement session lifecycle management (start, pause, resume, end)
8. Add reconnection logic for dropped connections

## Rules
- Handle audio/video codec mismatches gracefully
- Implement timeouts for unresponsive sessions
- Buffer audio to prevent clipping during network jitter
- Log session events for debugging without logging raw audio
- Test with poor network conditions before production
- Respect platform-specific audio permissions
