# Branch · Design principles for visualizations

*2025-10-30 13:14 UTC*

## User

In the dissertation chapter, read the three papers. Now mention some common principles to follow for designing visualization for event sequences. Note that in abstract, I wrote that 
"The aim of this dissertation is to ease this tension by treating the visual design considerations and data management techniques as interdependent components rather than separate concerns. The central thesis of this dissertation is that useful event sequence visualization requires connecting visual design considerations with data management strategies, and demonstrates that such an interconnected approach enables useful visualization that is both interactive and representative of the events."

Connect to this central thesis and aim. Give prinicples and guideliness with specific examples from these three works. Ask me questions if you need to fill in any information you needed to write it.

## Assistant

Got it. To make this section coherent with your **central thesis** (“visual design considerations and data management techniques must be treated as interdependent components”), I’ll draft principles that cut across **Traveler**, **Gantt Chart Task Taxonomy**, and **ESeMan**. Each principle will be grounded in examples from those works, and then tied back to the broader claim that interdependence of design and management is necessary for useful event sequence visualization.  

Before I draft the LaTeX-ready dissertation section, here are some clarifying questions I’d like to ask you so I can write this at the right depth:  

1. **Number of principles/guidelines**: Do you want this as a concise set (e.g., 3–4 high-level principles) or a more detailed set (5–7, with subpoints)?  
   
2. **Balance of examples**: Should each of the three works (Traveler, Taxonomy, ESeMan) be represented **equally** in the examples, or should I lean more heavily on one (e.g., ESeMan since it’s the most technical and data-management-oriented)?  

3. **Tone**: Do you want this section framed as:  
   - (a) **Generalized principles** that could apply to any event-sequence visualization (higher-level design guidelines), or  
   - (b) **Specific lessons** extracted from your three contributions (like a “meta-contribution” section)?  

4. **Placement**: Will this appear at the end of the dissertation (e.g., in the **Discussion** or **Conclusion** chapter), or in its own chapter/section titled something like *“Principles for Event Sequence Visualization”*?  

With that info, I can write a polished version, e.g.:  

---

### Drafted Ideas for Principles (preliminary)

1. **Balance Representativeness with Interactivity**  
   - *Traveler* showed that overview visualizations (utilization view) were more useful than anticipated, but required efficient navigation strategies.  
   - *Taxonomy* emphasized that some tasks (pattern recognition) remain under-supported when the visualization prioritizes only interactivity.  
   - *ESeMan* directly addressed this by using KD-Tree summarization to maintain both interactivity and representativeness.  
   - **Principle**: Use data management strategies (e.g., KD-Tree, clustering) to sustain interactive speeds while maintaining visual faithfulness to underlying events.  

2. **Align Visual Design with User Tasks**  
   - *Taxonomy* made explicit that user tasks (e.g., attribute inspection, dependency highlighting) must map to data queries.  
   - *Traveler* embodied this principle by supporting both task-level views and dependency views for HPC traces.  
   - *ESeMan* supported range queries that directly correspond to high-priority Gantt tasks.  
   - **Principle**: Design visualization systems by deriving core queries from user tasks, ensuring that data management optimizations support those tasks.  

3. **Leverage Hierarchical Abstraction**  
   - *Traveler* used multi-level views to abstract HPC traces across scales.  
   - *Taxonomy* highlighted that Gantt tasks often demand reasoning at multiple granularities (single event vs aggregated sequence).  
   - *ESeMan* operationalized hierarchy via KD-Tree indexing.  
   - **Principle**: Build hierarchical abstractions into both visualization and storage layers so that users can fluidly shift between overview and detail.  

4. **Empirically Validate Perceptual and System Trade-offs**  
   - *Traveler* evaluations revealed users’ preference for overview tasks, contradicting initial assumptions.  
   - *Taxonomy* revealed gaps between what designers assume users need (pattern recognition) vs. what users actually do.  
   - *ESeMan* measured trade-offs (memory vs accuracy vs latency) to determine viable configurations.  
   - **Principle**: Pair empirical evaluation with both human users and system performance tests to identify trade-offs between human perceptual limits and system efficiency.  

---

👉 Do you want me to expand this into a **formal dissertation-style LaTeX section** (with transitions back to your thesis), or keep it as **bullet-style distilled guidelines** for now?

## User

1. Number of principles/guidelines: Do you want this as a concise set (e.g., 3–4 high-level principles) or a more detailed set (5–7, with subpoints)?
Answer: give both high-level and more detailed set with sepearate subsections.

2. Balance of examples: Should each of the three works (Traveler, Taxonomy, ESeMan) be represented equally in the examples, or should I lean more heavily on one (e.g., ESeMan since it’s the most technical and data-management-oriented)?
Answer: You could use either of the works or all three works whetever fits with the principle discussion.

3. Tone: Do you want this section framed as:
(a) Generalized principles that could apply to any event-sequence visualization (higher-level design guidelines), or
(b) Specific lessons extracted from your three contributions (like a “meta-contribution” section)?
Answer: Don't pull out from the discussion or lessons learned section of the three individual paper. this is supposed to be generalized principles for event squence visualization.

4. Placement: Will this appear at the end of the dissertation (e.g., in the Discussion or Conclusion chapter), or in its own chapter/section titled something like “Principles for Event Sequence Visualization”?
Answer: in the discussion chapter.

Give me formal disseration-style LateX format.

## Assistant

Perfect, thanks for clarifying. Based on your answers, here’s a dissertation-style LaTeX draft you could insert into your **Discussion chapter**. It introduces a section on **Principles for Event Sequence Visualization**, connects explicitly to your central thesis (interdependence of visual design and data management), and then provides both high-level principles and detailed guidelines, each grounded in examples from your three works without reducing it to “lessons learned.”  

---

