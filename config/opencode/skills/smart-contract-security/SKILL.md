---
name: smart-contract-security
description: Use when auditing smart contracts for vulnerabilities like reentrancy, overflow, or access control issues using Slither, Mythril, or Echidna.
---

# Smart Contract Security

## When to Use This Skill
- Auditing smart contracts for known vulnerability patterns
- Running automated analysis with Slither, Mythril, or Echidna
- Checking for reentrancy, integer overflow, and front-running risks
- Reviewing access control and privilege escalation paths

## Workflow
1. Run Slither: `slither . --checklist --json -` for static analysis
2. Run Mythril: `myth analyze contract.sol` for symbolic execution
3. Run Echidna: define invariants and run fuzzing tests
4. Review findings: check for reentrancy, unchecked calls, and state changes after external calls
5. Check access control: verify only-owner and role-based restrictions
6. Review upgrade patterns: proxy storage layout and initialization
7. Document findings with proof-of-concept exploits
8. Verify fixes with the same toolchain

## Rules
- Run all three tools — each catches different classes of bugs
- Never deploy a contract with known high-severity issues
- Check for reentrancy on every external call that transfers value
- Verify integer arithmetic — use SafeMath or Solidity 0.8+ built-in checks
- Test with realistic gas limits and block timestamps
- Document every finding with a reproduction step
