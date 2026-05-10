# Traveler design goals

*2025-09-25 21:40 UTC*

## User

Check the following quoted texts "\section{Our Design Process}
\label{sec:process}

We describe the design process of Traveler in terms of the Design Study Methodology of Sedlmair et al.~\cite{Sedlmair2012}. We first describe the context of the collaboration in which Traveler was designed, in support of a highly active open-source research software endeavor, making day-to-day needs a ``moving target''~\cite{williams2020movingtarget}. From this framing we describe roles in the project and our discovery process. Finally, we present our task analysis, which extends and modifies an existing goal-task lattice~\cite{williams2020movingtarget}.

\subsection{Collaboration Overview and Background}
\label{sec:collaboration}

We designed and developed Traveler in support of {\em and} as one of the goals of a multi-institutional research project, Phylanx. The overall goal of the project is to support distributed processing of data science programs, thus increasing the size of programs that can be computed and the speed in which they are computed. The Phylanx workflow transpiles Python/NumPy programs and runs them as distributed HPX applications. HPX is an asynchronous tasking runtime.

Performance analysis and visualization support are sub-goals of the Phylanx project as they support the development of the core Phylanx library as well as the HPX library beneath it, application analysis by advanced Phylanx users, and communication of Phylanx concepts to potential users. 

As both Phylanx and HPX are actively developed, specific (visual) analysis goals of focus change over time, requiring careful observation of evolving needs in designing visualizations. Williams et al.~\cite{williams2020movingtarget} documented this process in the design of another performance visualization, {\em Atria}. While Traveler focuses on execution trace analysis, Atria was designed for profile data---a different type of performance analysis data where measurements are aggregated rather than presented in time. We discuss these implications of this difference in \autoref{sec:taskanalysis}. The assignment of general roles and the discovery process we use here are consistent with that of Atria.

{\bf Participants and Roles.} The Phylanx project is composed of three teams. The {\em Runtime Team} develops the HPX and the core Phylanx library. The {\em Performance Analysis Team} develops performance collection tools, automated performance optimization approaches, and nightly regression scripts. The {\em Visualization Team} develops performance visualization tools. This structure is unchanged from Atria's development, though the membership of each team has changed over time as people joined or left the project.

As with Atria, the Runtime Team lead served as the primary gatekeeper and encouraged the casting of students and post-doctoral fellows in their team as frontline analysts.  

\subsection{Data}
\label{sec:data}

We describe the data and data abstractions used in Traveler. 

{\bf Execution Trace Data.} Traveler visualizes execution trace data from Open Trace Format version 2 (OTF2)~\cite{OTF2} archives, a widely-used format in HPC. As stated before, traces are a form of event sequence data. We abstract the fundamental unit of the trace (i.e., the durational event) as an {\em interval}. In ATR terms, an interval is similar to a {\em task}, but we avoid this using the term ``task'' because HPX tasks can be further divided, so some intervals are not full tasks, and because the word ``task'' has a different meaning in visualization, one we use throughout the rest of the document.

An interval has a start and end time, a globally unique identifier ({\em GUID}), a {\em location} (computational resource, e.g., hardware thread) on which it executed, and a {\em primitive} name describing what was executed (e.g., function name or programming construct). The primitive is essentially the event {\em type}. An interval may also have a {\em Parent GUID}, the GUID of the interval that spawned it, if its parent was collected during execution. 

GUID and Parent GUID data in HPX were not collected prior to the Phylanx collaboration. These attributes were added to the trace data collection capabilities by the Performance Analysis Team lead after discussion with the Visualization and Runtime teams for some of the sub-goals we present in our task analysis, an example of evolving data that arose from the collaboration.  

The trace file may also include {\em performance counter} data. A performance counter accumulates a metric over time such as the number of CPU cycles or L1 cache misses. The value of this accumulator can be sampled at regular temporal intervals or at trace point events. Subtracting the counter value from its previously sampled one results in an absolute count of the events it measured in the past interval.

