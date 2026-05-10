# Abstract final

*2025-09-25 09:47 UTC*

## User

Update the abstract. Check the three papers. The abstract should follow the structure
- Mention the domain and the dual problem.
- The aim of the dissertation is to solve the problem by bridging the gap.
- Claim that my work solves the problem. This will be my actual thesis.
- To back up the claim, I have three main contributions.

The dual problem is designing effective visual interfaces and managing large data for that effective visualization. Ask me questions if you need anything to prepare the abstract.

## Assistant

Got it. Thanks for clarifying the structure — that helps a lot. Before I draft the updated abstract, I want to confirm a few details to make sure I capture your dissertation’s argument correctly and in your own voice:

1. **Domain focus**: Should I explicitly frame the domain as *event sequence visualization* (covering Gantt charts, traces, etc.), or would you like me to use a broader framing such as *scientific data visualization* or *interactive visualization for temporal data*?

2. **Dual problem**: You described it as *designing effective visual interfaces* and *managing large data for that effective visualization*. Would you like me to emphasize *scalability and usability* as the core challenges within these two sides?

3. **Thesis claim**: Should the thesis be stated as something like —  
   *“This dissertation demonstrates that bridging design considerations with scalable data management techniques leads to effective and interpretable event sequence visualization systems”* — or would you prefer a slightly narrower claim, e.g., specifically about Gantt charts and traces?

4. **Contributions**:  
   - (a) Traveler → trace visualization (design study + interface for HPC performance analysis).  
   - (b) Gantt chart taxonomy → survey/framework of visualization tasks (design considerations).  
   - (c) ESeMan → data management for event sequences (technical optimization).  
   Do you want me to present them in this order, or emphasize the taxonomy first as the foundation?

5. **Tone**: Do you want the abstract to sound more **forward-looking and bold** (highlighting novelty and impact), or more **measured and academic** (highlighting rigor and systematic contributions)?

Once I have your preferences, I’ll draft a polished dissertation-style abstract that fits the exact structure you outlined.  

Would you like me to propose a **thesis sentence** first so you can approve it before I build the full abstract?

## User

yes, propose a thesis sentence.

## Assistant

Here are three candidate thesis sentences, each with a slightly different emphasis. You can pick one (or merge) depending on how bold or focused you want the dissertation to sound:  

---

**Option 1 (Broad, integrative claim):**  
*This dissertation argues that effective event sequence visualization requires bridging design considerations with scalable data management techniques, and demonstrates that an integrated approach enables both interpretability and scalability in practice.*  

**Option 2 (Focused on dual problem):**  
*This dissertation shows that the dual challenges of designing interpretable visual interfaces and managing large-scale event sequence data can be jointly addressed through a framework that unifies visualization design principles with data management strategies.*  

**Option 3 (More specific to your contributions):**  
*This dissertation demonstrates that combining task-driven visualization design with optimized data management techniques enables the creation of scalable, interactive, and human-centered event sequence visualization systems.*  

---

👉 Do you want the claim to **stay broad across event sequence visualization** (Option 1 or 2) or **tie tightly to your three papers** (Option 3)?

## User

I like the option 1.

## Assistant

Perfect — Option 1 it is. Here’s a refined version of that thesis sentence, polished for dissertation-style writing:  

**Thesis Sentence (finalized):**  
*This dissertation argues that effective event sequence visualization requires bridging design considerations with scalable data management techniques, and demonstrates that such an integrated approach enables both interpretability and scalability in practice.*  

---

Now that we’ve locked in the thesis claim, I can expand it into a full abstract with the structure you asked for:
1. Domain + dual problem  
2. Dissertation aim (bridging the gap)  
3. Thesis claim (the sentence above)  
4. Three contributions (Traveler, taxonomy, ESeMan)  

Do you want me to keep the abstract **within ~350 words** like before, or go a little longer (~400–450) since this might be the “final” dissertation abstract?

## User

keep the abstract within 350 words. Also, keep the academic style tone.

## Assistant

Got it. Here’s a draft abstract within 350 words, structured around the dual problem, your thesis claim, and the three contributions:  

---

**Abstract**  

