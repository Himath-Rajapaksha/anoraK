---
name: remotion-video
description: Use when creating programmatic videos with React components using Remotion.
---

# Remotion Video

## When to Use This Skill
- Creating videos from React components
- Generating dynamic video content with data
- Adding animations and transitions to video sequences
- Rendering videos to MP4 for download or streaming

## Workflow
1. Set up: `npx create-video@latest my-video`
2. Define a composition: `registerRoot(MyComposition)` in `src/Root.tsx`
3. Build the video timeline: use `<Sequence>` for timing and `<AbsoluteFill>` for layout
4. Add animations: `useCurrentFrame()` with `interpolate()` for motion
5. Use dynamic data: pass props to compositions from `getInputProps()`
6. Preview: `npm start` opens the Remotion Studio
7. Render: `npx remotion render MyComposition out/video.mp4`
8. For streaming: use `renderMedia()` API for server-side rendering

## Rules
- Keep compositions focused — one video, one composition
- Use `interpolate()` for all animations, not CSS transitions
- Test frames manually before rendering the full video
- Use `useMemo` for expensive computations within the render loop
- Set appropriate codec: H.264 for web, ProRes for editing
- Render at the target resolution and FPS from the start
