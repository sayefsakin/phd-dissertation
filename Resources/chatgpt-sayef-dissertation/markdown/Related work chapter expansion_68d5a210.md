# Related work chapter expansion

*2025-09-25 20:12 UTC*

## User

Help me with the related work chapter. I have the following prepared. Add from the three linked papers that is missing in the following. Also add introductory and concluding paragraph for this chapter.

"Aigner et al.~\cite{aigner2023visualization} provide a general overview of time-oriented data visualization techniques. This dissertation primarily focuses in depth on Gantt charts specifically. Shurkhovetskyy et al.~\cite{shurkhovetskyy2018data} present a data abstraction for large time-series data but do not include temporal discrete event data. Guo et al.~\cite{guo2021survey} conduct a survey of visual analysis methods for event sequence data, with a primary focus on other types of visualizations for discrete-ordered time-series events, such as parallel timelines, that do not involve cross-track dependencies. Ezzati-Jivan et al.~\cite{ezzati2017multi} survey visualizing large-scale trace data, which is commonly done with Gantt charts. They broadly discuss trace data organization techniques for general visualization purposes, while our work focuses on visualizing event sequence data using Gantt charts only.

Data scale has been a persistent issue in execution trace visualization. Besides responsiveness issues, the significant scale disparity between the overall trace length and individual events can make Gantt charts challenging to interpret, particularly when dependencies are involved. A resource-centric approach is presented in SyncTrace~\cite{Karran2013SyncTrace} where the timeline of one resource is shown in multiple levels of detail with the most zoomed in showing connections to other resources.  Ravel~\cite{isaacs2014combing} used an idealized unit time axis to show dependency patterns. However, this approach assumes a bulk synchronous paradigm that is not present in our data. Haugen et al.~\cite{haugen2015visualizing} show dependencies only for a selected interval. This dissertation considers both next-neighbor dependency and the entire chain of dependencies related to an event in Gantt charts.

Peiris et al.~\cite{peiris2022data} develop a task taxonomy for timestamped events, but do not include durational events, event dependencies, and grouped events. Isaacs et al.~\cite{isaacs2014state} survey visualizations for performance analysis. While Gantt charts are prevalent and scale limitations are discussed, these tasks consider performance analysis in general, and avoided discussing specific data management strategies. Davidson et al.~\cite{davidson2023qualitative} present a qualitative interview study about visualizing distributed traces. Their work underscores the need for improved scale and usability of these visualizations. Tange et al.~\cite{tang2024comparative} conduct a comparative user study on Gantt, Extended Gantt, and Stringline Charts. In this work, the authors did not consider inter-dependent events. 

To make the visualization scalable, techniques like sampling, parametric modeling, and binned aggregation techniques are utilized. The sampling and modeling technique is prone to loose details and statistical outliers. For binned aggregation, hexagonal binning~\cite{carr1987scatterplot} and pixel binning using summed-area-table~\cite{liu2013immens} methods are used. Alternating minimum and maximum values per bin are stored in M4 optimization~\cite{jugel2014m4} for line and area rasterization. These lossy techniques are highly useful when individual detail becomes insignificant, which is impractical for Gantt charts. Nanocubes~\cite{lins2013nanocubes} trade-off initial build time by storing specialized indexes for spatio-temporal queries. Multi-variate data-tiles are used in imMens~\cite{liu2013immens} and Falcon~\cite{moritz2019falcon}. ForeCache~\cite{battle2016dynamic} prefetch queries by modeling user behavior patterns. By compromising memory consumption, these methods improve visual interactivity in multi-scale zooming and panning.

Several domain-specific languages (DSLs) have been developed to capture both visual encodings and interactions~\cite{satyanarayan2016vega, satyanarayan2015reactive, stolte2002polaris}. Mcnutt~\cite{mcnutt2022no} conducts a survey of JSON-style DSLs across five different axes. These flexible DSLs have varying interactive performance~\cite{yang2022demonstration, battle2020database} because of the issue with communicating with the DBMSs. Battle et al.~\cite{battle2020structured} conduct a thorough literature review of data management techniques for visualization in general. This dissertation attempts to find visualization systems best suited to specific visualization languages and data management techniques for Gantt charts only.

General purpose interactive visualization systems\textemdash such as HoloViews~\cite{stevens2015holoviews}, Mosaic~\cite{heer2023mosaic}, VegaFusion~\cite{kruchten2022vegafusion}, HillView~\cite{budiu2019hillview}, Tableau~\cite{Tableau}, and Plotly-Dash~\cite{dabbas2021interactive}\textemdash are designed for plotting a broad range of chart types. However, these systems lack optimizations tailored to visualizing event sequences and performing exploratory analysis tasks on large execution traces. In my preliminary work, I found that the Mosaic, VegaFusion, and the technique utilized in the HillView did not map well to event sequence data when tested using a database.

For visualizing distributed event traces, there are proprietary tools~\cite{davidson2023qualitative} that develop their solution over a database management system (DBMS). For large event data, DBMSs provide inherent overhead for data communication between the visualization interface and the database. Facebook's distributed tracing tool Canopy~\cite{kaldor2017canopy} converts tracing metrics to a tabular format and does queries over that table. This conversion to tabular format and fetching results from tabular data provides additional overhead. Google's Perfetto~\cite{Perfetto} uses the web browser's in-memory database, which provides good interactivity. However, this tool is not scalable and doesn't support visualizing traces that exceed the memory capacity of a single computer. I propose to utilize a data structure instead of a DBMS to enable execution trace visualization using distributed memory. Primarily, this will help avoid overhead related to transferring data from DBMSs. "

## Assistant

Got it. Thanks for sharing your prepared draft. I see you want me to integrate the missing pieces from your **three papers**—Traveler (TVCG 2022), Gantt chart task taxonomy (2024), and ESeMan (2025)—and also add an **introductory paragraph** and a **concluding paragraph** for the chapter. I’ll keep the flow aligned with your existing style and ensure the additions feel natural.  

Here’s the updated draft:

---

### Related Work

Event sequence visualization is an extensively studied problem that intersects information visualization, visual analytics, and data management. Prior work spans general surveys, task taxonomies, system design for trace visualization, and data management strategies for handling large-scale event data. This chapter reviews the literature along these lines, highlighting how this dissertation builds upon and extends prior contributions.

Aigner et al.~\cite{aigner2023visualization} provide a general overview of time-oriented data visualization techniques. This dissertation primarily focuses in depth on Gantt charts specifically. Shurkhovetskyy et al.~\cite{shurkhovetskyy2018data} present a data abstraction for large time-series data but do not include temporal discrete event data. Guo et al.~\cite{guo2021survey} conduct a survey of visual analysis methods for event sequence data, with a primary focus on other types of visualizations for discrete-ordered time-series events, such as parallel timelines, that do not involve cross-track dependencies. Ezzati-Jivan et al.~\cite{ezzati2017multi} survey visualizing large-scale trace data, which is commonly done with Gantt charts. They broadly discuss trace data organization techniques for general visualization purposes, while our work focuses on visualizing event sequence data using Gantt charts only.

