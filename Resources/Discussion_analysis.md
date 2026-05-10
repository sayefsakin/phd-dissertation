# 1. Foundational papers with **general visualization design guidelines**

These are the classic theoretical works that propose **general principles of visual encoding and visualization design**. They are not specific to event sequences but are often the conceptual foundation.

### 1.1 Munzner — Visualization Design and Theory
- entity["book","Visualization Analysis and Design"] – entity["people","Tamara Munzner"] (2014)

**Key theoretical ideas**

Framework:
- **Why → What → How** model
- Task abstraction
- Data abstraction

Guidelines:
- Match **visual encoding to data type**
- Choose **perceptually effective channels**
- Design for **user tasks**
- Use **overview → zoom → filter → details-on-demand**

These principles guide **most visualization design decisions today.**

---

### 1.2 Mackinlay — Expressiveness and Effectiveness
- entity["academic_paper","Automating the Design of Graphical Presentations of Relational Information"] – entity["people","Jock Mackinlay"] (1986)

Two core principles:

**Expressiveness**
- Visualization should show **all and only the data**

**Effectiveness**
- Choose visual encodings based on perceptual ranking
  - position > length > angle > area > color

These rules influenced tools like Tableau.

---

### 1.3 Cleveland & McGill — Perceptual ranking
- entity["academic_paper","Graphical Perception: Theory, Experimentation, and Application"] – entity["people","William Cleveland"] and entity["people","Robert McGill"]

Key findings:
Best visual channels for quantitative judgment:

1. Position
2. Length
3. Angle
4. Area
5. Color

This underpins many design choices in modern charts.

---

### 1.4 Shneiderman — Visual Information Seeking Mantra
- entity["people","Ben Shneiderman"]

Guideline:

**Overview first → zoom/filter → details-on-demand**

This principle appears in many visual analytics systems.


### 1.5 **Edward R. Tufte - "The Visual Display of Quantitative Information" (1983, 2nd ed. 2001)**
   - Core principles: data-ink ratio, graphical integrity, avoiding chartjunk
   - Guidelines include maximizing data density within reason, ensuring proportional representation of quantities, and using small multiples for complex comparisons
---


# Event Sequence specific surveys and frameworks



### A Multi-Level Task Framework for Event Sequence Analysis
   - Zinat et al.
   - TVCG 2025

### A survey of approaches for event sequence analysis and visualization
   - Yeshchenko et al.
   - InfoVIS 2024

### A survey of visualization techniques for comparing event sequences
   - Linden et al.
   - Cumputer Graphics 2023 (check discussion)
   
### Survey on Visual Analysis of Event Sequence Data
   - Guo et al.
   - TVCG 2020
   - Challanges mentioned (data quality, Uncertainty, scalability, heterogeneity, interpretability, causality analysis)

## Fringe papers not specifically for event sequences but has guidelines
   
### Timelines Revisited: A Design Space and Considerations for Expressive Storytelling
   - Brehmer et al.
   - TVCG 2017
   
### LifeFlow: Visualizing an Overview of Event Sequences
   - 
### OutFLow

### ICE: Identify and compare event sequence sets through multi-scale matrix and unit visualizations
    - Fu et al.
	- 2020
	
### IVESA
    - Bernard, 2024

### EventBox: A Novel Visual Encoding for Interactive Analysis of Temporal and Multivariate Attributes in Event Sequences
    - Montana
	- TVCG 2025

### A Comparative Evaluation of Visual Summarization Techniques for Event Sequences
    - Zinat 
	- CG 2023
	
### Visually Abstracting Event Sequences as Double Trees Enriched with Category‐Based Comparison
    - Krause 
	- CG 2023 (check limitation)
	
### CoreFlow: Extracting and Visualizing Branching Patterns from Event Sequences
	- Liu CG 2017 (check the discussion section)
	
### Comparative Study on Fixed-Order Event Sequence visualization
	- Tang et al. 2024
	
### Sequen-C: A Multilevel Overview of Temporal Event Sequences
	- Magallanes et al. 2021
	
	
### A survey of visualization techniques for comparing event sequences
   - Linden et al.
   - Cumputer Graphics 2023 (check discussion)

- Challenge involve sequence attribute can be included in the visualization wihle preserving the temporal context 
- focuses on pointing out underrepresented granularity categories,
- scalability regarding the number of events or sequences, or algorithm efficiency is difficult