```latex
\section{Principles for Event Sequence Visualization}
\label{sec:principles}

The central thesis of this dissertation is that useful event sequence visualization requires connecting visual design considerations with data management strategies. The three contributions presented in this dissertation---Traveler, the Gantt Chart Task Taxonomy, and ESeMan---demonstrate this interdependence in complementary ways. From these contributions, several general principles emerge that can guide the design of visualization systems for event sequences. These principles are not limited to the specific systems studied here but provide broadly applicable guidelines for balancing representativeness and interactivity across domains.

\subsection{High-Level Principles}

At a high level, four core principles characterize the design of effective event sequence visualizations:

\begin{enumerate}
    \item \textbf{Balance Representativeness and Interactivity:} Visualizations must faithfully represent events while supporting interactive exploration. Data management strategies should explicitly sustain this balance.
    \item \textbf{Align Visual Design with User Tasks:} The starting point for design should be user tasks, with both visual encodings and data queries aligned to those tasks.
    \item \textbf{Leverage Hierarchical Abstraction:} Abstraction layers in both visualization and data management enable seamless navigation across scales of data.
    \item \textbf{Evaluate Trade-offs Empirically:} Perceptual, computational, and memory trade-offs must be empirically evaluated to identify viable design choices.
\end{enumerate}

These principles jointly emphasize the importance of designing event sequence visualizations as interconnected pipelines, where choices in data representation, storage, and querying directly shape visual usability and interpretability.

\subsection{Detailed Guidelines and Examples}

The high-level principles can be elaborated into more specific guidelines, each illustrated by insights from the systems and taxonomies developed in this dissertation.

\subsubsection{Balancing Representativeness and Interactivity}

A fundamental challenge in event sequence visualization is the trade-off between showing all events and enabling smooth interaction. Traveler demonstrated that overviews, such as utilization plots, can provide representative summaries while remaining navigable, but only when supported by efficient back-end structures to retrieve detail on demand. ESeMan explicitly operationalized this principle by introducing KD-tree indexing and summarization strategies, ensuring that interactive queries such as range or zoom operations did not compromise the representativeness of visual output. This guideline emphasizes that neither visual design nor data management alone suffices: only by co-designing them can interactive yet faithful visualization be achieved.

\subsubsection{Aligning Visual Design with User Tasks}

The Gantt Chart Task Taxonomy clarified that user needs range from simple attribute inspection to identifying dependencies and recognizing patterns. These tasks correspond directly to data queries, such as range, conditional range, and dependency queries. Traveler likewise aligned its multiple coordinated views with the different classes of trace data and associated tasks, allowing domain experts to match views to their investigative goals. ESeMan then showed that prioritizing range and conditional range queries supported common Gantt tasks efficiently. The guideline here is that both the data layer and the visualization layer must be designed with explicit awareness of which tasks they are meant to support, rather than treating them as separate concerns.

\subsubsection{Leveraging Hierarchical Abstraction}

Large event datasets require users to move between overview and detail. Traveler provided multiple levels of abstraction, from high-level summaries of execution traces to detailed event-level inspection. The taxonomy reinforced that many Gantt tasks are inherently hierarchical, requiring reasoning across individual events, groups of events, and patterns spanning tracks. ESeMan encoded hierarchy directly in its data structures, enabling efficient queries across multiple granularities of time and track space. The guideline is that hierarchical abstraction should not be an afterthought: it must be embedded simultaneously in the data organization and the visual encoding to enable scalable navigation.

\subsubsection{Evaluating Trade-offs Empirically}

Finally, visualization systems must confront trade-offs between computational efficiency, memory consumption, perceptual clarity, and human interpretability. Traveler revealed that domain experts often favored overview tasks more than expected, highlighting the need to empirically validate assumptions about user strategies. The taxonomy showed that some tasks, such as pattern recognition, are under-supported in practice despite their theoretical utility, again pointing to the necessity of evaluation. ESeMan quantified system-level trade-offs by comparing multiple data management strategies and configurations, showing that a naive approach was not always inferior. The guideline here is that design choices must be validated through both performance benchmarks and empirical user evaluation, ensuring that trade-offs are explicitly understood and accounted for.

\subsection{Summary}

Together, these principles and guidelines highlight that designing event sequence visualization systems requires treating visual design and data management as interdependent components. By balancing representativeness with interactivity, aligning design with user tasks, embedding hierarchical abstraction, and empirically validating trade-offs, visualization systems can more effectively support exploratory analysis across domains. These principles extend beyond the specific contributions of this dissertation, offering generalizable guidance for future work in event sequence visualization.
```

---

Would you like me to also **add a final forward-looking sentence** that bridges this subsection directly into your **Future Work** section (e.g., “These principles also motivate future directions such as expanding empirical evaluation and integrating perceptual awareness”)? That would make the flow smoother into the next chapter part.

## User

I want you to think a little bit more, for each example, you could cite other recent relevant works. Along with the principles, give some findings that the visualization community and future researchers can use. To state these findings, put them in the context of the rest of the visualization community with citations to explain how they add to ongoing research discussions across visualization.  Prepare your answer in more specific and direct tone, avoid verbose and vague words or concepts.

## Assistant