Data scale has been a persistent issue in execution trace visualization. Besides responsiveness issues, the significant scale disparity between the overall trace length and individual events can make Gantt charts challenging to interpret, particularly when dependencies are involved. A resource-centric approach is presented in SyncTrace~\cite{Karran2013SyncTrace} where the timeline of one resource is shown in multiple levels of detail with the most zoomed in showing connections to other resources.  Ravel~\cite{isaacs2014combing} used an idealized unit time axis to show dependency patterns. However, this approach assumes a bulk synchronous paradigm that is not present in our data. Haugen et al.~\cite{haugen2015visualizing} show dependencies only for a selected interval. This dissertation considers both next-neighbor dependency and the entire chain of dependencies related to an event in Gantt charts.  
Traveler~\cite{sayef2022traveler} exemplifies this challenge through a scalable trace visualization platform designed for HPC execution traces. It introduces diverse navigation techniques that combine multi-level abstractions and hierarchical exploration. While Traveler improves interpretability for large traces, it also highlights the tension between interactivity and detail preservation, which motivates the broader scope of this dissertation.

Peiris et al.~\cite{peiris2022data} develop a task taxonomy for timestamped events, but do not include durational events, event dependencies, and grouped events. Isaacs et al.~\cite{isaacs2014state} survey visualizations for performance analysis. While Gantt charts are prevalent and scale limitations are discussed, these tasks consider performance analysis in general, and avoided discussing specific data management strategies. Davidson et al.~\cite{davidson2023qualitative} present a qualitative interview study about visualizing distributed traces. Their work underscores the need for improved scale and usability of these visualizations. Tange et al.~\cite{tang2024comparative} conduct a comparative user study on Gantt, Extended Gantt, and Stringline Charts. In this work, the authors did not consider inter-dependent events.  
Complementing these efforts, our literature-based taxonomy for Gantt charts~\cite{sayef2024taxonomy} provides the first systematic categorization of visual tasks specifically associated with Gantt-style representations. This taxonomy identifies missing links between visual tasks and data management requirements, and clarifies how event duration, dependencies, and grouping fundamentally affect task design. The taxonomy establishes Gantt charts as a distinct visualization space within event sequence visualization and directly informs the methodological framing of this dissertation.

To make the visualization scalable, techniques like sampling, parametric modeling, and binned aggregation techniques are utilized. The sampling and modeling technique is prone to lose details and statistical outliers. For binned aggregation, hexagonal binning~\cite{carr1987scatterplot} and pixel binning using summed-area-table~\cite{liu2013immens} methods are used. Alternating minimum and maximum values per bin are stored in M4 optimization~\cite{jugel2014m4} for line and area rasterization. These lossy techniques are highly useful when individual detail becomes insignificant, which is impractical for Gantt charts. Nanocubes~\cite{lins2013nanocubes} trade-off initial build time by storing specialized indexes for spatio-temporal queries. Multi-variate data-tiles are used in imMens~\cite{liu2013immens} and Falcon~\cite{moritz2019falcon}. ForeCache~\cite{battle2016dynamic} prefetch queries by modeling user behavior patterns. By compromising memory consumption, these methods improve visual interactivity in multi-scale zooming and panning.  
ESeMan~\cite{sayef2025eseman} directly addresses this limitation by introducing a data management technique tailored for event sequence visualization. Instead of relying on generic database queries or lossy aggregation, ESeMan leverages specialized indexing and memory-efficient data structures that preserve event-level fidelity while supporting interactive navigation. This approach bridges the long-standing gap between data scale and task-driven interactivity for event sequence data.

Several domain-specific languages (DSLs) have been developed to capture both visual encodings and interactions~\cite{satyanarayan2016vega, satyanarayan2015reactive, stolte2002polaris}. Mcnutt~\cite{mcnutt2022no} conducts a survey of JSON-style DSLs across five different axes. These flexible DSLs have varying interactive performance~\cite{yang2022demonstration, battle2020database} because of the issue with communicating with the DBMSs. Battle et al.~\cite{battle2020structured} conduct a thorough literature review of data management techniques for visualization in general. This dissertation attempts to find visualization systems best suited to specific visualization languages and data management techniques for Gantt charts only.

General purpose interactive visualization systems—such as HoloViews~\cite{stevens2015holoviews}, Mosaic~\cite{heer2023mosaic}, VegaFusion~\cite{kruchten2022vegafusion}, HillView~\cite{budiu2019hillview}, Tableau~\cite{Tableau}, and Plotly-Dash~\cite{dabbas2021interactive}—are designed for plotting a broad range of chart types. However, these systems lack optimizations tailored to visualizing event sequences and performing exploratory analysis tasks on large execution traces. In my preliminary work, I found that the Mosaic, VegaFusion, and the technique utilized in the HillView did not map well to event sequence data when tested using a database.

For visualizing distributed event traces, there are proprietary tools~\cite{davidson2023qualitative} that develop their solution over a database management system (DBMS). For large event data, DBMSs provide inherent overhead for data communication between the visualization interface and the database. Facebook's distributed tracing tool Canopy~\cite{kaldor2017canopy} converts tracing metrics to a tabular format and does queries over that table. This conversion to tabular format and fetching results from tabular data provides additional overhead. Google's Perfetto~\cite{Perfetto} uses the web browser's in-memory database, which provides good interactivity. However, this tool is not scalable and doesn't support visualizing traces that exceed the memory capacity of a single computer. I propose to utilize a data structure instead of a DBMS to enable execution trace visualization using distributed memory. Primarily, this will help avoid overhead related to transferring data from DBMSs.

In summary, prior work spans general surveys, task taxonomies, system prototypes, and data management frameworks. While existing studies highlight challenges of scale, usability, and interactivity, they either lack focus on Gantt charts, rely on lossy aggregation, or depend on DBMS-centric pipelines that introduce overhead. This dissertation builds on three complementary directions: (1) **Traveler** demonstrates navigation strategies for HPC traces, (2) the **Gantt chart taxonomy** formalizes task considerations unique to event sequence visualization, and (3) **ESeMan** proposes a scalable data management technique tailored for event sequence visualization. Together, these contributions ground this dissertation’s claim that useful event sequence visualization requires connecting visual design considerations with data management techniques.

---

Would you like me to **add explicit subsections** (e.g., *Surveys and Taxonomies*, *System Prototypes for Trace Visualization*, *Data Management Techniques*, etc.) to make this chapter more structured, or do you prefer it as one continuous narrative?

## User

insert some paragraph in between fetching from the Related Work section of the linked papers. Also add explicit subsection with titles.

## Assistant

Perfect — thanks for clarifying. I’ll restructure your Related Work chapter into explicit subsections and insert **paragraphs directly informed by your three papers** (Traveler, Taxonomy, and ESeMan) so they are naturally integrated rather than only mentioned once. I’ll also keep the flow aligned with your current style.  

Here’s the revised draft:

---

# Related Work

Event sequence visualization spans multiple research threads in visualization design, execution trace analysis, and data management. This chapter reviews related work across four key areas: (1) surveys and taxonomies, (2) visualization systems for execution traces, (3) data management strategies for scalability, and (4) general-purpose visualization languages and systems. The discussion situates this dissertation within prior contributions and highlights the gaps it addresses.

---

## Surveys and Taxonomies

Aigner et al.~\cite{aigner2023visualization} provide a general overview of time-oriented data visualization techniques. This dissertation primarily focuses in depth on Gantt charts specifically. Shurkhovetskyy et al.~\cite{shurkhovetskyy2018data} present a data abstraction for large time-series data but do not include temporal discrete event data. Guo et al.~\cite{guo2021survey} conduct a survey of visual analysis methods for event sequence data, with a primary focus on other types of visualizations for discrete-ordered time-series events, such as parallel timelines, that do not involve cross-track dependencies. Ezzati-Jivan et al.~\cite{ezzati2017multi} survey visualizing large-scale trace data, which is commonly done with Gantt charts. They broadly discuss trace data organization techniques for general visualization purposes, while our work focuses on visualizing event sequence data using Gantt charts only.

