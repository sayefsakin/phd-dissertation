# Visualization in HPC

*2025-09-25 21:29 UTC*

## User

Check the following quoted texts
"Visualization has been widely-used for performance analysis and debugging in high performance computing~\cite{isaacs2014state, ezzati2017multi}. Among them, execution trace data is typically visualized with Gantt charts~\cite{nagel1996vampir, zaki1999toward, graham2004gprof, reinders2005vtune, adhianto2010hpctoolkit,Drebes2014Aftermath, zhukov2015scalasca,Pinto2016,xie2018visual}---a visual idiom where parallel timelines for each computing resource are arranged as rows and events, such as function calls, are drawn as rectangles within those rows, spanning their time of execution. Dependencies, if depicted, are represented as lines connecting events. 

Gantt charts are often paired with other statistical views. Overviews of event type or utilization are particularly common. SmartTraces~\cite{Osmari2014SmartTraces} implemented a drag-and-drop system of linked views, including a data-flow graph. Traveler similarly has a configurable system of auxiliary views. We add two structural views, an Aggregated Gantt View and a Dependency Tree View to show meaningful levels of abstraction between overview and detail.

Data scale has been a persistent issue in execution trace visualization. In addition to responsiveness issues, the vast difference in scale between the length of the trace and the individual events can make Gantt charts hard to interpret, especially when dependencies are present. SyncTrace~\cite{Karran2013SyncTrace} has a resource-centric approach where the timeline of one resource is shown in multiple levels of detail with the most zoomed in showing connections to other resources.  Ravel~\cite{isaacs2014combing} used a idealized unit time axis to show dependency patterns. However, this approach assumes a bulk synchronous paradigm that is not present in our data. Haugen et al.~\cite{Haugen2015} show dependencies only for a selected interval. We similarly provide dependencies on interaction, but show the entire chain of dependencies related to an event rather than just direct connections.

Several approaches eschew the Gantt chart and plot the events or metrics about resources in the same space~\cite{muelder2009visual, muelder2016visual, fujiwara2018visual, li2019visual, kesavan2020visual}. We also aggregate metric data along resources using pre-processing for metric views. However, these approaches do not preserve dependencies between the events, one of the reasons we choose to preserve the Gantt chart.

Non-timeline approaches use summaries, animation, or networks.
Sigovan et al.~\cite{sigovan2013visualizing} showed events bubbling up a duration axis, using animation for time. Sanderson et al.~\cite{sanderson2018coupling} show streaming data for performance analysis and steering, with statistical plots and the projecting of metrics onto the 3D simulation space and machine room layout. Chuimbuko~\cite{kelly2020chimbuko} also shows streaming data, in their case with statistical plots and a call stack plots of streaming data. Of these, only Chimbuko's call stack plot shows dependencies and like SyncTrace it is limited to a specific time range and focus resource. Our users have tasks requiring more fidelity in how resources, events, and dependencies work in concert.

As scheduling in task parallel programs is defined by an execution graph, per-event layered node-link diagrams have also been used~\cite{Huynh2015DAGViz,Muddukrishna2016GrainGraphs,Reissmann2017GrainGraphs}, but the simplification techniques to keep the graph scalable rely on a fork-join parallelism model that does not match our data.
"

Reformat it for my disserataion section in Chapter 3 where I am discussing the tool Traveler.

## Assistant

Got it. I’ll reformat and smooth this into dissertation-style writing, keeping the citations intact and placing the discussion in the context of your Chapter 3 section on **Traveler**. Here’s the revised version:  

---

Visualization has long played an important role in performance analysis and debugging within high-performance computing (HPC) systems~\cite{isaacs2014state, ezzati2017multi}. Among the available visualization idioms, execution traces are most commonly represented using Gantt charts~\cite{nagel1996vampir, zaki1999toward, graham2004gprof, reinders2005vtune, adhianto2010hpctoolkit, Drebes2014Aftermath, zhukov2015scalasca, Pinto2016, xie2018visual}. In this representation, computing resources are arranged as parallel timelines along the vertical axis, while individual events, such as function calls, appear as rectangles spanning their duration across the horizontal time axis. When dependencies are included, they are typically represented as lines connecting the corresponding events.  

To extend the representational capacity of Gantt charts, researchers often combine them with additional statistical or structural views. For example, SmartTraces~\cite{Osmari2014SmartTraces} introduced a drag-and-drop system of linked views that includes a data-flow graph to contextualize event execution. Similarly, Traveler provides a configurable framework of auxiliary views designed to complement the Gantt chart. In particular, Traveler introduces two additional structural abstractions—an Aggregated Gantt View and a Dependency Tree View—that bridge the gap between high-level summaries and detailed traces by enabling exploration at multiple levels of abstraction.  

Despite their utility, Gantt charts face well-known challenges in scalability and interpretability. The extreme difference in scale between long-running traces and short-lived individual events can hinder readability, especially when dependencies are visualized. Approaches such as SyncTrace~\cite{Karran2013SyncTrace} attempt to mitigate this problem through a resource-centric perspective, where multiple levels of detail are presented for a single resource, with the most detailed view showing cross-resource connections. Ravel~\cite{isaacs2014combing}, by contrast, applies an idealized unit time axis to emphasize dependency patterns, although this method assumes a bulk-synchronous execution model not applicable to all workloads. Haugen et al.~\cite{Haugen2015} limit dependency visualization to selected intervals, while Traveler provides a more comprehensive interaction model by exposing the entire chain of dependencies associated with an event, rather than restricting users to immediate connections.  

Some visualization systems have moved away from timeline-based Gantt charts altogether, opting instead to encode events or aggregate metrics in shared visual spaces~\cite{muelder2009visual, muelder2016visual, fujiwara2018visual, li2019visual, kesavan2020visual}. While Traveler does incorporate aggregated metric views through preprocessing, these approaches typically discard the explicit preservation of dependencies, which is one of the central reasons Traveler continues to employ a Gantt-based representation.  

Alternative non-timeline strategies focus on summaries, animations, or network visualizations. For instance, Sigovan et al.~\cite{sigovan2013visualizing} animate events along a duration axis, while Sanderson et al.~\cite{sanderson2018coupling} present streaming data through statistical plots projected into simulation and machine-room layouts for performance steering. Chuimbuko~\cite{kelly2020chimbuko} similarly targets streaming performance data, combining statistical plots with call stack views. Of these, only Chuimbuko incorporates dependencies, but like SyncTrace, it is limited to a narrow time window and single-resource focus. In contrast, Traveler is designed for analytic tasks requiring higher fidelity in depicting how resources, events, and dependencies interact holistically.  

Another alternative is to represent task scheduling using per-event layered node-link diagrams derived from execution graphs~\cite{Huynh2015DAGViz, Muddukrishna2016GrainGraphs, Reissmann2017GrainGraphs}. While such methods provide useful abstractions, their scalability relies heavily on assumptions of fork-join parallelism, which do not align with the irregular task-parallel programs analyzed in Traveler.  

---

Would you like me to **frame this section explicitly as a “Related Systems” comparison**, or keep it as a **narrative of why Traveler chose its design trade-offs**? Both fit into Chapter 3 but serve slightly different rhetorical purposes.