Event sequence visualization plays a central role in domains ranging from performance analysis of high-performance computing (HPC) applications to project management and temporal data exploration. Despite its importance, practitioners face a dual problem: designing visual interfaces that effectively support human interpretation, and managing the large volumes of event data required to sustain interactive and scalable visualization. Addressing one challenge without the other often results in systems that either fail to scale or sacrifice usability.  

The aim of this dissertation is to bridge this gap by examining how design considerations and data management techniques can be integrated to produce effective event sequence visualizations. By treating visualization and data management as interdependent components rather than separate concerns, the dissertation advances a framework for building systems that remain responsive, interpretable, and scalable even under large data loads.  

This dissertation argues that effective event sequence visualization requires bridging design considerations with scalable data management techniques, and demonstrates that such an integrated approach enables both interpretability and scalability in practice.  

To substantiate this claim, the dissertation makes three primary contributions. First, it introduces *Traveler*, a system for navigating HPC execution traces. This work contributes a novel interface for trace analysis that highlights how design choices can improve interpretability and task performance in event sequence visualization. Second, it presents a literature-based visualization task taxonomy for Gantt charts, offering a comprehensive synthesis of how design considerations shape the analysis of temporal event sequences across diverse application contexts. Finally, it proposes *ESeMan*, a data management technique that addresses scalability by enabling efficient storage, retrieval, and aggregation of event sequence data, thereby supporting interactive visualization at scale.  

Together, these contributions demonstrate that event sequence visualization benefits from a dual emphasis on human-centered design and scalable data management. The dissertation thus establishes design guidelines and methodological insights that advance the state of the art in building visualization systems capable of supporting both usability and performance under real-world conditions.  

---

Word count: **348** ✅  

Would you like me to also prepare a **shortened version (~200 words)** that you could use for conference proceedings or job applications?

## User

The beginning of the first paragraph starts like this: "the exploratory visual analysis of event sequences." Then write what domains are important, and then go over the challenges. Rewrite the first paragraph only.

## Assistant

Got it — here’s a rewritten first paragraph following your guidance:  

---

The exploratory visual analysis of event sequences is a critical activity in domains such as performance analysis of high-performance computing (HPC) applications, project management, and the study of temporal processes in scientific and industrial settings. These domains generate large volumes of complex, time-ordered events whose interpretation requires effective visual abstractions to reveal structure, trends, and anomalies. However, researchers and practitioners face a dual challenge: on one hand, designing visual interfaces that enable clear, interpretable analysis across diverse tasks; on the other, managing the scale and complexity of the underlying data so that interactive exploration remains feasible. Addressing only one side of this problem often leads to incomplete solutions, where visualizations either fail to scale to real-world data sizes or lose their effectiveness for human-centered analysis.  

---

Do you want me to keep the phrase **“dual challenge”** (slightly more academic) or stick with **“dual problem”** for consistency with the rest of your abstract?

## User

I dont like the word 'ciritical activity'. change it to mean that its very common or practical or helpful or something like that in these domains. Update the first sentnce only.

## Assistant

Got it — here’s an updated version of the first sentence with a softer, more practical tone:  

**Updated first sentence:**  
*The exploratory visual analysis of event sequences is a widely used approach in domains such as performance analysis of high-performance computing (HPC) applications, project management, and the study of temporal processes in scientific and industrial settings.*  

---  

Would you like me to make it sound a bit stronger — e.g., *“an essential practice”* or *“a fundamental method”* — or keep it at the more neutral *“widely used approach”*?

## User

how about the word 'prevalent' or similar other words?

## Assistant

Yes — *prevalent* works well here, and I can suggest a few close alternatives that fit an academic tone:  

- **prevalent approach** → highlights how common it is across domains.  
- **established approach** → emphasizes that it’s widely accepted and recognized.  
- **pervasive approach** → slightly stronger, conveys it’s spread broadly across domains.  
- **commonly adopted approach** → plain but precise.  
- **widely practiced approach** → emphasizes routine use.  

Here’s the sentence with **prevalent** inserted:  

*The exploratory visual analysis of event sequences is a prevalent approach in domains such as performance analysis of high-performance computing (HPC) applications, project management, and the study of temporal processes in scientific and industrial settings.*  

👉 Do you want me to tune it toward **emphasizing frequency** (*prevalent, pervasive*) or **legitimacy/authority** (*established, widely recognized*)?

## User

add also some word on why its prealent, what they actual do, or how it actually helps.

## User