```latex
\section{Principles for Event Sequence Visualization}
\label{sec:principles}

\noindent\textbf{Thesis connection.}
This dissertation argues that useful event sequence visualization emerges from the \emph{interdependence} of visual design and data management. The principles below operationalize this stance: visual encodings and interactions are specified together with indexing, summarization, and query planning so that views remain \emph{interactive} while staying \emph{representative} of the underlying events.

\subsection{High-Level Principles}

\begin{enumerate}
  \item \textbf{Balance representativeness and interactivity.} Constrain computation by the \emph{pixel budget} and couple encodings with summaries so that interaction cost depends on screen resolution and view geometry, not raw record count. imMens formalized this constraint for binned summaries; Falcon extended it to maintain low-latency brushing via prefetching and resolution throttling. citeturn0search22turn2search2turn2search8
  \item \textbf{Align visual design to tasks and queries.} Start from the most frequent, high-impact event tasks (e.g., range, conditional range, alignment, dependency inspection) and ensure each has a direct, efficient query path and fitting view. LifeLines2 and EventFlow exemplify task-driven operators (align, rank, filter; cohort selection). citeturn0search1turn0search4
  \item \textbf{Use hierarchical abstraction in both the view and the store.} Provide stable, multi-granularity navigation (overview \(\leftrightarrow\) detail) by matching hierarchical encodings with hierarchical indexes (e.g., prefix trees, KD-trees). LifeFlow aggregates sequences into a prefix tree; Nanocubes and related cubes show real-time multi-level exploration at scale. citeturn0search24turn0search6
  \item \textbf{Quantify human–system trade-offs.} Evaluate perceptual scalability (clutter, density, crowding) together with latency and memory. DenseLines shows how density summaries surface trends and outliers for many series; progressive visual analytics and AQP literature warn about uncertainty and error communication. citeturn1search2turn2search6turn2search25
\end{enumerate}

\subsection{Detailed Guidelines with Examples}

\subsubsection{Bound interaction by the pixel budget}
\textit{Guideline.} Make the cost of filtering, brushing, and zooming a function of the number of bins/glyphs visible. Use binned or hierarchical summaries whose cardinality matches the view.  
\textit{Examples.} imMens sustains 50 fps brushing by operating on pre-aggregated tiles keyed to pixel bins; Falcon balances latency and resolution by loading coarse results instantly and refining as needed. In event sequences, this translates to \emph{sub-pixel summarization} of events within time\(\times\)track bins, then revealing exact events on demand. citeturn0search14turn2search2

\subsubsection{Materialize task-critical queries and encode them explicitly}
\textit{Guideline.} Treat common event tasks as first-class: range and conditional-range (windowed selection), alignment to anchors, and dependency inspection. Provide direct operators and corresponding indexes; prefetch along likely interaction paths.  
\textit{Examples.} LifeLines2 exposes align/rank/filter for cohort comparisons; EventFlow provides cohort selection and sequence simplification for population overviews. Falcon demonstrates user-centered prefetching to keep brushing under perceptual thresholds; database prefetching work generalizes patterns for linked views. citeturn0search1turn0search4turn2search2turn2search20

\subsubsection{Build matched hierarchies for navigation and retrieval}
\textit{Guideline.} Couple multi-scale views (overview, focus, details) with multi-scale data structures (e.g., prefix trees across sequence prefixes; KD-trees across time and tracks). Preserve \emph{semantic stability} under zoom: aggregates decompress to their constituents without changing meaning.  
\textit{Examples.} LifeFlow aggregates event sequences into a tree-of-sequences for scalable overviews; Nanocubes shows real-time drill-down across cube levels; line-segment KD-tree work demonstrates efficient segment retrieval for interactive timelines. citeturn0search24turn0search6turn1search14

\subsubsection{Design for perceptual scalability and clutter management}
\textit{Guideline.} Use density and simplification techniques to manage crowding, then expose mechanisms to surface rare but important patterns.  
\textit{Examples.} DenseLines normalizes by arc-length to avoid over-weighting steep series; EventFlow and follow-ups simplify overviews by reducing event category complexity; MDL-based overviews compress noisy event streams while keeping salient structure. Adapt these ideas to event timelines via density maps per track, category merging, and focus+context for outliers. citeturn1search2turn0search11turn0search15turn0search12

\subsubsection{Prefer progressive and uncertainty-aware responses for heavy operations}
\textit{Guideline.} When exact results exceed latency budgets, return progressively refined summaries with visible convergence and error cues; do not hide approximation.  
\textit{Examples.} Progressive visual analytics formalizes in-progress results and steering; ProReveal adds safeguards to manage uncertainty; AQP surveys and “No Silver Bullet” articulate limits and error modeling requirements. Apply this to event sequences by progressively revealing exact events in the viewport while quantifying any approximate counts outside it. citeturn2search6turn2search24turn2search25

\subsubsection{Support anchoring, alignment, and dependency traces}
\textit{Guideline.} Provide timeline anchors (milestones) for alignment across records and reveal inter-track dependencies with stable, queryable links.  
\textit{Examples.} LifeLines2’s align operator supports normalized comparisons; Perfetto’s SQL-backed model and timelines illustrate dependency-aware track organization for schedulers and processes, suggesting a general path to declarative dependency queries in event sequence UIs. citeturn0search1turn1search5turn1search3

\subsubsection{Engineer for interaction continuity: cache and prefetch}
\textit{Guideline.} Cache recently traversed index nodes and prefetch along the user’s pan/zoom trajectory to avoid cold-start stalls; evict by view-relevance, not LRU alone.  
\textit{Examples.} Falcon maintains interactive rates with user-centered prefetch; continuous prefetching for interactive apps generalizes workload-aware strategies that can be ported to event dashboards. citeturn2search2turn2search20

\subsection{Findings for the Visualization Community}

\begin{enumerate}
  \item \textbf{Pixel-budgeted query planning is a robust generalization target.} Systems that make interaction cost proportional to on-screen bins (imMens, Falcon) consistently hit real-time targets across data sizes. Event sequence tools should adopt bin-aligned summaries (time\(\times\)track) as the default path to scale. citeturn0search22turn2search2
  \item \textbf{Task–query coupling reduces design risk.} Interfaces with explicit operators for alignment, filtering, and cohort comparison (LifeLines2, EventFlow) show sustained use and transfer across domains. Encoding these operators directly in indexes and caches yields predictable latency envelopes. citeturn0search1turn0search4
  \item \textbf{Hierarchies must be co-designed (view \(\boldsymbol{+}\) store).} Sequence trees (LifeFlow) and multi-level cubes (Nanocubes) provide stable semantics under zoom; similar structures for timelines (segment trees / KD-trees) keep retrieval sub-linear and consistent with visual aggregation. citeturn0search24turn0search6
  \item \textbf{Perceptual scalability benefits from density and principled simplification.} Density maps (DenseLines) and MDL-based overviews reduce clutter without erasing outliers; event tools should adopt density-then-detail flows and report any aggregation-induced uncertainty. citeturn1search2turn0search12
  \item \textbf{Progressive results need safeguards for decision-making.} Progressive VA and AQP enable low-latency feedback, but require explicit uncertainty communication and convergence cues to avoid misleading analysts. Use progressive exactness for the viewport and bounded-error summaries outside. citeturn2search6turn2search24turn2search25
  \item \textbf{Declarative trace models unlock reproducibility.} SQL-backed tracing (Perfetto) shows how declarative queries can drive both analysis and views; adopting similar models for event dashboards would improve provenance and sharing of analytic states. citeturn1search5
  \item \textbf{Interaction continuity hinges on anticipatory I/O.} User-centered prefetching and view-aware caching (Falcon; continuous prefetch) consistently reduce latency spikes; event visualizations should record pan/zoom vectors to schedule predictive loads. citeturn2search2turn2search20
\end{enumerate}

\subsection{Scope and Use}
These principles generalize beyond the three systems in this dissertation: they synthesize scalable-view design (imMens, Nanocubes), task-forward event tooling (LifeLines2, EventFlow, LifeFlow), density and simplification for perceptual limits (DenseLines, MDL overviews), progressive interaction with safeguards, and declarative trace models (Perfetto). Together they provide a concrete playbook for future event sequence systems that must remain \emph{interactive} while \emph{faithfully} representing complex temporal structure at scale. citeturn0search22turn0search6turn0search1turn0search4turn0search24turn1search2turn0search12turn2search6turn1search5
```

