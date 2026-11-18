---
name: chaos-engineering
description: Use when designing or running chaos experiments to test system resilience under fault conditions.
---

# Chaos Engineering

## When to Use This Skill
- Designing fault injection experiments for a production system
- Testing resilience to network latency, service failures, or resource exhaustion
- Measuring blast radius before running chaos experiments
- Building confidence that the system recovers from failures

## Workflow
1. Define the steady state: what "normal" looks like (latency, error rate, throughput)
2. Formulate a hypothesis: "the system will remain available if service X fails"
3. Design the experiment: what fault to inject, for how long, and over what scope
4. Start small: inject faults in staging or a single availability zone first
5. Execute the experiment: kill a service, add latency, exhaust resources
6. Observe the system: does it meet the stated SLOs during the fault?
7. Analyze results: what worked, what failed, what needs fixing
8. Fix the weaknesses and re-run the experiment to verify

## Rules
- Always start in staging, not production
- Limit blast radius — inject faults in one service or zone at a time
- Have a rollback plan before every experiment
- Run experiments during business hours for the first few iterations
- Document every experiment: hypothesis, method, result, and action items
- Don't run chaos experiments on systems without monitoring in place