{\bf Execution Tree.} We derive an execution tree from the trace data, using the relationships described by Parent GUIDs. The execution tree aggregates the intervals by primitive name and sequence of primitives leading to it, similar to a calling context tree. We thus refer to a node in this tree as being a {
\em primitive context}. Each node in the tree has an associated primitive name and aggregated duration of all intervals with the same context (i.e., primitive name and Parent GUID sequence). The execution tree is different from the execution graph in Atria which was collected directly rather than derived from the trace. Typically the derived execution tree is more detailed due to instrumentation differences.

{\bf Source Code.} Source code is an optional data source in Traveler.



\subsection{Task Analysis}
\label{sec:taskanalysis}

Williams et al.~\cite{williams2020movingtarget} developed a task analysis with the goal of not only supporting Atria, but of informing performance data collection efforts in the other teams and preparing for future visual analysis needs as the Phylanx project continued. The task analysis was based on full team meetings, focused visualization or performance meetings, e-mail messages, and informal interviews. Through this process, the occurrence of tasks was tracked over time to prioritize tasks which remained relevant despite by the shifting needs of the project. We continued this discovery process in developing Traveler, adding an additional 181 note artifacts to the prior 152, and in turn continued to build and refine the task analysis. 

Two authors separately reviewed notes and proposed extensions to the existing task analysis and then discussed and integrated their proposals, resulting in the task analysis we present here. 

We originally organized tasks from broad umbrella concerns, to goals and sub-goals, and then finally low-level tasks, referring to the structure as a goal-task lattice as there were multiple connections between layers. For example, some goals support multiple umbrella concerns. Our revised goal-task lattice recognizes connections between layers that became apparent in our analysis. 

Another significant change was that we originally presented the task analysis for aggregated execution graph data. As the central data abstraction was a network, we used the network task taxonomy of Lee et al.~\cite{Lee2006}. However Traveler focuses on execution traces, a form of event sequences, but also incorporates an execution graph view, preserving those network-based tasks. We thus chose to apply the interaction task taxonomy of Yi et al.~\cite{Yi2007} for non-network tasks. We chose this task taxonomy due to the prevalence of {\em connect} tasks suggested by our sub-goals.

We describe the unchanged parts of the task analysis briefly and elaborate on the changes. \autoref{fig:taskanalysis} provides an overview of the new analysis and its differences from the previous ones.

\begin{figure}[tb]
  \centering
  \includegraphics[width=\linewidth]{figures/lattice3.pdf}
  \caption{A goal-to-task lattice, showing relationships between high-level umbrella concerns, goals, sub-goals, tasks, and the task taxonomies in Lee et al.~\cite{Lee2006} and Yi et al.~\cite{Yi2007}. Additional goals, sub-goals, tasks, and frameworks, relative to prior work, are shown in \textbf{\textcolor{cbYellow}{yellow}}.}
  \label{fig:taskanalysis}
 \end{figure}

{\bf Umbrella concerns.} The three umbrella concerns did not change. {\bf U1}, {\em Program Comprehension}, describes how people want to understand and build mental models of how a program translates to execution. {\bf U2}, {\em Performance Analysis}, describes understanding efficiency concerns of the execution. {\bf U3}, {\em Communication}, describes concerns in explaining the system and approach to others, such as potential users or the academic community through publications.

{\bf Goals.} The six original goals did not change, but four of them were designated additional sub-goals and a seventh overall goal was added. We describe each goals and its sub-goals and tasks, with focus on the additions for execution trace data.

{\bf G1: Overview of Execution.} In all three umbrella concerns, people wanted an overview of the execution---a general sense of how the code was translated into parallel tasks, which were run frequently, and how time and resources were allocated. With the execution graph, this can be viewed with overview, follow dependencies, and finding substructures tasks. We add abstract and explore tasks from Yi et al. with the inclusion of trace data.

{\bf G2: Relate Code.} Understanding how behavior relates to code is important because the code is what the developers can change. Runtime developers need to know relationships to code to improve runtime policies. This is thus an important goal for program comprehension and performance analysis. In Atria, the sub-goals were relating primitive to code (analyze attributes) and code to primitives (find subsets). Intervals are the fundamental unit in trace data, so we add sub-goals that also relate intervals. These, as well as the previous sub-goals, are described by Yi et al.'s {\em connect} task.