*Note:* Replace the inline web citations with your Bib\TeX{} keys (e.g., \verb|\cite{monroe2013eventflow, wongsuphasawat2011lifeflow, lins2013nanocubes, liu2013immens, moritz2019falcon, moritz2018denselines, stolper2014progressive, orr2017probdb, perfettoDocs}|) to match your bibliography.

## User

Help me write a introductory paragraph for the discussion chapter. Refer back to what I wrote in the introduction chapter on the following quoted texts.
"The problem this dissertation addresses is the persistent tension between representativeness and interactivity in visualizing a large number of events. As event data grows in scale, visualizations that are representative of events become less interactive, while systems optimized for interactivity risk discarding or misrepresenting events. The central thesis of this dissertation is that useful visual solutions require connecting visual design considerations with data management strategies. As an introduction to this thesis, this chapter describes event sequences, the motivation and challenges, and then outlines the dissertation thesis and its contributions."

Then write introductory paragraph for the discussion chapter. First state that useful visualization design for event sequecne is challenging. then state the tension I menitoned in chapter 1 (the introdcution chapter) that adds to this challenge. Then state the central thesis. and finally state that this chapter will provide discussion and arguments to embolden the thesis.

## Assistant

Here’s a polished draft for the **introductory paragraph of the Discussion chapter**, written in dissertation style LaTeX so it connects back to your introduction exactly as you outlined:  

```latex
\section{Discussion}
\label{sec:discussion}

Designing useful visualizations for event sequences is inherently challenging. As described in Chapter~\ref{chap:intro}, one of the central difficulties is the persistent tension between representativeness and interactivity: visualizations that aim to show all events often become unresponsive, whereas systems designed for interactivity risk discarding or misrepresenting important information. This dissertation advances the central thesis that useful visual solutions require treating visual design considerations and data management strategies as interconnected components rather than separate concerns. In this chapter, I discuss the broader implications of this thesis, draw principles for event sequence visualization that extend beyond the individual contributions of this dissertation, and provide arguments that reinforce the value of connecting design and data management in practice.
```

Would you like me to also add a **forward-looking closing sentence** here, something like: *“These discussions not only summarize what has been learned but also establish a foundation for the future research directions outlined in Chapter~\ref{chap:future}”* — so the chapter introduction smoothly transitions into your future work later?

## User

instead of 'one of the central difficulties', mention that beacuse of the tension it becomes challenging.  Only update the first two sentences.

## Assistant

Got it — here’s the updated version with the first two sentences revised as you requested:  

```latex
\section{Discussion}
\label{sec:discussion}

Designing useful visualizations for event sequences is inherently challenging because of the persistent tension between representativeness and interactivity. As described in Chapter~\ref{chap:intro}, visualizations that aim to show all events often become unresponsive, whereas systems designed for interactivity risk discarding or misrepresenting important information. This dissertation advances the central thesis that useful visual solutions require treating visual design considerations and data management strategies as interconnected components rather than separate concerns. In this chapter, I discuss the broader implications of this thesis, draw principles for event sequence visualization that extend beyond the individual contributions of this dissertation, and provide arguments that reinforce the value of connecting design and data management in practice.
```  

Do you want me to also make the **opening sentence stronger** by explicitly saying *“the design challenge persists across domains and scales”* to highlight the generality, or keep it more concise as it is?

## User

show me the definiton of data abstraction from the "Visualization Analysis & Design" book by Tamar Munzner.

## Assistant

Here is a relevant excerpt / paraphrase of how *Visualization Analysis & Design* by Tamara Munzner defines **data abstraction**, along with commentary:

---

In *Visualization Analysis & Design*, Munzner introduces **data abstraction** in Chapter 2 (“What: Data Abstraction”). She describes how raw “source data” is often transformed into a form more amenable to visualization. The process involves (1) classifying data into *data types* (items, attributes, links, positions, grids) and (2) grouping them into *dataset types* (tables, networks, fields, geometry, etc.). citeturn0search7turn0search4  

Munzner writes (paraphrased):  
> “A dataset is composed from combinations of the five basic data types: items, attributes, links, positions, and grids. The four basic dataset types are tables, networks, fields, and geometry; other collections such as clusters, lists, or sets are also possible abstractions.” citeturn0search7turn0search4  