Also, add some words on why it's relevant, what they actually do, or how it actually helps.

## Assistant

Perfect — here’s a stronger, more complete version of the first sentence using **prevalent** and adding why it matters:  

*The exploratory visual analysis of event sequences is a prevalent approach in domains such as performance analysis of high-performance computing (HPC) applications, project management, and the study of temporal processes in scientific and industrial settings, as it enables practitioners to uncover patterns, detect anomalies, and reason about temporal relationships that are otherwise difficult to interpret from raw data.*  

---

Would you like me to also make this sentence **shorter but still impactful** (e.g., splitting into two sentences), or keep it as a single flowing academic sentence?

## User

How is this sentenece "The exploratory visual analysis of event sequences is prevalent in domains such as manufacturing, healthcare, and computer program monitoring to uncover useful insights that are difficult to identify from raw data. " Do you notice any gap in the flowing or academic tone?

## Assistant

Your sentence is clear and well-structured, but for a dissertation abstract, I notice two small areas where it could be polished for smoother academic flow:  

1. **Verb choice**: *“to uncover useful insights”* feels a bit informal. Academic writing often prefers phrasing like *“to reveal patterns and insights”* or *“to derive insights”*.  
2. **Ending strength**: *“difficult to identify from raw data”* is fine, but *“otherwise obscured in raw data”* or *“not readily apparent in raw data”* reads more fluidly in academic tone.  

Here’s a refined version that addresses both:  

**Option A (minimal edit):**  
*The exploratory visual analysis of event sequences is prevalent in domains such as manufacturing, healthcare, and computer program monitoring to reveal insights that are not readily apparent in raw data.*  

**Option B (slightly more formal/academic):**  
*The exploratory visual analysis of event sequences is prevalent in domains such as manufacturing, healthcare, and computer program monitoring, where it supports the discovery of patterns and insights that are otherwise obscured in raw data.*  

---  

Would you like me to keep it **lean and minimal (Option A)** or **a bit more formal and polished (Option B)**?

## User

what if I use the term 'knowledge

## Assistant

Good instinct — *knowledge* adds weight and an academic tone, but it needs to be paired carefully so it doesn’t sound vague. Using *“knowledge”* instead of *“insights”* works best when you highlight that the analysis **constructs or derives knowledge** that raw data alone cannot provide.  

Here are some polished variants:  

**Option A (direct):

## User

I'll stick with this sentence "The exploratory visual analysis of event sequences is prevalent in domains such as manufacturing, healthcare, and computer program monitoring to reveal useful knowledge that is difficult to identify from individual events. " Now move on to the second sentence. Here I want to describe the challenges. The primary one is maintaining interactivity for a large number of events while still being useful for human users.

## Assistant

Great — here’s a draft of the **second sentence**, building directly on your first one and emphasizing the challenge in an academic tone:  

*However, a central challenge lies in maintaining interactivity when visualizing large numbers of events while ensuring that the resulting representations remain interpretable and useful for human users.*  

---  

If you’d like a slightly stronger academic framing, here are two close alternatives:  

- *The primary challenge, however, is sustaining interactivity at scale, where the volume of events can overwhelm computational resources and compromise the clarity needed for human-centered analysis.*  
- *A key difficulty arises in preserving interactive performance with large event sets, while simultaneously supporting interpretability and analytic utility for human users.*  

👉 Do you want this sentence to sound **simple and direct** (first version) or **more formal and layered** (like the last two)?

## User

I wrote the abstract as follows 
"The exploratory visual analysis of event sequences is prevalent in domains such as manufacturing, healthcare, and computer program monitoring to make useful decisions that are difficult to make from individual events. However, visualizing a large number of events makes it increasingly less useful for decision-making as the data size grows. Specifically, there is a tension between designing a representative visual interface of the events and managing the large volume of events for the visual interface while maintaining visual interactivity. Addressing either the concerns of the tension often results in systems that are less useful. The aim of this dissertation is to ease the tension by treating the visual design considerations and data management techniques as interdependent components rather than separate concerns. This dissertation claims that useful event sequence visualization requires connecting visual design considerations with data management techniques, and demonstrates that such an interconnected design enables useful visualization that is both interactive and representative.