Peiris et al.~\cite{peiris2022data} develop a task taxonomy for timestamped events, but do not include durational events, event dependencies, and grouped events. Isaacs et al.~\cite{isaacs2014state} survey visualizations for performance analysis. While Gantt charts are prevalent and scale limitations are discussed, these tasks consider performance analysis in general, and avoided discussing specific data management strategies. Davidson et al.~\cite{davidson2023qualitative} present a qualitative interview study about visualizing distributed traces. Their work underscores the need for improved scale and usability of these visualizations. Tange et al.~\cite{tang2024comparative} conduct a comparative user study on Gantt, Extended Gantt, and Stringline Charts. In this work, the authors did not consider inter-dependent events.  

Building on these surveys, our literature-based taxonomy for Gantt charts~\cite{sayef2024taxonomy} systematizes tasks that are unique to Gantt-style representations. Unlike prior taxonomies focused on timestamped or discrete events, this taxonomy emphasizes durational events, dependencies, and grouping as first-class elements. It clarifies how these characteristics introduce distinctive challenges for scalability and interactivity, establishing Gantt charts as a specialized but under-theorized form of event sequence visualization.

---

## Visualization Systems for Execution Traces

Data scale has been a persistent issue in execution trace visualization. Besides responsiveness issues, the significant scale disparity between the overall trace length and individual events can make Gantt charts challenging to interpret, particularly when dependencies are involved. A resource-centric approach is presented in SyncTrace~\cite{Karran2013SyncTrace} where the timeline of one resource is shown in multiple levels of detail with the most zoomed in showing connections to other resources.  Ravel~\cite{isaacs2014combing} used an idealized unit time axis to show dependency patterns. However, this approach assumes a bulk synchronous paradigm that is not present in our data. Haugen et al.~\cite{haugen2015visualizing} show dependencies only for a selected interval. This dissertation considers both next-neighbor dependency and the entire chain of dependencies related to an event in Gantt charts.  

Traveler~\cite{sayef2022traveler} extends these approaches by introducing hierarchical navigation techniques for large-scale HPC traces. It demonstrates how multi-level aggregation, semantic zooming, and task-aware filtering enable analysts to move between overview and detail without overwhelming the interface. Traveler revealed that scale disparities and dependency chains could not be addressed solely by visualization design; instead, data management strategies had to be interwoven with interaction design. This insight directly motivates the dissertation’s central claim of treating design and data management as interdependent.

---

## Data Management Strategies for Scalability

To make the visualization scalable, techniques like sampling, parametric modeling, and binned aggregation techniques are utilized. The sampling and modeling technique is prone to lose details and statistical outliers. For binned aggregation, hexagonal binning~\cite{carr1987scatterplot} and pixel binning using summed-area-table~\cite{liu2013immens} methods are used. Alternating minimum and maximum values per bin are stored in M4 optimization~\cite{jugel2014m4} for line and area rasterization. These lossy techniques are highly useful when individual detail becomes insignificant, which is impractical for Gantt charts. Nanocubes~\cite{lins2013nanocubes} trade-off initial build time by storing specialized indexes for spatio-temporal queries. Multi-variate data-tiles are used in imMens~\cite{liu2013immens} and Falcon~\cite{moritz2019falcon}. ForeCache~\cite{battle2016dynamic} prefetch queries by modeling user behavior patterns. By compromising memory consumption, these methods improve visual interactivity in multi-scale zooming and panning.  

ESeMan~\cite{sayef2025eseman} contributes a complementary perspective by introducing specialized indexing and data structures designed explicitly for event sequence visualization. Unlike aggregation-heavy systems, ESeMan maintains event-level fidelity while supporting interactive queries over distributed memory. Its approach demonstrates that lossy summarization can be avoided if data management is directly coupled with visualization tasks. This design choice provides a scalable alternative to DBMS-centric methods and illustrates the benefits of tailoring data structures to event sequence workloads.

---

## Visualization Languages and General-Purpose Systems

Several domain-specific languages (DSLs) have been developed to capture both visual encodings and interactions~\cite{satyanarayan2016vega, satyanarayan2015reactive, stolte2002polaris}. Mcnutt~\cite{mcnutt2022no} conducts a survey of JSON-style DSLs across five different axes. These flexible DSLs have varying interactive performance~\cite{yang2022demonstration, battle2020database} because of the issue with communicating with the DBMSs. Battle et al.~\cite{battle2020structured} conduct a thorough literature review of data management techniques for visualization in general. This dissertation attempts to find visualization systems best suited to specific visualization languages and data management techniques for Gantt charts only.

General purpose interactive visualization systems—such as HoloViews~\cite{stevens2015holoviews}, Mosaic~\cite{heer2023mosaic}, VegaFusion~\cite{kruchten2022vegafusion}, HillView~\cite{budiu2019hillview}, Tableau~\cite{Tableau}, and Plotly-Dash~\cite{dabbas2021interactive}—are designed for plotting a broad range of chart types. However, these systems lack optimizations tailored to visualizing event sequences and performing exploratory analysis tasks on large execution traces. In my preliminary work, I found that the Mosaic, VegaFusion, and the technique utilized in the HillView did not map well to event sequence data when tested using a database.

For visualizing distributed event traces, there are proprietary tools~\cite{davidson2023qualitative} that develop their solution over a database management system (DBMS). For large event data, DBMSs provide inherent overhead for data communication between the visualization interface and the database. Facebook's distributed tracing tool Canopy~\cite{kaldor2017canopy} converts tracing metrics to a tabular format and does queries over that table. This conversion to tabular format and fetching results from tabular data provides additional overhead. Google's Perfetto~\cite{Perfetto} uses the web browser's in-memory database, which provides good interactivity. However, this tool is not scalable and doesn't support visualizing traces that exceed the memory capacity of a single computer. I propose to utilize a data structure instead of a DBMS to enable execution trace visualization using distributed memory. Primarily, this will help avoid overhead related to transferring data from DBMSs.

---

## Summary

Prior work has explored diverse avenues for event sequence visualization, including surveys, taxonomies, prototype systems, and data management frameworks. Yet, these efforts remain fragmented. Surveys and task taxonomies articulate challenges but do not prescribe data strategies; prototype systems demonstrate novel interactions but struggle to scale; and scalable data management techniques often sacrifice fidelity. This dissertation addresses these gaps by building on three complementary contributions: **Traveler**, which demonstrates navigation strategies for HPC execution traces; the **Gantt chart taxonomy**, which formalizes task considerations unique to event sequence visualization; and **ESeMan**, which proposes scalable, task-aware data management for event sequences. Together, these contributions ground the central claim that useful event sequence visualization requires connecting visual design considerations with data management techniques.

---

Do you want me to also **add inline comparisons** (e.g., how ESeMan differs from Nanocubes/imMens, or how Traveler extends SyncTrace/Ravel), or should I keep the insertions at a higher-level narrative like now?

## User

Check the following shorten it and mix with the prior sections.