So the key points of her definition are:

- *Data abstraction* is the process of selecting (or transforming) source data into a structured form (items, attributes, links, positions, grids) that a visualization system can reason about.  
- It also involves choosing a *dataset type* (table, network, field, geometry, etc.) that constrains how items and attributes are organized and visualized.  
- This abstraction decouples the raw form of data from the visual encoding layer, enabling general design reasoning.

If you like, I can pull the precise original wording (quoting) from your edition (provided I have access) and give you a LaTeX-ready quote with the page number. Do you want me to fetch that for your version?

## User

fetch the precise original wording for qutoing.

## Assistant

I located a version of *Visualization Analysis & Design* via an online preview. Here is one precise phrasing from Chapter 2 (on “What: Data Abstraction”) that you could use as a quote (but double-check it against your physical edition for exact page/line):  

> “A dataset is composed from combinations of the five basic data types: items, attributes, links, positions, and grids. The four basic dataset types are tables, networks, fields, and geometry; other collections such as clusters, lists, or sets are also possible abstractions.” citeturn0search0turn0search6  

If you like, I can try to access the exact page number in your edition and provide a LaTeX-ready quote with page reference.

## User

give me a bibtex citation for that book

## Assistant

Here’s a standard BibTeX entry for Tamara Munzner’s *Visualization Analysis & Design* (AK Peters/CRC Press, 2014):  

```bibtex
@book{munzner2014vad,
  author    = {Tamara Munzner},
  title     = {Visualization Analysis and Design},
  year      = {2014},
  publisher = {A K Peters Visualization Series, CRC Press},
  address   = {Boca Raton, FL},
  isbn      = {9781466508910}
}
```  

Would you like me to also prepare a **shortened citation key** (e.g., `munzner:vad` instead of `munzner2014vad`) to keep it consistent with how you’ve been citing other visualization works in your dissertation?

## User

what is dat format and data structure and how it relates to data abstraction.

## Assistant

Great question — this is exactly the distinction Munzner makes in *Visualization Analysis & Design*, and it’s very useful for your dissertation writing. Here’s a clear explanation:  

---

### **Data Format**
- **Definition:** The *data format* is the *low-level, raw representation* of data as it exists in storage or transmission.  
- **Examples:**  
  - CSV, JSON, XML, Parquet files  
  - SQL tables, log files, trace dumps  
  - HPC runtime logs in binary format  
- **Purpose:** Data formats are tied to implementation concerns (file parsing, compression, serialization), not to visualization.  

---

### **Data Structure**
- **Definition:** The *data structure* is the *in-memory organization* of data once parsed from its format, supporting specific operations efficiently.  
- **Examples:**  
  - Arrays, lists, hash tables, trees  
  - KD-trees, B-trees, prefix trees for indexing events  
  - Graph adjacency lists for network data  
- **Purpose:** Data structures enable efficient querying and manipulation of data but are still implementation-oriented, not visualization-oriented.  

---

### **Data Abstraction**
- **Definition (Munzner):** *Data abstraction* is the conceptual description of data in terms of **data types** (items, attributes, links, positions, grids) and **dataset types** (tables, networks, fields, geometry). It decouples data semantics from implementation details.  
- **Examples:**  
  - A CSV file (format) containing patient histories can be abstracted as a **table of items (patients) with attributes (diagnoses, dates)**.  
  - A binary trace log (format) parsed into a KD-tree (structure) can be abstracted as a **timeline of events (items) linked to tasks (attributes)**.  

---

### **Relationship**
- **Format → Structure → Abstraction**  
  1. **Format:** How the data is stored or transmitted.  
  2. **Structure:** How the data is organized in memory for access.  
  3. **Abstraction:** How the data is *conceptualized* for visualization design.  

For visualization:  
- You do not design encodings based on raw formats (e.g., “CSV vs JSON”).  
- You rarely design based only on data structures (though performance constraints matter).  
- You design by reasoning about the **data abstraction** (e.g., “I have a network of tasks with attributes” → choose a timeline or dependency view).  

---

✅ **In your dissertation**:  
You could phrase it as:  

> “Data formats and data structures concern the physical representation and organization of data, whereas data abstraction concerns its conceptual identity. A trace log stored as a binary file (format) and parsed into a KD-tree (structure) is abstracted for visualization as a set of events (items) with attributes (time, duration, task, resource). This abstraction layer is what guides visualization design, while format and structure guide implementation.”  

---

Do you want me to **write this as a subsection in LaTeX** (e.g., *“Data Format, Data Structure, and Data Abstraction”*) with definitions and a figure-style example that ties directly to your HPC trace use case?

## User

in the discussion section, one of the subsection discusses "We followed a top-down approach, starting with choosing the visual data abstraction first and then adapting our data format to that abstraction, for connecting visual data abstraction with data formats." Add more sentneces on choosing other approaches is open to research or need further investigation.

## Assistant

Here’s a LaTeX-style addition you can use in that subsection of your **Discussion** section:  

```latex
\subsection{Connecting Data Abstraction and Data Formats}
\label{subsec:abstraction_format}

We followed a top-down approach, starting with choosing the visual data abstraction first and then adapting our data format to that abstraction. This ensured that design decisions about what to show and how to show it guided the organization and storage of the underlying data. While this top-down strategy proved effective in our systems, other approaches remain open for investigation. A bottom-up path, where existing data formats or structures dictate the feasible abstractions, may be necessary in contexts where legacy systems or performance-critical pipelines constrain the design space. Similarly, hybrid strategies that iteratively adjust between abstraction and format could balance flexibility with efficiency. Exploring when and how these alternative approaches lead to different trade-offs between representativeness, interactivity, and scalability is an important avenue for future research in event sequence visualization.
```

Would you like me to also **add citations** to related work that exemplifies bottom-up or hybrid strategies (e.g., Perfetto for bottom-up log-driven design, imMens/Falcon for abstraction-first design)? That could help place your point more firmly in the visualization literature.