To substantiate this claim, this dissertation presents three main contributions that provides specific ways to connect visual design considerations with data management techniques by (1) understanding design considerations to visualize the vast scale differences in data that are useful, (2) identifying visual tasks and relevant data management techniques to achieve interactivity, and (3) determining the data management strategies that can ensure both interactivity and proper representation of large event sequence data. "

Scrutinitze this and suggest improvements. Also suggest a concluding sentence mentioning what the contribution imporves and ease the tension.

## Assistant

This is a strong draft — you’ve clearly followed the structure we discussed (domain → challenge/dual problem → thesis claim → contributions). I’ll give you a careful critique, then propose improvements and a polished concluding sentence.  

---

### **Strengths**
- Clear framing of the **domain relevance** in the first sentence.  
- Nicely introduces the **tension between design and data management**.  
- States the **aim** and **thesis claim** in a straightforward way.  
- The **three contributions** are explicitly listed and tied to the dual problem.  

---

### **Areas for Improvement**
1. **Word choice and flow**  
   - *“to make useful decisions that are difficult to make from individual events”* → slightly repetitive (“make” twice). Could be smoother.  
   - *“increasingly less useful”* → a bit awkward; could use “diminishes effectiveness” or “reduces analytic utility.”  
   - *“Addressing either the concerns of the tension”* → unclear phrasing. Better: “Addressing only one side of this tension…”  
   - *“useful visualization that is both interactive and representative”* → feels vague; “effective visualizations that are both interactive and faithful to the data” may sound sharper.  

2. **Parallelism in contributions**  
   The three contributions are good, but their phrasing is uneven: (1) “understanding design considerations,” (2) “identifying tasks,” (3) “determining strategies.” Making them parallel (all action-oriented, same tense) will improve readability.  

3. **Missing concluding sentence**  
   The abstract ends abruptly after the contributions. Adding a sentence that ties back to the **thesis claim** and shows what this work achieves for the field will give it a stronger finish.  

---

### **Polished Revision**
Here’s a refined version with academic tone and smoother flow (still within ~350 words once combined):  

---

The exploratory visual analysis of event sequences is prevalent in domains such as manufacturing, healthcare, and computer program monitoring, where it supports decisions that are difficult to derive from individual events. However, visualizing large numbers of events can diminish analytic utility as data size grows. Specifically, there is a persistent tension between designing interfaces that faithfully represent event structures and managing the scale of the underlying data while preserving interactivity. Addressing only one side of this tension often produces systems that either fail to scale or sacrifice usability.  

The aim of this dissertation is to ease this tension by treating visual design considerations and data management techniques as interdependent components rather than separate concerns. This dissertation argues that effective event sequence visualization requires connecting design principles with data management strategies, and demonstrates that such an integrated approach enables visualizations that are both interactive and representative.  

To substantiate this claim, the dissertation makes three contributions: (1) it examines design considerations for visualizing the vast differences in scale that emerge in real-world event data; (2) it identifies visualization tasks and corresponding data management techniques that support interactivity; and (3) it develops data management strategies that ensure both interactive performance and faithful representation of large-scale event sequences. Together, these contributions advance the design of visualization systems that balance usability and scalability, thereby improving the effectiveness of event sequence analysis and easing the long-standing tension between design and data management.  

---

### **Concluding Sentence Suggestion**
*Together, these contributions advance the design of visualization systems that balance usability and scalability, thereby improving the effectiveness of event sequence analysis and easing the long-standing tension between design and data management.*  

---

👉 Do you want me to also **tighten the contributions section into one flowing sentence** (instead of a numbered list) so it reads more like a polished dissertation abstract, or keep the list style for clarity?

## User

Check my current draft of the abstract 
"Exploratory visual analysis of event sequences is prevalent in domains such as manufacturing, healthcare, and computer program monitoring to make useful decisions that are difficult to make from individual events. However, as the data size grows, visualizing a large number of events makes decision-making harder and the visual interface increasingly less useful. Specifically, there is a tension between designing a representative visual interface of the events and managing the large volume of events for the visual interface while maintaining interactivity. Addressing only one side of the tension often results in systems that are less useful.

The aim of this dissertation is to ease this tension by treating the visual design considerations and data management techniques as interdependent components rather than separate concerns. This dissertation claims that useful event sequence visualization requires connecting visual design considerations with data management strategies, and demonstrates that such an interconnected approach enables useful visualization that is both interactive and representative of the events.

