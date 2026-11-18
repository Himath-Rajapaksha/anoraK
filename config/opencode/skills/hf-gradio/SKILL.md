---
name: hf-gradio
description: Use when building interactive ML demos with Gradio or deploying them to HF Spaces.
---

# Gradio Apps

## When to Use This Skill
- Building interactive demos for ML models
- Creating custom UIs with Gradio Blocks
- Deploying demos to HF Spaces
- Sharing public links for user testing

## Workflow
1. Install Gradio: `pip install gradio`
2. Create a simple interface: `gr.Interface(fn=predict, inputs="text", outputs="label")`
3. For complex layouts, use `gr.Blocks()` with nested components
4. Add event handlers: `input.change(fn=process, inputs=[input], outputs=[output])`
5. Test locally: `demo.launch()`
6. Deploy to Spaces: push an `app.py` and `requirements.txt` to a Space repo
7. Set hardware tier in Space settings for GPU requirements

## Rules
- Keep the demo focused on one clear task
- Handle errors gracefully — show user-friendly messages, not stack traces
- Limit input size to prevent resource exhaustion
- Use `gr.Blocks` for anything beyond a single-input-single-output interface
- Test with realistic inputs before sharing publicly