{\bf G3: Understanding Timing Information.} Timing information is at the core of performance analysis. People want to know what took a significant or an abnormal amount of time and also want to compare timings across iterations or runs. Thus, we keep previously declared sub-goals of finding hot spots, hot paths, timing anomalies, and comparing across runs. 

The detailed temporal data about intervals and resources available in execution traces led our collaborators to discuss sub-goals focusing on them, three of which cross-cut several goals. The {\bf cross-cutting sub-goals} are (a) correlating intervals with time, (b) correlating resources with time, and (c) correlating primitive use with time. People want to know the arrangement of intervals and resources in time and at a higher level of abstraction, the primitive use in time. As the time span is vast in comparison to the duration of intervals, several levels of detail are needed, leading us to assign abstract/elaborate, reconfigure, and encode tasks.

We identified two more timing information sub-goals which are highly related: analyze the interval distribution and find extreme intervals. Developers and performance analysts have questions regarding the duration and distribution of intervals. Long intervals may indicate an anomaly or target of optimization depending on numeracy. Many short intervals can also lead to poor performance due to the overhead in managing them. Understanding these in a timeline is unmanageable, suggesting an encode task.

{\bf G4: Understand Runtime Decisions.} An ATR manages parallel tasks to achieve good performance. Understanding the decisions made during execution is thus important for developers to best use the ATR and for Runtime Team members to improve the ATR. Our original task analysis recognized several network tasks. With execution trace data, the cross-cutting sub-goals also explain runtime decisions as the assignment of intervals and resources is managed by the runtime.

{\bf G5: Understand Utilization.} Utilization describes how computational resources are exercised during execution. High utilization means most of the resources are working at capacity and thus likely will achieve the result more quickly. Low utilization means many resources are idle, wasting power without contributing to the result. In our prior study, utilization was identified as a goal, but not one the data yet permitted. All utilization sub-goals are thus newly identified.

The cross-cutting sub-goals are central to utilization as refer to state information about resources in time. Additional sub-goals are (a) correlating intervals with resource use, explaining {\em what} computation is occurring if a resource is in use, and (b) correlating resource use with resource use---comparing across resources. Again as the time scale is large, abstract/elaborate and arrange tasks are necessary. Some questions, like other attributes of resources, require an encode task.

Goals G3, G4, and G5 influence each other, leading to the cross-cutting sub-goals. Runtime decisions affect the utilization, but utilization informs runtime decisions. Similarly, timing information is an outcome of runtime decisions, but like utilization, also informs them. This relationship became more apparent to us as the Utilization goal was expanded upon.  

{\bf G6: Export/Save.} Sharing of results supports the Communication concern. This is unchanged from the original task analysis.

{\bf G7 (New): Manage Datasets.} With more datasets as well as regression analyses and comparisons across versions or processor counts, our collaborators started discussing the need to manage multiple datasets during their analyses. We focus on execution trace visualization in this work and thus do not further discuss this goal. "

Now rewrite for my dissertaion section in chapter 3 where I discuss Traveler design goals.

## Assistant

Got it. You want me to take the quoted text (which reads like a design-study paper section) and rewrite it in dissertation style, with a focus on **Traveler’s design goals** for Chapter 3. That means:  

- Less paper-like framing (“we describe…”), more dissertation-style exposition.  
- Smoothly integrate background, collaboration context, data abstractions, and task analysis into a narrative that establishes the **design goals** of Traveler.  
- Keep key technical terminology (intervals, GUID, execution tree, umbrella concerns, goals, sub-goals, task taxonomy).  
- Organize clearly, but make it sound like your dissertation’s reasoning and framing, not a standalone paper.  

Here’s a rewritten version suitable for your dissertation’s **Traveler Design Goals** section:  

---

### Traveler Design Goals