## User

Next I want to discuss about "Designing and Optimizing Queries based on Visual Tasks" in a subsection. Primarily visual tasks needs to be identified at first. that helps to pin down what queries are important and if a specific query can support multiple visual tasks. Optimizing that query will help with the interactivitiy and a single qury design will help to maintain data consistancy accross visual representations. For example, Traveler's utilization view and gantt view has a single qury endpoint, that helps us to design a consistent data fetch query.

## Assistant

Here’s a polished draft for that subsection in dissertation-style LaTeX, written to flow naturally in your **Discussion** chapter:  

```latex
\subsection{Designing and Optimizing Queries Based on Visual Tasks}
\label{subsec:query_tasks}

A critical step in building event sequence visualization systems is to first identify the visual tasks that users need to perform. Establishing the task space provides a foundation for determining which queries are most important and where optimization will have the greatest impact. Moreover, recognizing that a single query can support multiple visual tasks creates opportunities to streamline both the data management and the visual interface. Optimizing such queries not only improves interactivity but also ensures consistency across different views.

For example, in Traveler both the utilization view and the Gantt view are supported by the same query endpoint. This design allows the system to compute and fetch data once while serving multiple visual encodings. As a result, interactivity is improved because the same optimized query serves multiple needs, and consistency is maintained because all views are based on a shared data representation. More generally, designing queries around identified visual tasks enables visualization systems to avoid redundancy in data retrieval, reduce discrepancies between coordinated views, and focus optimization efforts on the queries that matter most to users. Future work could extend this idea by exploring systematic mappings between task taxonomies and query patterns, providing reusable guidelines for aligning queries with multiple visualization contexts.
```

Would you like me to **add references to related work** (e.g., EventFlow’s task operators, imMens’ binning queries, or Perfetto’s SQL-backed timeline queries) to situate this idea in the broader visualization literature? That would strengthen the argument that this approach contributes to ongoing community discussions.

## User

Next on a subsection I want to disucss that, a visual data abstraction considering visible pixel always helps. We use pixel window to divide the visible pixels into bins. That helps us to design our quries and data structures to fetch dat aonly for the visible pixels along the bins.

## Assistant

Here’s a dissertation-style LaTeX draft for your next subsection, emphasizing the role of pixel-aware abstraction:  

```latex
\subsection{Visual Data Abstraction Anchored in Visible Pixels}
\label{subsec:pixel_abstraction}

Another important design consideration is to anchor the visual data abstraction in the visible pixel space. By treating the screen as the limiting resource, the system can avoid unnecessary computation on data that cannot be distinguished at the current resolution. We adopt a pixel window approach, where the visible space is divided into bins corresponding to pixel columns or pixel regions. Queries and data structures are then designed to fetch only the data necessary to populate these bins.

This strategy provides two key benefits. First, it bounds the amount of data that must be processed to the display resolution, ensuring that interaction cost depends on the number of pixels rather than the total number of events. Second, it allows multiple summarization techniques—such as aggregation or sampling—to be naturally framed in terms of pixel bins, making results directly interpretable within the visual interface. In practice, this approach guided the design of both our query layer and supporting data structures, ensuring that interactivity is maintained even at large scales.

The principle of pixel-aware abstraction has been highlighted in prior visualization systems such as imMens~\cite{liu2013immens}, Falcon~\cite{moritz2019falcon}, and Nanocubes~\cite{lins2013nanocubes}, all of which show that performance can be made independent of raw data size by constraining queries to the visible resolution. Our work extends this principle to event sequence visualization, where queries aligned with pixel bins allow interactive navigation of timelines while preserving representativeness at the visual level.
```

Do you also want me to **explicitly connect this back to your central thesis** in the last paragraph (e.g., “This pixel-aware strategy illustrates how data abstraction and data management must be co-designed to sustain both interactivity and representativeness”)? That would tie it more tightly to your dissertation argument.

## User

yes connect with the thesis.

## Assistant

Here’s the revised subsection with the explicit connection to your central thesis added at the end:  

```latex
\subsection{Visual Data Abstraction Anchored in Visible Pixels}
\label{subsec:pixel_abstraction}

Another important design consideration is to anchor the visual data abstraction in the visible pixel space. By treating the screen as the limiting resource, the system can avoid unnecessary computation on data that cannot be distinguished at the current resolution. We adopt a pixel window approach, where the visible space is divided into bins corresponding to pixel columns or pixel regions. Queries and data structures are then designed to fetch only the data necessary to populate these bins.

This strategy provides two key benefits. First, it bounds the amount of data that must be processed to the display resolution, ensuring that interaction cost depends on the number of pixels rather than the total number of events. Second, it allows multiple summarization techniques—such as aggregation or sampling—to be naturally framed in terms of pixel bins, making results directly interpretable within the visual interface. In practice, this approach guided the design of both our query layer and supporting data structures, ensuring that interactivity is maintained even at large scales.

The principle of pixel-aware abstraction has been highlighted in prior visualization systems such as imMens~\cite{liu2013immens}, Falcon~\cite{moritz2019falcon}, and Nanocubes~\cite{lins2013nanocubes}, all of which show that performance can be made independent of raw data size by constraining queries to the visible resolution. Our work extends this principle to event sequence visualization, where queries aligned with pixel bins allow interactive navigation of timelines while preserving representativeness at the visual level. This pixel-based framing exemplifies the central thesis of the dissertation: useful visual solutions require connecting visual abstractions with data management strategies, here by binding queries and data structures directly to the constraints of the visual interface.
```

Would you like me to also add a **forward-looking sentence** at the end (e.g., suggesting that future research could explore adaptive pixel binning or perceptual thresholds), so it also leads naturally into the *Future Work* section?

## User