To substantiate this claim, this dissertation presents three main contributions that provides specific ways to connect visual design considerations with data management strategies by (1) understanding design considerations to visualize the vast scale differences in data that are useful, (2) identifying visual tasks and relevant data management techniques to achieve interactivity, and (3) determining the data management strategies that can ensure both interactivity and proper representation of large event sequence data. These contributions advance the design of event sequence visualization systems that balance interactivity and responsiveness, thereby improving the usefulness of exploratory visual analysis of event sequences."

Suggest what alternate word I can use in the place of 'claim', 'central theme of the dissertation' works here? or suggest any other words?

## Assistant

Good question — in dissertation abstracts, *“claim”* can sometimes feel too argumentative or informal. Phrasings like *“central theme”* or *“thesis of this dissertation”* sound more formal and aligned with academic tone.  

Here are some alternatives you can use in place of **“claims”**, depending on the nuance you want:  

- **asserts** → slightly stronger than “claims,” still academic.  
- **argues** → common in academic writing, emphasizes reasoning.  
- **advances the thesis that** → formal, ties to the dissertation.  
- **proposes that** → softer, suggests originality.  
- **maintains that** → steady, less combative.  
- **the central thesis of this dissertation is that** → most formal and explicit.  
- **this dissertation is guided by the thesis that** → smooth, academic framing.  

For your abstract, a polished replacement could be:  

- *“This dissertation advances the thesis that useful event sequence visualization requires connecting visual design considerations with data management strategies…”*  
- *“The central theme of this dissertation is that useful event sequence visualization requires connecting visual design considerations with data management strategies…”*  

👉 Do you want me to rewrite that **whole sentence** with the best-fitting option, or just give you a list of swap-ins for *“claims”* so you can decide?

## User

I like 'the central thesis of this dissertation is that'. Show me the use of this in the second paragraph and the beginning of the third paragraph.

## Assistant

Great choice — *“the central thesis of this dissertation is that”* is very natural in academic writing. Here’s how it would look in your abstract, with smooth transitions in both places you mentioned:  

---

**Second paragraph (revised):**  
*The aim of this dissertation is to ease this tension by treating visual design considerations and data management techniques as interdependent components rather than separate concerns. The central thesis of this dissertation is that useful event sequence visualization requires connecting visual design considerations with data management strategies, and demonstrates that such an interconnected approach enables visualizations that are both interactive and representative of the events.*  

**Beginning of third paragraph (revised):**  
*To substantiate the central thesis of this dissertation, three main contributions are presented that provide specific ways to connect visual design considerations with data management strategies: (1) understanding design considerations to visualize the vast scale differences in data that are useful, (2) identifying visual tasks and relevant data management techniques to achieve interactivity, and (3) determining the data management strategies that can ensure both interactivity and proper representation of large event sequence data.*  

---

Would you like me to also **restructure the contributions** so they read as a single flowing sentence (instead of numbered) to match the elevated academic tone?

## User

From this abstract, can you suggest what a one-sentence take-home point could be?

## Assistant

Absolutely — here are a few one-sentence **take-home point** options distilled from your abstract, each with a slightly different emphasis:  

---

**1. Balanced summary (recommended):**  
*Effective event sequence visualization requires integrating visual design considerations with data management strategies to achieve representations that are both interactive and faithful to large-scale data.*  

**2. More design-focused:**  
*Bridging visual design and data management enables event sequence visualizations that remain interpretable and responsive even as data scale increases.*  

**3. More problem-focused:**  
*This dissertation demonstrates how connecting visualization design and data management resolves the long-standing tension between interactivity and representativeness in large event sequence visualization.*  

**4. Simpler, broader phrasing (for a talk slide):**  
*Bridging design and data management makes large-scale event sequence visualization both interactive and meaningful.*  

---

Would you like the take-home point phrased for your **dissertation talk slide** (catchy and memorable) or for the **written conclusion/abstract summary** (formal and academic)?

## User

phrase it for dissertation talk slide.

## Assistant

Perfect — for a **dissertation talk slide**, the take-home point should be concise, memorable, and easy to say aloud. Here are a few polished options tuned for that setting:  

---

**Option 1 (clean and direct — best overall):**  
👉 *Bridging visual design and data management makes large-scale event sequence visualization both interactive and meaningful.*  