The design of Traveler followed an iterative and human-centered process grounded in the Design Study Methodology proposed by Sedlmair et al.~\cite{Sedlmair2012}. Traveler was developed within the context of the multi-institutional Phylanx project, an open-source research effort aimed at enabling distributed execution of data science programs. Phylanx transpiles Python/NumPy programs into distributed HPX applications, leveraging HPX as an asynchronous task-based runtime system. Within this broader effort, performance analysis and visualization were identified as essential sub-goals, supporting not only the development of the Phylanx and HPX libraries but also advanced user analyses and communication of system behavior to potential adopters.  

Because both Phylanx and HPX evolved continuously throughout the collaboration, the requirements for visualization were never fixed but instead represented a “moving target”~\cite{williams2020movingtarget}. This dynamic context required continuous engagement with collaborators and careful tracking of emerging needs. Previous work on Atria, another visualization developed in the same research ecosystem, had documented similar challenges. While Atria was designed for profile data—where performance measurements are aggregated—Traveler addresses execution traces, a form of event sequence data that requires reasoning about events in time. This distinction had significant implications for task analysis and the resulting visualization design.  

#### Collaboration Context  
The Phylanx project was organized into three interdependent teams: the Runtime Team, responsible for HPX and Phylanx library development; the Performance Analysis Team, responsible for collection tools, optimization methods, and regression infrastructure; and the Visualization Team, responsible for performance visualization systems. In this structure, the Runtime Team lead acted as the primary gatekeeper, while students and post-doctoral researchers were often cast as frontline analysts. This organization shaped the communication and prioritization of visualization goals, with Traveler directly serving both development and analysis needs.  

#### Data Abstractions  
Traveler’s design goals were tightly coupled to the structure of the underlying execution trace data, stored in Open Trace Format version 2 (OTF2)~\cite{OTF2}, a widely used HPC trace format. The fundamental abstraction for traces is the **interval**, a durational event defined by start and end times, a globally unique identifier (GUID), an execution location (such as a hardware thread), and a primitive name describing the executed operation. Parent–child relationships between intervals are expressed through GUID links, allowing hierarchical organization of events. These attributes were extended during the Phylanx collaboration itself, when GUID and Parent GUID data were added at the request of the visualization effort, illustrating how evolving data collection shaped visualization design.  

From these traces, Traveler derives an **execution tree** that aggregates intervals into primitive contexts, analogous to calling-context trees. Each node represents a primitive name and the aggregated duration of intervals sharing the same parent sequence. This abstraction differs from the directly collected execution graph used in Atria, but provides a more detailed view of execution behavior. Optional data sources, such as performance counters (e.g., CPU cycles, cache misses) and program source code, further extend the analytical possibilities.  

#### Task Analysis and Design Goals  
The design goals of Traveler were formalized through an extended task analysis that built upon and revised the earlier goal-task lattice from Atria~\cite{williams2020movingtarget}. This process incorporated data from full-team meetings, specialized visualization and performance meetings, email exchanges, and informal interviews, resulting in over 330 recorded artifacts. Two independent coders reviewed and refined the analysis, leading to a revised lattice structure. Unlike Atria, which primarily addressed aggregated network data, Traveler’s analysis applied Yi et al.’s taxonomy of interaction tasks~\cite{Yi2007} to better account for the prevalence of **connect** tasks in execution trace visualization, while preserving network-oriented tasks where appropriate~\cite{Lee2006}.  

The revised lattice retained three umbrella concerns: **program comprehension (U1)**, **performance analysis (U2)**, and **communication (U3)**. Seven design goals were articulated under these concerns:  