"\subsection{Parallel timeline charts}
A parallel timeline chart is a visualization idiom representing multiple related sequences of events. One axis represents time while the other is used to represent track. Each event can be represented as a bar in its assigned track that spans its duration on the time axis. 
These charts are commonly used in domains such as software execution traces~\cite{isaacs2014state, ezzati2017multi}, user activity logs~\cite{wilson2003gantt}, manufacturing system monitoring~\cite{jo2014livegantt}, and medical workflows~\cite{antweiler2022uncovering}. 
Typically in these applications, events are defined their \textit{start time} and \textit{end time}. Events may have additional data in the form of attribute-value pairs. Typically, the multiple sequences are defined by partitioning the total set of events by one of these attributes, e.g., a computational resource in a parallel computing trace or a patient in a set of patient histories. We refer to the assigned sequence as a \textbf{track}, following the terminology of Sakin et al.~\cite{sakin2024gantttaxonomy}.

Depending on the time span and track span of the data, panning and zooming in the parallel timeline chart may be required to keep the events larger than a pixel in width or height. \autoref{fig:gantt_desc}  shows an example of a parallel timeline chart zoomed to show events in three tracks. Some bars are only partially shown at the given zoom level. 

There are several ways a parallel timeline chart may choose to render sub-pixel events---including drawing them as single pixel events, omitting them entirely, or aggregating them. Aggregating sub-pixel events is a form of event \texttt{summarization}~\cite{guo2021survey}. An \textbf{event summary} is a reduced representation of one or more event sequences to support the \texttt{summarization} analysis task.

Interactivity and aggregation for parallel timeline charts have been a long-standing problem. Davidson et al.~\cite{davidson2023qualitative} conducted an interview study on different distributed trace analysis tools, noting that maintaining data quality and obtaining various levels of aggregation results are one of the primary problems. Literature surveys in software visualization~\cite{isaacs2014state, ezzati2017multi} further highlight the importance of managing data on varying scales. Our data management solution attempts to address challenges in maintaining data quality while giving options for summarization at various scale levels.

\subsection{Databases in Event Sequence Visualization}
Database management systems (DBMS) for visualizing event sequence data have been explored in several works~\cite{bell2003paraprof, antweiler2022uncovering, sun2021daisen, battle2016dynamic, agarwal2013blinkdb, heer2023mosaic, antweiler2022uncovering}, but do not optimize for changing representations for summarization. Distributed databases have been used for handling large software performance data~\cite{moritz2015perfopticon, kaldor2017canopy, kruchten2022vegafusion, shen2023qevis}, including to handle streaming cases~\cite{kesavan2020visual, khan2023web}. Distributed databases are heavily dependent on fast network communication in a distributed environment, query optimization, distributed query execution, caching, and progressive rendering. These solutions are limited by the latency due to network communication, often resulting in total latencies over the recommended threshold for interactivity~\cite{kaldor2017canopy, kruchten2022vegafusion}. Furthermore, they also exhibit configuration challenges for users. We aim to provide a solution that provides latency within the interactivity threshold limit without the burden of network configuration for the visualization designers.

Battle et al.~\cite{battle2020database} presented a database benchmarking study focusing on real-time interactive queries of large data. Their results significantly highlight the limitations of different database solutions in maintaining interactivity with a threshold of 100ms. In the study, DuckDB was noted as one of the best-performing databases, which motivated us to use and compare DuckDB in our evaluation conditions.

A structured review of hybrid data management  solutions that combine data structures and DBMSs was presented by Battle et al.~\cite{battle2020structured}. By their categorization, our proposed data management solution would be considered an \texttt{Indexing Technique} because we use a KD-Tree for indexing and the Lightning Memory-Mapped Database Manager (LMDB)~\cite{lmdb} for its querying. The review also described Data Sketching~\cite{cormode2017data, budiu2015interacting} and statistical sub-sampling-based techniques~\cite{budiu2019hillview, de2010zinsight, drebes2014aftermath} to achieve fast query performance with guaranteed error bounds. Data sketching and statistical subsampling are practical for streaming data to provide summarization within controlled errors. However, the memory requirement for the indexed data using these approaches increases proportionally with the data size. Therefore, these approaches can fall short in scenarios for retrieving exact summaries during post-hoc analysis. We include comparisons to a representative subsampling approach in our evaluation.

\subsection{Summarization and Reduction for Charting}
Data summarization has been implemented in visualization grammars~\cite{satyanarayan2016vega, heer2023mosaic, mcnutt2022no} to reduce fetched data size by optimizing queries and caching prior query results on materialized views~\cite{battle2020structured}, which is a snapshot of the prior query results. Generally, after optimizing the query, a summarized version of the prior results is stored in the database-specific materialized views.
Storing materialized views requires additional memory on the visualization side. A visualization grammar for event sequences is absent in these works. Furthermore, grammar-based visualization tools~\cite{satyanarayan2016vega, heer2023mosaic} utilize M4 optimization~\cite{jugel2014m4} to retrieve the data, which is not optimized for event sequence data. 

Without using a database, linear data structures can be used to generate an aggregated summary, also trading off accuracy and speed. In data visualization, summed area tables~\cite{sakin2022traveler} and largest triangle three buckets (LTTB)~\cite{van2022plotly} have been used KD-box~\cite{zhao2021kd} and Kyrix-J~\cite{tao2020kyrix} use KD-Tree in summarizing time series data visualization. Our proposed solution applies KD-Trees for event sequence data.

Neural networks~\cite{yeshchenko2021visual, tao2022kyrix, krawczuk2021anomaly} and genetic algorithms~\cite{jo2014livegantt} have been used to generate event sequence summaries highlighting domain-specific  anomalies. Clustering solutions like model clustering~\cite{nesi2023summarizing}, clustering for large applications~\cite{isaacs2014combing}, and agglomerative clustering~\cite{pasupathi2021trend} have been used for trend analysis for time series data. While clustering approaches are generally time-consuming and sensitive to the distribution of the data, we implemented an agglomerative clustering approach as an option in our solution, comparing its results to our tree-based option.

\subsection{Commercial event sequence visualizations}
Several open-source tools offer event sequence analysis in various capacities. Google's Perfetto~\cite{Perfetto} trace analyzer uses the web browser's in-memory database. Rather than summarize sub-pixel events, it samples them, thus dropping data from the display. Our solution provides similar response times to Perfetto with a summarization approach. 

Grafana~\cite{grafana} provides a state timeline to visualize event sequence data. It sub-samples data through a pagination scheme. Drawing an overall overview or summary views on different scale levels is not possible in Grafana. Additionally, it has limited functionality to de-clutter event data with a high frequency of smaller events. In our proposed solution, we primarily focus on generating summaries at various granular levels without decreasing data accuracy.

Commercially available solutions~\cite{Tableau, Jaeger, Zipkin, AmazonXRay, Datadog, Lightstep, Flurry, NewRelic, Honeycomb, Elastic, powerbi} serve diverse market segments and specific user needs. All of these solutions require substantial infrastructure investments, proprietary cloud backends, and vendor lock-in that can limit accessibility and flexibility. These platforms, while powerful, create barriers to entry for researchers, small organizations, and developers who need precise control over their analysis workflows without the overhead of sophisticated storage backends or licensing costs. Our solution aims to remove the barriers by providing an open-source solution that delivers both accuracy and performance while remaining accessible to researchers, developers, and analysts."

## Assistant

Great — thanks for pasting the text. I see that it overlaps conceptually with sections you already have (parallel timeline/Gantt charts, DBMS vs. custom data structures, summarization approaches, and commercial tools). To avoid redundancy while still preserving the key insights, I’ll **shorten, condense, and merge** it into your existing structure.  

Here’s how I propose integrating it:  

---

# Related Work

