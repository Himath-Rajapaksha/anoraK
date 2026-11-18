---
name: cost-optimization
description: Use when reducing cloud costs by right-sizing resources, using spot instances, or cleaning up unused infrastructure.
---

# Cloud Cost Optimization

## When to Use This Skill
- Right-sizing over-provisioned instances
- Implementing auto-scaling to match demand
- Switching to spot or preemptible VMs for fault-tolerant workloads
- Cleaning up unused resources (EBS volumes, unused IPs, idle load balancers)
- Setting up cost alerts and budgets

## Workflow
1. Review current spending: identify the top cost drivers
2. Right-size instances: downgrade if CPU/memory utilization is consistently low
3. Use spot instances for batch jobs, CI runners, and fault-tolerant services
4. Implement auto-scaling: set minimum, maximum, and target utilization
5. Clean up: remove unattached volumes, unused IPs, and idle resources
6. Set up billing alerts: daily and monthly thresholds
7. Review reserved instances or savings plans for steady-state workloads

## Rules
- Monitor costs daily, not just monthly — catch spikes early
- Use the cloud provider's cost explorer to identify trends
- Tag all resources with a cost center for accountability
- Don't optimize for cost at the expense of reliability
- Review costs in every architecture decision
- Set budget alerts at 50%, 80%, and 100% of monthly budget