- **G1: Overview of Execution.** Provide a high-level sense of how code translates into execution, including task frequency, time allocation, and dependencies. This goal introduced abstract and explore tasks made possible by detailed trace data.  
- **G2: Relate Code.** Support understanding of how execution behavior corresponds to code, enabling both runtime developers and application users to connect primitives and intervals back to source constructs. This goal emphasized Yi et al.’s connect tasks.  
- **G3: Understanding Timing Information.** Facilitate detection of hotspots, timing anomalies, and cross-run comparisons. Execution traces motivated new sub-goals such as analyzing interval distributions, identifying extreme intervals, and correlating intervals, resources, and primitives with time.  
- **G4: Understand Runtime Decisions.** Support analysis of scheduling and resource allocation decisions made by the HPX runtime, with cross-cutting connections to timing and utilization goals.  
- **G5: Understand Utilization.** Enable evaluation of how effectively computational resources are used, including sub-goals correlating intervals with resource usage and comparing across resources.  
- **G6: Export and Save.** Allow sharing of results and visual evidence to support communication within and beyond the project.  
- **G7: Manage Datasets.** Provide mechanisms for handling multiple datasets, particularly in regression analysis and scaling studies, reflecting emerging needs during the project.  

Collectively, these goals illustrate how Traveler’s design was shaped by both the evolving requirements of the Phylanx collaboration and the unique analytical opportunities afforded by execution trace data. The resulting visualization system was thus not only a tool for immediate project needs but also a demonstration of how execution traces can be visualized in ways that support program comprehension, performance analysis, and communication simultaneously.  

---

Would you like me to also **add explicit framing sentences** at the start and end, so this section ties back neatly to Chapter 3 (e.g., “In this section, I outline the design goals of Traveler, which…” and “These goals guided the subsequent design decisions presented in the next section”)? That would make it flow more like a dissertation chapter rather than a standalone paper.

## User

put this in latex style format. Also add explicit framing sentences at the start and end to tie back neatly to Chapter 3.

## Assistant

Here’s a full LaTeX-formatted version of the rewritten **Traveler Design Goals** section, with framing sentences at the beginning and end so it ties smoothly into Chapter 3 of your dissertation:  