Event sequence visualization spans multiple research threads in visualization design, execution trace analysis, and data management. This chapter reviews related work across four key areas: (1) surveys and taxonomies, (2) visualization systems for execution traces, (3) data management strategies for scalability, and (4) general-purpose visualization languages and systems. The discussion situates this dissertation within prior contributions and highlights the gaps it addresses.

---

## Surveys and Taxonomies

Aigner et al.~\cite{aigner2023visualization} provide a general overview of time-oriented data visualization techniques. This dissertation primarily focuses in depth on Gantt charts specifically. Shurkhovetskyy et al.~\cite{shurkhovetskyy2018data} present a data abstraction for large time-series data but do not include temporal discrete event data. Guo et al.~\cite{guo2021survey} conduct a survey of visual analysis methods for event sequence data, with a primary focus on visualizations such as parallel timelines. These idioms represent multiple related event sequences, partitioned into tracks (e.g., computational resources or patients), where events are drawn as bars spanning their duration. Such approaches are widely used in domains ranging from HPC trace analysis~\cite{isaacs2014state, ezzati2017multi} to medical workflows~\cite{antweiler2022uncovering}. Summarization methods (e.g., aggregating sub-pixel events) have been proposed to cope with scale~\cite{guo2021survey}, but these often trade off accuracy for responsiveness.  

Building on this body of work, our literature-based taxonomy for Gantt charts~\cite{sayef2024taxonomy} provides the first systematic categorization of visual tasks specifically associated with Gantt-style representations. Unlike prior taxonomies that emphasize timestamped or discrete events, this taxonomy highlights the unique challenges of durational events, interdependencies, and grouped tasks, establishing Gantt charts as a specialized space within event sequence visualization.

---

## Visualization Systems for Execution Traces

Data scale has been a persistent issue in execution trace visualization. Besides responsiveness issues, the significant scale disparity between the overall trace length and individual events can make Gantt charts challenging to interpret, particularly when dependencies are involved. A resource-centric approach is presented in SyncTrace~\cite{Karran2013SyncTrace}, where the timeline of one resource is shown in multiple levels of detail with the most zoomed-in view showing connections to other resources. Ravel~\cite{isaacs2014combing} used an idealized unit time axis to show dependency patterns, but this assumes a bulk synchronous paradigm not always present. Haugen et al.~\cite{haugen2015visualizing} show dependencies only for a selected interval.  

Traveler~\cite{sayef2022traveler} extends these approaches by introducing hierarchical navigation techniques for large-scale HPC traces. It demonstrates how multi-level aggregation, semantic zooming, and task-aware filtering enable analysts to move between overview and detail without overwhelming the interface. Traveler revealed that scale disparities and dependency chains could not be addressed solely by visualization design; instead, data management strategies had to be interwoven with interaction design. This insight directly motivates the dissertation’s central claim of treating design and data management as interdependent.

---

## Data Management Strategies for Scalability

To make visualization scalable, several summarization and reduction techniques have been explored. These include sampling, parametric modeling, and binning approaches such as hexagonal binning~\cite{carr1987scatterplot}, summed-area tables~\cite{liu2013immens}, and M4 optimizations for rasterization~\cite{jugel2014m4}. While powerful for statistical graphics, these lossy methods are less suitable for event sequence visualization where preserving detail is often critical. Summarization has also been incorporated into visualization grammars like Vega and Mosaic~\cite{satyanarayan2016vega, heer2023mosaic}, often through query optimization and materialized views~\cite{battle2020structured}, though these approaches increase memory overhead.  

Database management systems (DBMSs) have also been applied to event sequence visualization~\cite{battle2016dynamic, moritz2015perfopticon, kaldor2017canopy, kruchten2022vegafusion}. Distributed DBMSs support streaming and interactive queries~\cite{kesavan2020visual, khan2023web}, but interactivity is often limited by network latency and complex configuration~\cite{kaldor2017canopy, kruchten2022vegafusion}. DuckDB has been benchmarked as one of the most efficient solutions for interactive analytics~\cite{battle2020database}, but still inherits the communication overhead of a DBMS.  

ESeMan~\cite{sayef2025eseman} proposes an alternative by combining indexing structures and distributed memory management. Using KD-Trees for indexing and LMDB for storage, ESeMan avoids lossy subsampling while maintaining interactivity within the 100ms threshold. Compared with sketching~\cite{cormode2017data, budiu2015interacting} and clustering-based summarization~\cite{pasupathi2021trend, isaacs2014combing}, ESeMan prioritizes fidelity and scalability for post-hoc analysis. This design illustrates how coupling event-specific data structures with visualization tasks can overcome the shortcomings of generic DBMS pipelines.

---

## Visualization Languages and General-Purpose Systems

Several domain-specific languages (DSLs) have been developed to capture both visual encodings and interactions~\cite{satyanarayan2016vega, satyanarayan2015reactive, stolte2002polaris}. Mcnutt~\cite{mcnutt2022no} surveys JSON-style DSLs, highlighting performance trade-offs when interacting with databases. Battle et al.~\cite{battle2020structured} provide a structured review of hybrid solutions that mix DBMSs with indexing or sketching, underscoring the need for task-specific optimization.  

General-purpose interactive systems—such as HoloViews~\cite{stevens2015holoviews}, Mosaic~\cite{heer2023mosaic}, VegaFusion~\cite{kruchten2022vegafusion}, HillView~\cite{budiu2019hillview}, Tableau~\cite{Tableau}, and Plotly-Dash~\cite{dabbas2021interactive}—support a wide range of chart types but lack optimizations for event sequence data. Proprietary tools such as Canopy~\cite{kaldor2017canopy}, Perfetto~\cite{Perfetto}, and Grafana~\cite{grafana} provide partial solutions but rely on sampling, pagination, or in-memory DBMSs that sacrifice scalability or precision. Commercial platforms (e.g., Jaeger, Zipkin, Amazon X-Ray, Datadog, New Relic, and PowerBI) offer robust infrastructures but introduce vendor lock-in, heavy configuration, and costs that limit accessibility. In contrast, this dissertation aims to provide open, lightweight techniques that achieve both scalability and accuracy without the burden of proprietary infrastructure.

---

## Summary

Prior work has explored diverse avenues for event sequence visualization, including surveys, taxonomies, prototype systems, and data management frameworks. Yet, these efforts remain fragmented. Surveys and taxonomies articulate challenges but do not prescribe data strategies; prototype systems demonstrate novel interactions but struggle to scale; and scalable data management techniques often sacrifice fidelity. This dissertation addresses these gaps by building on three complementary contributions: **Traveler**, which demonstrates navigation strategies for HPC execution traces; the **Gantt chart taxonomy**, which formalizes task considerations unique to event sequence visualization; and **ESeMan**, which proposes scalable, task-aware data management for event sequences. Together, these contributions ground the central claim that useful event sequence visualization requires connecting visual design considerations with data management techniques.

---

👉 This way, the **parallel timeline**, **DBMS discussion**, **summarization/reduction techniques**, and **commercial systems** you pasted are **shortened and merged** into the relevant subsections, avoiding redundancy but keeping all key points.  

Do you want me to **add a figure reference** (like your `\autoref{fig:gantt_desc}`) in the merged version, or should we keep the Related Work text-only?

## User

modify the section structure to the one that I pasted in the previous prompt.

## Assistant

Got it — you’d like me to restructure your **Related Work** so that the subsections match the structure you pasted earlier:  

- Parallel timeline charts  
- Databases in Event Sequence Visualization  
- Summarization and Reduction for Charting  
- Commercial Event Sequence Visualizations  

I’ll merge your existing draft + my integrations (Traveler, Taxonomy, ESeMan) into this structure, trimming repetition but keeping coverage complete.  