### Survey on Visual Analysis of Event Sequence Data
   - Guo et al.
   - TVCG 2020
   - Challanges mentioned (data quality, Uncertainty, scalability, heterogeneity, interpretability, causality analysis)



- static data points
- ignore sequence aggregation

- how to handle scale
- maintining interactivitgy (this connects to static data points)
- support for multi-view and dependent tasks

- design is not static (change over time, reaqujiremnts, outcome, etc.)

- for the nested block (Mayer 2013), my things suggested same abstraction throughout the layers and supporting iterative approach instead of downstram. Only similarity is that I prioritize visual encoding side only.
- While Sedlmair and McCurdy emphasize iteration, they have vague representation and no specific guidance provided for event sequences (like when to intervene and when to )

- Mayer moduels are siloed (individual), but mine is connected

- Data quality issue (cite EventBox, Zinat 2023, Krause 2023, Guo 2020)
- consider temporal context (Linden 2023)



%---------------------
## 4.3 Bridging the Theoretical Gap in Event Sequence Design


### The ESV Specificity and the Curse of Cardinality

When transitioning from general visualization theory to the specific domain of **Event Sequence Visualization (ESV)**, the limitations of these classical models become pronounced. The core challenge in ESV is what can be termed the **"Curse of Cardinality."** Unlike simpler data structures, event sequences often suffer from an explosion of both vertical cardinality (thousands of unique event types) and horizontal cardinality (near-infinite variations in sequence paths). As highlighted in recent literature, such as **Yeshchenko & Mendling (2024)** and **Chen et al. (2017)**, this density creates a "representation-interactivity" deadlock. Current guidelines often treat data management—such as aggregation, alignment, and filtering—as a static pre-processing step. This creates a significant gap: if the initial data abstraction is too "honest" to the raw data, the visual idiom becomes a cluttered "hairball" (the idiom-level threat), and the rendering engine suffers from obstructive latency (the algorithm-level threat).

### Addressing the Gap: The Zhang et al. (2025) Guidelines

To address these systemic failures, I propose a set of three guidelines that move away from the traditional linear dependency of design levels toward a more integrated, constraint-aware system. These guidelines fundamentally re-engineer the relationship between data, design, and the user's cognitive limits.

**Guideline 1: Utilizing Visual Design Constraints to Dictate Data Management**
Traditional frameworks view the algorithm level as a slave to the abstraction. In contrast, this guideline advocates for an inversion of Munzner's hierarchy: the physical and cognitive limits of the visual interface (e.g., pixel real estate and the 100ms "instantaneous" interaction rule) should proactively shape the data management layer. By allowing visual constraints to dictate the degree of data aggregation or sampling, we ensure that the system never attempts to process or render more detail than the human eye can perceive or the screen can display. This "upward" constraint-driven approach effectively mitigates threats to validity at both the idiom and algorithm levels before they occur.

**Guideline 2: Connected Multi-Level Abstractions for Semantic Consistency**
The complexity of event sequences necessitates multi-scale views, yet traditional "drill-down" models often result in siloed abstractions that break the user's mental model. This guideline mandates a **connected abstraction hierarchy**. By ensuring that the macro-summary (e.g., a high-level flow) and the micro-detail (e.g., individual event traces) are mathematically and visually linked, we preserve consistency across interactive transitions. This prevents the "wrong abstraction" threat common in ESV, where users may lose context or misinterpret patterns when switching between disparate levels of granularity.

**Guideline 3: Treating Representativeness and Interactivity as Adjustable Goals**
Perhaps the most significant departure from existing literature is the reframing of the trade-off between representativeness (data accuracy) and interactivity (system responsiveness). Rather than viewing these as opposing binary choices, these guidelines treat them as **harmonized, adjustable parameters**. In the context of the messy, high-cardinality data inherent in ESV, this "tunable" approach allows the system to prioritize fluid exploration during rapid interactions (e.g., zooming or panning) by shedding non-essential detail, only resolving to high representativeness once the user's focus stabilizes. This dynamic balancing ensures that the visualization remains a responsive tool for discovery rather than a static, lagging artifact of raw data.


By synthesizing the structural rigor of classic frameworks with these three domain-specific guidelines, we provide a path forward for ESV design that is computationally feasible, cognitively manageable, and theoretically grounded. These guidelines shift the focus from merely "showing the data" to "managing the experience of the data," a necessary evolution for the next generation of visual analytics.

%--------------------------------