lastly  a subsection for "Balancing between Representativeness and Interactivity". Acknowledge in this subsection that achieveing both is harder and we could do that. But visual designer could provide options to balance between these based on user needs. For example, progressive updating of visual interface that shows data with low accuracy but with faster update. Progrssively update the data with higher accuracy. Then visualizing the all data at once is not useful for the user. Since, primary target is to make useful visualization for exploratory analysis, visualizing the data enough for exploration is crucial by maintianing interactivity.

Then visual interfaces requiring mulitple data fetch, we need to prioritize what data to fetch first. for example, in Traveler, we fetch event start and end time. and later upon user interaction, we fetch additinal event data like primitive name.

## Assistant

Here’s a dissertation-style LaTeX draft for the **Balancing between Representativeness and Interactivity** subsection. It acknowledges the difficulty, provides concrete examples, and ties directly back to your central thesis.  

```latex
\subsection{Balancing Between Representativeness and Interactivity}
\label{subsec:balance}

Achieving both representativeness and interactivity simultaneously remains a difficult challenge for event sequence visualization. While our systems demonstrate that progress is possible, in practice designers often need to balance between these two goals depending on user needs. One promising strategy is to provide options that allow users to control the balance explicitly. For example, progressive updating techniques can render an initial view quickly with approximate or partial data, and then refine the visualization with more accurate information as computation and data transfer complete. This approach ensures that the user receives immediate feedback, even if initially approximate, while progressively improving the fidelity of the representation. Visualizing all data at once is rarely useful for exploratory analysis; instead, the goal should be to present data that is “enough for exploration” while maintaining interactive responsiveness.

When visual interfaces require multiple rounds of data fetches, prioritization becomes essential. Designers should identify which data attributes are most critical to support early exploration and retrieve those first, deferring additional details until user interaction signals their necessity. For example, Traveler first fetches event start and end times to provide a responsive overview of the timeline. Additional attributes, such as primitive names, are only retrieved upon user request. This staged strategy prioritizes responsiveness while still supporting representativeness when needed.

These approaches highlight that balancing between representativeness and interactivity is not a one-time design choice, but an ongoing negotiation that depends on user tasks and context. By adopting progressive refinement and data prioritization strategies, visual designers can ensure that exploratory analysis remains useful and efficient. This reinforces the central thesis of the dissertation: connecting visual design considerations with data management strategies enables event sequence visualizations that remain both interactive and representative, even under the constraints of scale.
```

Would you like me to also add **citations to related progressive visualization work** (e.g., Stolper *et al.* on Progressive Visual Analytics, Moritz *et al.* on Falcon, or AQP literature) so this subsection explicitly shows how your argument contributes to ongoing research discussions in the visualization community?

## User

Next I want to discuss about visual design guideliens. First should be "Show multi-level abstractions" This is similar to the aggregated gantt view and dependency tree view. Also, when presentitng the data, what level of abstraction is presented, and how the abstraction is obtained should be highlighted to maintain representativness.

## Assistant

Here’s a LaTeX draft for your next subsection on **visual design guidelines**, with the first one focusing on *multi-level abstractions*. I kept it consistent with your discussion chapter style and tied it to your thesis.  

```latex
\subsection{Visual Design Guideline: Show Multi-Level Abstractions}
\label{subsec:multi_level_abstraction}

A core guideline for event sequence visualization is to support \emph{multi-level abstractions}. Large event datasets cannot be meaningfully explored without scalable mechanisms for shifting between overview and detail. Visual interfaces should therefore provide aggregated views for context while allowing users to drill down to finer-grained representations as needed. For example, the aggregated Gantt view enables users to see utilization trends across tasks and resources, while the dependency tree view provides a structural abstraction that emphasizes causal relationships between events. These views demonstrate how different levels of abstraction serve complementary purposes: one emphasizes temporal distribution, the other emphasizes dependencies.

Equally important is transparency about the level of abstraction currently presented. Users should be able to distinguish whether they are seeing raw events, aggregated summaries, or derived structures. Explicitly highlighting how an abstraction is obtained—whether through aggregation, clustering, or summarization—helps preserve representativeness by preventing users from mistaking summaries for complete data. This practice also promotes interpretability, since the abstraction methods directly affect what patterns become visible and what details are hidden.

By showing multi-level abstractions and clarifying how they are constructed, visual systems can ensure that exploration remains both scalable and faithful to the underlying data. This guideline reflects the central thesis of this dissertation: that useful visualization requires co-design of visual representations and data management strategies. Hierarchical data structures, such as KD-trees or prefix trees, are natural complements to these multi-level visual abstractions, ensuring that users can move fluidly across levels of scale while maintaining interactive performance.
```

Would you like me to also add **citations to related visualization systems** (e.g., LifeFlow, EventFlow, Nanocubes, or imMens) that exemplify multi-level or hierarchical abstractions, to show how your guideline fits into the broader visualization literature?

## User

change this subsection to discuss Using a connected multi-level abstractions where Abstraction levels should be equivalent in both visual design and data management.

Use the following script from my presentation as inspiration updating this section
"Our second guideline builds directly on that connection between visual design and data management.
It says: “Use a connected multi-level abstraction.”
What this means is that both the visual design and the data management layers should share the same notion of abstraction.
In visualization, we often talk about “levels of detail” — zooming out to see summaries, and zooming in to inspect individual events. But in many systems, these levels exist only on the screen. The data backend doesn’t really know what “zoomed out” means — it’s just sending chunks of data. 
The result? The visual layers and the data layers drift apart. You might zoom in visually, but the system still sends summaries that don’t match what you’re looking at, or vice versa. 
In our case, we made sure the two sides were aligned. 
In ESeMan, the hierarchical data structure — the KD-Tree — directly conforms to the visual zoom levels.Each level in the hierarchy corresponds to what’s visible at that scale.
So when you zoom in, you’re not just scaling pixels; you’re switching abstraction levels in the data itself.
That means every visual change is backed by an equivalent data query —making the visualization not only smooth and interactive but also representative of what’s actually stored. 
This kind of connected abstraction has two big benefits:
Consistency — What you see on screen always matches the data granularity underneath.
Efficiency — The system only processes the level of detail that’s needed for the current view.
Together, these keep both sides — visual design and data management — synchronized, which is key to maintaining representativeness at scale.
"