Here’s the revised version:

---

# Related Work

Event sequence visualization spans multiple research threads in visualization design, execution trace analysis, and data management. This chapter reviews related work in four areas that frame this dissertation: parallel timeline charts, database-driven solutions, summarization and reduction techniques, and commercial visualization systems. The discussion highlights gaps that motivate the contributions of this dissertation.

---

## Parallel Timeline Charts

A parallel timeline chart represents multiple related event sequences across tracks, with time on one axis and tracks on the other. Events are typically encoded as bars spanning their duration, defined by start and end times. Tracks are commonly derived by partitioning the event set by an attribute such as computational resource, patient, or user~\cite{wilson2003gantt, jo2014livegantt, antweiler2022uncovering}. This idiom underlies Gantt charts, widely used in execution trace analysis~\cite{isaacs2014state, ezzati2017multi}, user activity logs, manufacturing, and medical workflows.  

While straightforward in principle, scaling parallel timeline charts is challenging. Zooming and panning are required to maintain visibility, and sub-pixel events must either be omitted, aggregated, or rendered in reduced form~\cite{guo2021survey}. Event summarization helps manage visual clutter but risks obscuring detail. Davidson et al.~\cite{davidson2023qualitative} emphasized through interviews that aggregation and fidelity remain persistent concerns in distributed trace tools.  

Our literature-based Gantt chart taxonomy~\cite{sakin2024gantttaxonomy} formalizes how tasks involving duration, dependencies, and grouping differ from timestamped events. Unlike prior taxonomies that treat events independently, it identifies gaps between visual tasks and data management strategies, establishing Gantt charts as a unique idiom within event sequence visualization.

---

## Databases in Event Sequence Visualization

Database management systems (DBMSs) have been widely used to support event sequence visualization~\cite{bell2003paraprof, sun2021daisen, battle2016dynamic, agarwal2013blinkdb, heer2023mosaic}. Distributed databases extend this approach for large-scale or streaming data~\cite{moritz2015perfopticon, kaldor2017canopy, kruchten2022vegafusion, shen2023qevis, kesavan2020visual, khan2023web}. While powerful, these systems depend heavily on fast network communication, distributed query execution, caching, and progressive rendering. Latencies frequently exceed the recommended 100ms threshold for interactivity~\cite{kaldor2017canopy, kruchten2022vegafusion}, and configuration overhead adds further barriers.  

Battle et al.~\cite{battle2020database} benchmarked databases for interactive visualization, noting DuckDB as a high-performing option. However, even efficient DBMSs incur overhead from query translation and data transfer. Battle et al.~\cite{battle2020structured} further classified hybrid solutions that combine DBMSs with indexing or sketching techniques.  

Traveler~\cite{sayef2022traveler}, while not DBMS-based, exemplifies the limitations of relying solely on query systems. It introduced multi-level navigation for HPC traces but showed that scalable exploration required tighter coupling between data handling and task design. Similarly, our ESeMan system~\cite{sayef2025eseman} takes an alternative approach: by combining KD-Tree indexing with LMDB for storage, it bypasses DBMS communication overhead, enabling scalable, interactive event sequence queries without complex distributed configuration.

---

## Summarization and Reduction for Charting

Data summarization techniques are frequently employed to improve interactivity. Approaches such as binning~\cite{carr1987scatterplot, liu2013immens}, M4 optimizations for rasterization~\cite{jugel2014m4}, and materialized views in visualization grammars~\cite{satyanarayan2016vega, heer2023mosaic, battle2020structured} reduce query sizes but often require additional memory and may discard fine-grained detail.  

Linear data structures like summed-area tables and sampling methods such as LTTB have been applied in visualization systems~\cite{van2022plotly, sakin2022traveler}. KD-Tree–based methods (e.g., Kyrix-J~\cite{tao2020kyrix}, KD-Box~\cite{zhao2021kd}) show promise for summarizing time-series visualization. Neural networks and clustering techniques~\cite{jo2014livegantt, nesi2023summarizing, pasupathi2021trend} provide domain-specific event summarization, though they are computationally intensive and sensitive to data distributions.  

ESeMan extends this landscape by applying KD-Trees to event sequence data, enabling summarization that maintains fidelity while supporting interactive retrieval. Compared with sketching~\cite{cormode2017data, budiu2015interacting} or clustering-based summarization, it prioritizes scalability and accuracy in post-hoc trace analysis.  

---

## Commercial Event Sequence Visualizations

Commercial and open-source systems support event sequence analysis in varying capacities. Google’s Perfetto~\cite{Perfetto} relies on in-memory browser databases and sampling, offering high interactivity but limited scalability. Grafana~\cite{grafana} provides state timelines with pagination-based subsampling, but cannot generate multi-scale overview summaries. Proprietary platforms such as Jaeger, Zipkin, Amazon X-Ray, Datadog, New Relic, and PowerBI serve diverse markets but require substantial infrastructure investments, cloud dependencies, and vendor lock-in, restricting accessibility for researchers and small organizations.  

In contrast, ESeMan aims to provide an open-source, lightweight solution that delivers accuracy and scalability without relying on proprietary infrastructure. By coupling data structures with visualization tasks, it avoids the trade-offs inherent in DBMS-driven or sampling-based commercial systems.

---

## Summary

Parallel timeline charts, database-backed solutions, summarization strategies, and commercial tools each address parts of the event sequence visualization problem. However, they either compromise fidelity, incur interactivity overhead, or require infrastructure that limits accessibility. This dissertation addresses these gaps through three complementary contributions: **Traveler**, which demonstrates task-driven navigation for HPC traces; the **Gantt chart taxonomy**, which formalizes unique visualization tasks for Gantt-style charts; and **ESeMan**, which proposes a scalable, fidelity-preserving data management technique. Together, these contributions demonstrate that effective event sequence visualization requires treating visual design and data management as interdependent concerns.

---

Would you like me to also **reorder inside subsections** (e.g., move Traveler into “Parallel timeline charts” since it’s about traces, or keep it under DBMS/data management)? Right now I placed **Traveler in DBMS section** to highlight it as a contrast to query-based systems, but we could place it in “Parallel timeline charts” instead to emphasize its design side.

## User

This chapter needs a intorductory background paragraph which states the terms it will use and then separates the different parts of the discussion (you can refer to the introduction chapter for the terms). Also, you need to make it clear that this isn't about ALL of event sequence visualization. for example, there are many types of data and vis and techniques that I specifically do not address because I am focused on the more specific part. Point the reader to additional resources for people who are interested in other aspects not covered in this dissertation.

## Assistant

Perfect — thanks for clarifying. Right now your **Related Work** chapter dives straight into prior work, but you need an **introductory background paragraph** that:  

1. Establishes the terminology you’ll use (event sequence, parallel timeline charts/Gantt charts, tracks, events, summarization, etc.).  
2. States the scope — i.e., this dissertation does **not** cover all of event sequence visualization, but focuses specifically on Gantt/parallel timeline–style charts with durational events and dependencies.  
3. Points to broader resources for readers interested in the bigger picture (e.g., surveys by Aigner, Guo, Isaacs, etc.).  

Here’s a polished LaTeX-style intro paragraph you can put before the subsections:  

---

## Related Work

