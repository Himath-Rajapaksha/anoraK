---
name: vector-search
description: Use when building vector search systems with embedding models and vector databases for semantic retrieval.
---

# Vector Search

## When to Use This Skill
- Building semantic search over documents or products
- Setting up vector databases (Pinecone, Weaviate, Qdrant, pgvector)
- Implementing hybrid search combining keyword and semantic matching
- Optimizing recall vs latency trade-offs

## Workflow
1. Choose an embedding model based on domain and latency requirements
2. Generate embeddings for your corpus in batches
3. Set up a vector database and create an index with appropriate distance metric
4. Insert embeddings with metadata for filtering
5. Implement search: generate query embedding, search the index, filter by metadata
6. Add hybrid search: combine BM25 keyword search with vector search
7. Tune index parameters: HNSW ef_construction, M, or IVF lists
8. Benchmark with a representative query set and measure recall@k and latency

## Rules
- Choose distance metric (cosine, dot product, L2) based on your embedding model
- Batch embedding generation — don't embed one document at a time
- Filter by metadata before or during vector search, not after
- Set appropriate `top-k` — too low misses results, too high adds latency
- Monitor index size and query performance as the corpus grows
- Use ANN (approximate nearest neighbor) for large corpora, exact search for small ones