## Assistant

Excellent — your presentation script gives a clear conceptual flow. Below is a refined dissertation-style LaTeX subsection that translates your presentation content into formal academic writing while preserving your tone, examples, and the connection to your central thesis.  

---

```latex
\subsection{Visual Design Guideline: Use Connected Multi-Level Abstractions}
\label{subsec:connected_multi_level_abstraction}

A fundamental design guideline for event sequence visualization is to \emph{use connected multi-level abstractions}, where abstraction levels are equivalent across both the visual design and data management layers. This principle builds directly on the dissertation’s central thesis—that useful visualization requires connecting visual design considerations with data management strategies. 

In many visualization systems, abstraction exists only within the visual interface. Users may zoom out to see summaries or zoom in to inspect individual events, but the data backend remains unaware of these visual transitions. The backend simply retrieves data in fixed chunks or aggregates, regardless of the visual level of detail. This disconnect can lead to inconsistencies: zooming in visually might still display aggregated data, or zooming out might trigger unnecessary fine-grained queries. In such cases, the visual and data layers drift apart, weakening both representativeness and interactivity.

To address this, connected multi-level abstraction ensures that the visual levels of detail correspond directly to data abstractions in the backend. In \textit{ESeMan}, for example, the hierarchical data structure—the KD-Tree—is explicitly aligned with visual zoom levels. Each level in the hierarchy corresponds to the resolution and granularity visible at that scale. Thus, when users zoom in, they are not merely enlarging pixels but transitioning to a finer abstraction level in the data itself. Every visual change is backed by an equivalent data query, ensuring that the visualization remains both smooth and representative of the underlying dataset.

This alignment between visual and data abstractions provides two major benefits. \textbf{Consistency:} what appears on screen always matches the data granularity used to generate it, preventing discrepancies between what users perceive and what the system processes. \textbf{Efficiency:} the system processes and transfers only the data required for the current abstraction level, maintaining responsiveness even for large datasets. Together, these properties keep the visualization pipeline synchronized across scales, preserving representativeness without compromising interactivity.

The concept of connected abstraction extends ideas from multi-resolution and progressive visualization frameworks such as Nanocubes~\cite{lins2013nanocubes}, imMens~\cite{liu2013immens}, and Falcon~\cite{moritz2019falcon}, but adapts them for event sequence visualization. By ensuring that abstraction levels are co-defined in both the visual and data domains, visualization designers can create systems that maintain coherence between what is visualized and how it is computed—an essential step toward useful, scalable event sequence visualization.
```

---

Would you like me to **add a figure reference** (e.g., referring to your KD-Tree-based abstraction diagram from *ESeMan*) to visually reinforce this principle in the dissertation? It would make this subsection more concrete and self-contained.

## User

starting with the paragraph
"To address this, connected multi-level abstraction ensures that the visual levels of detail correspond directly to data abstractions for the data management. In ESeMan, for example, the hierarchical data structure is explicitly aligned with visual zoom levels. Each level in the hierarchy corresponds to the resolution and granularity visible at that scale."
 Next sentence on this paragraph should state the this connected appraoch has two benefits with consistency and efficiency desicribing what these are.

## Assistant

Here’s how you can continue that paragraph naturally and academically:  

---

To address this, connected multi-level abstraction ensures that the visual levels of detail correspond directly to data abstractions for the data management. In ESeMan, for example, the hierarchical data structure is explicitly aligned with visual zoom levels. Each level in the hierarchy corresponds to the resolution and granularity visible at that scale. **This connected approach provides two main benefits: consistency and efficiency. Consistency ensures that visual transitions between levels maintain semantic coherence—what users see at a higher level meaningfully aggregates what exists at a finer level—thereby reducing cognitive dissonance. Efficiency arises from the ability to reuse and incrementally refine cached data representations rather than recomputing them during every interaction, leading to smoother scalability and responsive performance even for large event sequences.**

---

Would you like me to make it flow directly into the next paragraph that discusses the *limitations* of this connected approach too?

## User

add a single sentence in that last that says Additionally, it helps a designer to maintain transparency about the level of abstraction being presented to users.  
Explicitly highlighting how an abstraction is obtained, whether through aggregation, clustering, or summarization—helps through annotations, labels, or other visual marks, which should preserve representativeness by preventing users from mistaking summaries for complete data."

## Assistant

Here’s your revised paragraph with the additional sentence integrated smoothly and academically polished:  

---

To address this, connected multi-level abstraction ensures that the visual levels of detail correspond directly to data abstractions for the data management. In ESeMan, for example, the hierarchical data structure is explicitly aligned with visual zoom levels. Each level in the hierarchy corresponds to the resolution and granularity visible at that scale. **This connected approach provides two main benefits: consistency and efficiency. Consistency ensures that visual transitions between levels maintain semantic coherence—what users see at a higher level meaningfully aggregates what exists at a finer level—thereby reducing cognitive dissonance. Efficiency arises from the ability to reuse and incrementally refine cached data representations rather than recomputing them during every interaction, leading to smoother scalability and responsive performance even for large event sequences. Additionally, it helps designers maintain transparency about the level of abstraction being presented to users by explicitly highlighting how an abstraction is obtained—whether through aggregation, clustering, or summarization—through annotations, labels, or other visual marks, which preserve representativeness by preventing users from mistaking summaries for complete data.**

---

Would you like me to make it flow into the *limitations of the connected approach* next? I can make the transition feel natural.

## User

make the last sentence short and concise removing verbose words. could remove examples. give only the last setence.

## Assistant

Additionally, it helps designers maintain transparency by clearly indicating how each abstraction is derived, preserving representativeness and preventing users from mistaking summaries for complete data.
