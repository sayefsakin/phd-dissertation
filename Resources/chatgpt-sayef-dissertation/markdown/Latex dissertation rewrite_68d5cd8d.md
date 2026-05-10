# Latex dissertation rewrite

*2025-09-25 23:17 UTC*

## User

Check the following quoted text. Give me disseratation style texts in latex format. dont copy texts by texts 

"\section{Discussion}
\label{sec:discussion}

Our results demonstrated that ESeMan was the most efficient data management scheme for parallel timeline charts while also maintaining near perfect accuracy with respect to the naive approach, outperforming other popular data management options. While the results were consistently strong across all of our ESeMan configurations, users should choose a configuration that suits their tasks. As the one-dimensional KD-tree configuration was the most efficient, robust, and accurate, we recommend it be used in most circumstances. However, when memory consumption is a limiting factor, the agglomerative clustering configuration can be used as it typically requires half the memory of the KD-tree version while maintaining similar accuracy and fetch times for larger datasets.

While we expected the 2D KD-tree configuration to outperform the 1D case when given a fixed track order, it was typically slightly slower than the 1D case. Further analysis revealed that, compared to the 1D case, the 2D KD-tree has a larger tree height (farthest distance from the root node to any leaf node) and higher total node counts, which led to unnecessary node traversal during each query of our experiment. The higher node counts also resulted in increased data lookups in LMDB which further decreased the potential efficiency gains. Additional investigation is necessary to explore different splitting rules (for example, consecutive splits in the time dimension) and tree traversal techniques (for example, utilizing a priority queue based on the splitting rule) to reduce unnecessary node visits, and ultimately, identify which approach yields better query performance.

ESeMan could be configured with a different database system. As noted in our Limitations section, DuckDB queries could have been further optimized as well.
In database-only approaches, query performance is highly dependent on index design, SQL formulation, and execution planning. Our results suggest that achieving interactive latency in such systems often requires careful, manual optimization, placing a significant burden on visualization designers. With \textbf{ESeMan}, we attempt to alleviate this burden by providing a purpose-built, indexing-aware data manager that ensures low-latency interaction without requiring deep expertise in database tuning.

While our current evaluation focuses on query performance on static datasets, scenarios with a dynamic dataset where existing event data changes or new events arrive after data ingestion require further investigation. Additionally, we conducted our experiments in single-node cases, capping the dataset size due to memory limitations. Scaling further would require updating the implementation and testing ESeMan using distributed components.

ESeMan represents a significant step forward in scalable event sequence visualization, demonstrating the possibility of achieving both interactive performance and visual accuracy in large exploratory data exploration. By addressing the fundamental trade-offs that have limited previous approaches, our work opens new possibilities for effective interactive analysis of large event sequences across diverse application domains.

\section{Conclusion}
We introduced ESeMan (Event SEquence MANager), a hierarchical data management system designed to address the dual challenges of maintaining interactive performance and visual accuracy in large event sequence visualization using parallel timeline charts. ESeMan demonstrates significant improvements over popular existing approaches in both data retrieval performance and visual accuracy. Our presented evaluation validates ESeMan's effectiveness in achieving sub-100 ms interactive response times while maintaining pixel-perfect visual accuracy. Furthermore, we show how ESeMan's tunable pixel window allows trading off mild visual accuracy for faster data fetch times, thereby increasing the effective data scale at which ESeMan can serve interactive queries."

## Assistant

Here’s a rewritten version in dissertation-style LaTeX, where I’ve kept the academic tone and structure but avoided copying the original text word-for-word.  

```latex
\section{Discussion}
\label{sec:discussion}

The experimental results highlight the effectiveness of \textbf{ESeMan} as a data management strategy for parallel timeline charts. Among the techniques compared, ESeMan consistently provided the fastest query response times while maintaining accuracy nearly indistinguishable from the baseline naive method. This demonstrates that a purpose-built hierarchical approach can simultaneously deliver high efficiency and high fidelity, a combination not consistently achieved by alternative strategies.  

Within ESeMan, different configurations were explored, and their suitability was found to depend on task requirements. The one-dimensional KD-tree variant emerged as the most balanced option, offering superior performance and robustness across datasets. As such, it represents the recommended configuration for most general-purpose use cases. Nevertheless, memory efficiency can become a practical concern for larger datasets. In such cases, the agglomerative clustering approach provides a viable alternative, achieving comparable accuracy while reducing memory usage by nearly half.  

Interestingly, the two-dimensional KD-tree did not yield the expected performance improvements. Although it leveraged additional structural information by incorporating the track dimension, its deeper tree height and larger node count introduced inefficiencies. This resulted in more frequent node traversals and redundant lookups, diminishing its potential benefits. These findings suggest that future work should investigate more adaptive splitting strategies and traversal mechanisms—such as priority-based traversal or hybrid splitting along time dimensions—to reduce overhead and enhance query efficiency.  

Another observation concerns the role of the underlying storage engine. While ESeMan currently relies on LMDB, alternative backends such as DuckDB could be further explored. Pure database-centric approaches highlight the challenges of index design, query planning, and execution optimization, which often demand manual intervention and specialized expertise. By contrast, ESeMan abstracts these complexities by providing a data manager that is explicitly aware of indexing strategies, thereby enabling interactive latencies without requiring advanced database tuning knowledge.  

The present evaluation focused on static datasets and single-node execution. Real-world applications may involve dynamic datasets where new events are ingested or existing ones are modified over time. Addressing these scenarios requires extending the current design to handle incremental updates while preserving performance guarantees. Similarly, scaling to distributed environments would necessitate adapting ESeMan to coordinate across multiple nodes while minimizing communication overhead.  

Taken together, these findings position ESeMan as a strong candidate for advancing interactive visualization of large event sequence data. By mitigating the trade-offs that have historically constrained scalability and responsiveness, ESeMan lays the groundwork for broader adoption of parallel timeline charts in diverse analytical domains.

\section{Conclusion}
\label{sec:conclusion}

This dissertation introduced \textbf{ESeMan} (Event SEquence MANager), a hierarchical data management system designed to support interactive visualization of large event sequences through parallel timeline charts. The system addresses two central challenges in event sequence visualization: ensuring interactive performance and preserving visual accuracy. Through comparative evaluation, ESeMan was shown to significantly outperform existing data management approaches, achieving query latencies within sub-100 millisecond bounds while maintaining pixel-level accuracy.  

An additional feature of ESeMan is its tunable pixel window, which enables users to balance between strict accuracy and faster response times. This flexibility allows analysts to scale their exploration to larger datasets without compromising usability, making ESeMan particularly valuable in settings where responsiveness is critical.  

In summary, ESeMan demonstrates that it is possible to combine the strengths of efficient indexing, tailored data summarization, and visualization-aware query design in order to advance the state of large-scale event sequence visualization. By bridging the gap between data management and visualization needs, ESeMan contributes a generalizable approach that can inform future systems aimed at interactive exploration of complex temporal event data.
```

Do you want me to also **tie the Conclusion section back to the broader dissertation** (i.e., connecting ESeMan with the overall claim about linking data management and visual design), or keep it as a stand-alone conclusion for the ESeMan chapter?