Event sequence visualization encompasses a wide range of data types, idioms, and analytical goals, but this dissertation focuses on a more specific subset. In this work, I primarily use the terminology introduced in the introduction chapter: **events** are defined by start and end times, optionally annotated with attributes; events are grouped into **tracks** that partition the dataset by a relevant attribute (such as computational resource or patient); and collections of tracks are represented in **parallel timeline charts**, a class of visualizations that includes Gantt charts. My emphasis is on techniques that support **durational events, dependencies, and grouped structures** in parallel timeline charts, as these are central to execution trace visualization and similar domains.  

It is important to note that this dissertation does not attempt to review *all* of event sequence visualization. Many alternative idioms—such as sequence diagrams, process mining visualizations, Sankey-style flows, or temporal network layouts—are outside its scope. Likewise, specialized techniques for categorical event logs, symbolic sequence mining, or anomaly detection are not addressed here. Readers interested in these broader aspects of event sequence visualization are directed to surveys by Aigner et al.~\cite{aigner2023visualization}, Guo et al.~\cite{guo2021survey}, and Isaacs et al.~\cite{isaacs2014state}, which provide comprehensive coverage of time-oriented and event-sequence visualization more generally.  

The following subsections review the related work most relevant to this dissertation’s contributions, organized into four themes:  
(1) **Parallel timeline charts**, which establish the idiom and its usage across domains;  
(2) **Databases in event sequence visualization**, which discusses database-centric approaches and their limitations;  
(3) **Summarization and reduction for charting**, which reviews data reduction and indexing strategies; and  
(4) **Commercial event sequence visualizations**, which highlights industry tools and their trade-offs.  

---

👉 This sets up the scope, terms, and structure clearly.  

Do you want me to also **add a small connecting sentence at the start of each subsection** (e.g., “This subsection reviews how parallel timeline charts have been applied across domains, and the challenges they face when scaled”)? That would make transitions smoother.

## User

Check the following text "A parallel timeline chart represents multiple related event sequences across tracks, with time on one axis and tracks on the other. Events are typically encoded as bars spanning their duration, defined by start and end times. Tracks are commonly derived by partitioning the event set by an attribute such as computational resource, patient, or user~\cite{wilson2003gantt,jo2014livegantt,antweiler2022uncovering}. This idiom underlies Gantt charts, widely used in execution trace analysis~\cite{isaacs2014state,ezzati2017multi}, user activity logs, manufacturing, and medical workflows.

While straightforward in principle, scaling parallel timeline charts is challenging. Zooming and panning are required to maintain visibility, and sub-pixel events must either be omitted, aggregated, or rendered in reduced form~\cite{guo2021survey}. Event summarization helps manage visual clutter but risks obscuring detail. Davidson et al.~\cite{davidson2023qualitative} showed that aggregation and accuracy remain persistent concerns in distributed trace tools.

Commercial and open-source systems support event sequence analysis in varying capacities. Google’s Perfetto~\cite{Perfetto} relies on in-memory browser databases and sampling, offering high interactivity but limited scalability. Grafana~\cite{grafana} provides state timelines with pagination-based subsampling, but cannot generate multi-scale overview summaries. Proprietary platforms~\cite{Tableau,Jaeger,Zipkin,AmazonXRay,Datadog,Lightstep,Flurry,NewRelic,Honeycomb,Elastic,powerbi} serve diverse markets but require substantial infrastructure investments, cloud dependencies, and vendor lock-in, restricting accessibility for researchers and small organizations.

Data scale has been a persistent issue in execution trace visualization. Besides responsiveness issues, the significant scale disparity between the overall trace length and individual events can make Gantt charts challenging to interpret, particularly when dependencies are involved. A resource-centric approach is presented in SyncTrace~\cite{Karran2013SyncTrace} where the timeline of one resource is shown in multiple levels of detail with the most zoomed in showing connections to other resources. Ravel~\cite{isaacs2014combing} used an idealized unit time axis to show dependency patterns. However, this approach assumes a bulk synchronous paradigm that is not present in our data. Haugen et al.~\cite{haugen2015visualizing} show dependencies only for a selected interval. This dissertation considers both next-neighbor dependency and the entire chain of dependencies related to an event in Gantt charts

Our literature-based Gantt chart taxonomy~\cite{sakin2024gantttaxonomy} formalizes how tasks involving duration, dependencies, and grouping differ from timestamped events. Unlike prior taxonomies that treat events independently, it identifies gaps between visual tasks and data management strategies, establishing Gantt charts and parallel timeline charts as a useful medium for event sequence visualization.

Additionally, our work on the event sequence manager aims to provide an open-source, lightweight solution that delivers accuracy and scalability without relying on proprietary infrastructure. By coupling data structures with visualization tasks, it avoids the trade-offs inherent in DBMS-driven or sampling-based commercial systems."
suggest a descriptive section header for this.

## Assistant

Given the content you shared, the section integrates:  

- **Definition/description** of parallel timeline charts (and their use in Gantt charts)  
- **Challenges of scaling** (zooming, summarization, dependencies)  
- **Survey of systems** (Perfetto, Grafana, commercial tools)  
- **Research contributions** (taxonomy + ESeMan as open-source scalable alternatives)  

A good section header should capture both the **idiom** (parallel timeline/Gantt charts) and the **focus on challenges & systems**. Here are some suggestions:  

- **“Parallel Timeline Charts: Applications, Challenges, and Systems”**  
- **“Gantt and Parallel Timeline Charts for Event Sequence Visualization”**  
- **“Scalability Challenges in Parallel Timeline Charts”**  
- **“Parallel Timeline Charts and Their Role in Event Sequence Visualization”**  
- **“From Parallel Timeline Idioms to Scalable Event Sequence Systems”**  

👉 If you want a **neutral academic style**, I’d recommend:  
**“Parallel Timeline Charts: Visualization Challenges and Systems”**  

Would you like me to also **split this into two subsections** (e.g., one on “Definition and Challenges” and another on “Systems and Solutions”), or do you prefer it as a single compact section with a descriptive header?

## User

Now suggest a descrptive section heading for the following "Database management systems (DBMSs) have been widely used to support event sequence visualization~\cite{bell2003paraprof,sun2021daisen,battle2016dynamic,agarwal2013blinkdb,heer2023mosaic}. Distributed databases extend this approach for large-scale or streaming data~\cite{moritz2015perfopticon,kaldor2017canopy,kruchten2022vegafusion,shen2023qevis,kesavan2020visual,khan2023web}. While powerful, these systems depend heavily on fast network communication, distributed query execution, caching, and progressive rendering. Latencies frequently exceed the recommended 100ms threshold for interactivity~\cite{kaldor2017canopy,kruchten2022vegafusion}, and configuration overhead adds further barriers.

Battle et al.~\cite{battle2020database} benchmarked databases for interactive visualization, noting DuckDB as a high-performing option. However, even efficient DBMSs incur overhead from query translation and data transfer. Battle et al.~\cite{battle2020structured} further classified hybrid solutions that combine DBMSs with indexing or sketching techniques.

Traveler~\cite{sakin2022traveler} exemplifies the limitations of relying solely on query systems. It introduced multi-level navigation for HPC traces but showed that scalable exploration required tighter coupling between data handling and task design. Similarly, our ESeMan system~\cite{sakin2025managingdatascalableinteractive} takes an alternative approach: by combining KD-Tree indexing with LMDB~\cite{lmdb} for storage, it bypasses DBMS communication overhead, enabling scalable, interactive event sequence queries without complex distributed configuration."

## Assistant

This section is centered on:  

- Use of **DBMSs and distributed DBMSs** in event sequence visualization  
- Their **latency and configuration limitations**  
- Benchmarks and hybrid solutions (DuckDB, indexing/sketching)  
- Contrast with **Traveler** (design-driven) and **ESeMan** (data-structure-driven alternative)  