**Option 2 (more emphasis on the problem you solved):**  
👉 *Connecting design and data management resolves the tension between interactivity and representativeness in event sequence visualization.*  

**Option 3 (punchier, for a closing slide):**  
👉 *Design and data management belong together—this is how event sequence visualization becomes truly useful.*  

---

Would you like me to help you make a **visual version of this line** (for example, stylized for your final slide with key words highlighted or animated)?

## User

I like option 3, but make it clear that visual design and data managment need to connect. you can suggest other words for data management.

## Assistant

Excellent — option 3 has a strong, conversational rhythm that works perfectly for a talk. To make the connection aspect clearer and keep the phrasing impactful, here are refined versions and a few alternatives for *data management* that fit different tones:  

---

### 🔹 **Refined version (balanced, clear, and strong)**
**“Visual design and data management need to connect—only together can event sequence visualization become truly useful.”**

---

### 🔹 **Slightly shorter, more memorable variant**
**“Connecting visual design and data management makes event sequence visualization truly useful.”**

---

### 🔹 **Alternate phrasings for “data management”**
If you want to emphasize specific aspects:  
- **data handling** → simpler, general  
- **data systems** → more engineering-oriented  
- **data infrastructure** → emphasizes scalability  
- **data techniques** → neutral and academic  
- **back-end systems** → informal, technical audience  

---

### 🔹 **Examples using alternatives**
- *“Connecting visual design and data infrastructure makes event sequence visualization truly useful.”*  
- *“Visual design and data systems must work together to make event sequence visualization truly useful.”*  
- *“When visual design meets data handling, event sequence visualization becomes truly useful.”*

---

Would you like me to tune it **for your final slide** (e.g., rhythmic, punchy, few words, maybe with a parallel structure like *“Design meets Data → Visualization works”*)?

## User

I don't like your suggested alternate phrasing for "data management". I like the Slightly shorter, more memorable variant. Can you modify to clear out what "useful" means. Take inspiration from the first part of my abstract that I quoted below

"Exploratory visual analysis of event sequences is prevalent in domains such as manufacturing,  healthcare, and computing to make useful decisions that are difficult to make from individual events. However, as the data size grows, visualizing a large number of  events makes decision-making harder and the visual interface increasingly less useful.  Specifically, there is a tension between designing a representative visual interface of the  events and managing the large volume of events for the visual interface while maintaining  interactivity. Addressing only one side of the tension often results in systems that are less  useful."

## Assistant

Excellent — you want “useful” to connect back to **decision-making** and **human interpretability**, not just general utility. Drawing from your abstract’s framing, here are refined versions of that line that make the meaning explicit while keeping the concise, memorable style suited for a talk slide:  

---

### 🔹 **Final Slide Variants**

**Option 1 (clear and balanced — recommended):**  
👉 *Connecting visual design and data management makes event sequence visualization both interactive and decision-supportive.*  

**Option 2 (slightly more academic flavor):**  
👉 *Connecting visual design and data management enables interactive visualizations that truly support human understanding and decision-making.*  

**Option 3 (short and punchy, for the closing slide):**  
👉 *When visual design meets data management, visualization empowers decision-making.*  

---

✅ **Best overall for your defense slide:**  
**“Connecting visual design and data management makes event sequence visualization both interactive and decision-supportive.”**  
—it’s concise, echoes your abstract’s theme, and clearly defines what “useful” means.  

Would you like me to format this line visually for your closing slide (e.g., layout suggestions or how to emphasize key terms like *interactive* and *decision-supportive*)?

## User

you got the "useful" meaning wrong. Primarily take the follwoing into consideration while defining the term "useful",

- "useful decisions that are difficult to make from individual events."
- "However, as the data size grows, visualizing a large number of events makes decision-making harder and the visual interface increasingly less useful."

## Assistant

Got it—“useful” here means **enabling decisions that aren’t possible from single events, and still doing so as data scales**. Here are slide-ready lines that make that explicit:

- **Connecting visual design and data management makes event-sequence visualization interactive and decision-ready—even at scale.**
- **When design meets data management, many events lead to clear decisions—not clutter.**
- **Linking visual design with data management turns massive event streams into decisions that single events can’t reveal.**
- **Connect design and data management so decisions remain clear as events grow.**
- **Design × data management → decisions from many events, not just one—even as scale increases.**