```latex
\section{Traveler Design Goals}
\label{sec:travelergoals}

In this section, I outline the design goals of \textit{Traveler}, the execution trace visualization system developed during my collaboration on the Phylanx project. This discussion situates Traveler within the broader context of event sequence visualization, emphasizing the methodological approach taken, the collaborative environment in which the system was built, and the task analysis that guided its design. By articulating the specific goals of Traveler, I establish the foundation for understanding the design choices presented later in this chapter.

The design of Traveler followed an iterative, human-centered process grounded in the Design Study Methodology proposed by Sedlmair et al.~\cite{Sedlmair2012}. Traveler was developed as part of the multi-institutional Phylanx project, an open-source research effort aimed at enabling distributed execution of data science programs. Phylanx transpiles Python/NumPy programs into distributed HPX applications, leveraging HPX as an asynchronous task-based runtime system. Within this broader effort, performance analysis and visualization were identified as essential sub-goals, supporting not only the development of the Phylanx and HPX libraries but also advanced user analyses and communication of system behavior to potential adopters.

Because both Phylanx and HPX evolved continuously throughout the collaboration, the requirements for visualization were never fixed but instead represented a ``moving target''~\cite{williams2020movingtarget}. This dynamic context required continuous engagement with collaborators and careful tracking of emerging needs. Previous work on Atria, another visualization developed in the same research ecosystem, documented similar challenges. While Atria was designed for profile data---where performance measurements are aggregated---Traveler addresses execution traces, a form of event sequence data that requires reasoning about events in time. This distinction had significant implications for task analysis and the resulting visualization design.

\subsection{Collaboration Context}
\label{sec:traveler-collaboration}

The Phylanx project was organized into three interdependent teams: the \textit{Runtime Team}, responsible for HPX and Phylanx library development; the \textit{Performance Analysis Team}, responsible for collection tools, optimization methods, and regression infrastructure; and the \textit{Visualization Team}, responsible for performance visualization systems. In this structure, the Runtime Team lead acted as the primary gatekeeper, while students and post-doctoral researchers were often cast as frontline analysts. This organization shaped the communication and prioritization of visualization goals, with Traveler directly serving both development and analysis needs.

\subsection{Data Abstractions}
\label{sec:traveler-data}

Traveler’s design goals were tightly coupled to the structure of the underlying execution trace data, stored in Open Trace Format version 2 (OTF2)~\cite{OTF2}, a widely used HPC trace format. The fundamental abstraction for traces is the \textbf{interval}, a durational event defined by start and end times, a globally unique identifier (GUID), an execution location (such as a hardware thread), and a primitive name describing the executed operation. Parent–child relationships between intervals are expressed through GUID links, allowing hierarchical organization of events. These attributes were extended during the Phylanx collaboration itself, when GUID and Parent GUID data were added at the request of the visualization effort, illustrating how evolving data collection shaped visualization design.

From these traces, Traveler derives an \textbf{execution tree} that aggregates intervals into primitive contexts, analogous to calling-context trees. Each node represents a primitive name and the aggregated duration of intervals sharing the same parent sequence. This abstraction differs from the directly collected execution graph used in Atria, but provides a more detailed view of execution behavior. Optional data sources, such as performance counters (e.g., CPU cycles, cache misses) and program source code, further extend the analytical possibilities.

\subsection{Task Analysis and Goals}
\label{sec:traveler-tasks}

The design goals of Traveler were formalized through an extended task analysis that built upon and revised the earlier goal-task lattice from Atria~\cite{williams2020movingtarget}. This process incorporated data from full-team meetings, specialized visualization and performance meetings, email exchanges, and informal interviews, resulting in over 330 recorded artifacts. Two independent coders reviewed and refined the analysis, leading to a revised lattice structure. Unlike Atria, which primarily addressed aggregated network data, Traveler’s analysis applied Yi et al.’s taxonomy of interaction tasks~\cite{Yi2007} to better account for the prevalence of \textit{connect} tasks in execution trace visualization, while preserving network-oriented tasks where appropriate~\cite{Lee2006}.

The revised lattice retained three umbrella concerns: \textbf{U1: Program Comprehension}, \textbf{U2: Performance Analysis}, and \textbf{U3: Communication}. Seven design goals were articulated under these concerns:

\begin{itemize}
  \item \textbf{G1: Overview of Execution.} Provide a high-level sense of how code translates into execution, including task frequency, time allocation, and dependencies. This goal introduced abstract and explore tasks made possible by detailed trace data.  
  \item \textbf{G2: Relate Code.} Support understanding of how execution behavior corresponds to code, enabling both runtime developers and application users to connect primitives and intervals back to source constructs. This goal emphasized Yi et al.’s connect tasks.  
  \item \textbf{G3: Understanding Timing Information.} Facilitate detection of hotspots, timing anomalies, and cross-run comparisons. Execution traces motivated new sub-goals such as analyzing interval distributions, identifying extreme intervals, and correlating intervals, resources, and primitives with time.  
  \item \textbf{G4: Understand Runtime Decisions.} Support analysis of scheduling and resource allocation decisions made by the HPX runtime, with cross-cutting connections to timing and utilization goals.  
  \item \textbf{G5: Understand Utilization.} Enable evaluation of how effectively computational resources are used, including sub-goals correlating intervals with resource usage and comparing across resources.  
  \item \textbf{G6: Export and Save.} Allow sharing of results and visual evidence to support communication within and beyond the project.  
  \item \textbf{G7: Manage Datasets.} Provide mechanisms for handling multiple datasets, particularly in regression analysis and scaling studies, reflecting emerging needs during the project.  
\end{itemize}

Collectively, these goals illustrate how Traveler’s design was shaped by both the evolving requirements of the Phylanx collaboration and the unique analytical opportunities afforded by execution trace data. The resulting visualization system was thus not only a tool for immediate project needs but also a demonstration of how execution traces can be visualized in ways that simultaneously support program comprehension, performance analysis, and communication.

In the next section, I build upon these articulated design goals to discuss how they informed Traveler’s visualization design and the specific techniques employed to address the challenges of execution trace analysis.
```

---

Do you want me to also **draw a small schematic goal-task lattice figure** (like in your paper, but simplified for dissertation clarity), or do you prefer to just keep it text + citations in this chapter?