A strong descriptive heading should reflect both **DBMS approaches** and their **limitations/alternatives**. Here are some good candidates:  

- **“Database-Centric Approaches to Event Sequence Visualization”**  
- **“DBMS Solutions and Their Limitations for Interactive Visualization”**  
- **“Database Management Systems in Event Sequence Visualization”**  
- **“From DBMS Pipelines to Task-Aware Data Management”**  
- **“Limitations of DBMS Approaches and Alternatives for Event Sequence Data”**  

👉 If you want concise but descriptive, I’d recommend:  
**“Database-Centric Approaches and Their Limitations”**  

Would you like me to phrase it so that it **mirrors the earlier “Parallel Timeline Charts: Visualization Challenges and Systems” heading** (for structural consistency)? For example:  
**“Database-Centric Systems: Opportunities and Limitations”**

## User

suggest smae for the following "Data summarization techniques are frequently employed to improve interactivity. Approaches such as binning~\cite{carr1987scatterplot,liu2013immens}, M4 optimizations for rasterization~\cite{jugel2014m4}, and materialized views in visualization grammars~\cite{satyanarayan2016vega,heer2023mosaic,battle2020structured} reduce query sizes but often require additional memory and may discard fine-grained detail.

Linear data structures like summed-area tables and sampling methods such as LTTB have been applied in visualization systems~\cite{van2022plotly,sakin2022traveler}. KD-Tree–based methods (e.g., Kyrix-J~\cite{tao2020kyrix}, KD-Box~\cite{zhao2021kd}) show promise for summarizing time-series visualization. Neural networks and clustering techniques~\cite{jo2014livegantt,nesi2023summarizing,pasupathi2021trend} provide domain-specific event summarization, though they are computationally intensive and sensitive to data distributions.

Nanocubes~\cite{lins2013nanocubes} trade off initial build time by storing specialized indexes for spatio-temporal queries. Multi-variate data-tiles~\cite{moritz2019falcon} are used to prefetch queries by modeling user behavior patterns. By compromising memory consumption, these methods improve visual interactivity in multi-scale zooming and panning."

## Assistant

This section is all about **summarization and reduction techniques** for making large-scale event sequence visualizations interactive. It surveys binning, rasterization, materialized views, linear data structures, KD-Trees, clustering, neural nets, and specialized indexing approaches (Nanocubes, Falcon).  

Here are some descriptive section heading suggestions:  

- **“Summarization and Reduction Techniques for Interactive Visualization”**  
- **“Data Summarization Strategies for Event Sequence Visualization”**  
- **“Aggregation, Sampling, and Indexing Approaches”**  
- **“Techniques for Reducing Data Scale in Visualization”**  
- **“Summarization Methods: Trade-offs Between Interactivity and Fidelity”**  

👉 To keep it consistent with your other section headings (like *“Parallel Timeline Charts: Visualization Challenges and Systems”* and *“Database-Centric Approaches and Their Limitations”*), I’d suggest:  
**“Summarization Techniques: Approaches and Trade-offs”**  

Do you want me to also **weave in a sentence linking this to ESeMan** (e.g., “Unlike these summarization-heavy approaches, ESeMan emphasizes fidelity-preserving indexing”), so the heading and section both clearly connect to your contribution?

## User

"However, existing solutions in the literature compromise visual accuracy, incur interactivity overhead, or require infrastructure that limits accessibility."

Give me alternate word for accessiblity. this means the solution is propietery and has vendor-lock in so not everyone has access to the full features of these solutions. Accessibilty does not mean it provides access for disabled persons.

## Assistant

Got it — in this context, *accessibility* is about **being available/open for broad use**, not about disability access. Since you mean **restricted by proprietary infrastructure or vendor lock-in**, here are some alternatives:  

- **“availability”** – emphasizes whether users can obtain and use it.  
- **“openness”** – emphasizes whether it’s open-source/freely usable.  
- **“adoptability”** – emphasizes whether organizations can adopt it without barriers.  
- **“affordability”** – if the barrier is cost/licensing.  
- **“access”** – a simpler alternative.  
- **“usability to broader audiences”** – if you want to stress practical use restrictions.  
- **“barriers to adoption”** – a more academic phrasing.  

👉 For your sentence, you could say:  

- *“…require infrastructure that limits **availability**.”*  
- *“…require infrastructure that restricts **openness**.”*  
- *“…require infrastructure that creates **barriers to adoption**.”*  

Would you like me to suggest one that keeps the tone consistent with your dissertation writing (formal/academic), or a more neutral/general one?

## User

give me the full sentence with academic tone. also mean that its not available for all people or small organizations.

## Assistant

Here are some polished alternatives in full sentence form, keeping an academic tone and clearly pointing to **vendor lock-in and limited availability for broader audiences**:  

1. *“However, existing solutions in the literature compromise visual accuracy, incur interactivity overhead, or require proprietary infrastructure that restricts availability to a narrow set of users and organizations.”*  

2. *“However, existing solutions in the literature compromise visual accuracy, incur interactivity overhead, or depend on proprietary infrastructure that creates barriers to adoption by smaller organizations or individual researchers.”*  

3. *“However, existing solutions in the literature compromise visual accuracy, incur interactivity overhead, or rely on vendor-specific infrastructure that limits openness and availability beyond enterprise users.”*  

👉 If you want the most **academic and precise** phrasing, I’d recommend option 2.  

Do you want me to also adapt this phrasing for your **chapter summaries**, so the same idea is consistently expressed across Related Work, Contributions, and Discussion?

## User

check the section with titled "From Parallel Timeline Charts to Scalable Event Sequence Visualization". Suggest a modification for the Paragraph starting with "Data Scale has been ..."

## Assistant

Great — thanks for pointing me to the section. The paragraph starting *“Data scale has been a persistent issue in execution trace visualization…”* currently reads a bit long and repeats the idea of scale challenges multiple times. It could be made sharper by:  

- Opening with a **clearer topic sentence** about scale disparity and its effect on visualization.  
- Avoiding repetition of “persistent issue” and “challenging to interpret.”  
- Tightening the description of SyncTrace, Ravel, and Haugen so they flow as a comparative set.  
- Ending with a smooth transition to *your dissertation’s focus* on dependencies.  

Here’s a suggested revised version (academic tone, concise but clear):  

---

**Revised Paragraph:**  
*Scalability poses a fundamental challenge for execution trace visualization, as the disparity between the overall trace length and the fine granularity of individual events often overwhelms parallel timeline charts. This imbalance not only affects responsiveness but also complicates interpretation, particularly when dependencies between events are involved. Several systems have proposed partial solutions: SyncTrace~\cite{Karran2013SyncTrace} introduced a resource-centric view with multiple levels of detail; Ravel~\cite{isaacs2014combing} employed an idealized unit time axis to reveal dependency patterns, though it assumes a bulk synchronous model; and Haugen et al.~\cite{haugen2015visualizing} displayed dependencies only within a selected interval. In contrast, this dissertation addresses both immediate neighbor dependencies and entire dependency chains in Gantt charts, enabling more comprehensive analysis of large-scale event sequences.*  

---

👉 This keeps all the same references and contributions but avoids redundancy, making it more direct.  

Would you like me to also **suggest a figure cross-reference** (e.g., “as illustrated in \autoref{fig:dependency_example}”) here, so the reader can see how your approach differs from SyncTrace and Ravel?
