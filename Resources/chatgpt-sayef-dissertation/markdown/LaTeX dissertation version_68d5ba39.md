# LaTeX dissertation version

*2025-09-25 21:55 UTC*

## User

Move on to the next section in chapter 3. check the quoted text below. Give me disssertation-style version of this in latex format.
"\section{Traveler}
\label{sec:traveler}

We present the design of Traveler (\autoref{fig:teaser}), a visualization platform for performance analysis of task parallel execution traces. In \autoref{sec:travelerstrategy}, we provide an overview of Traveler's views, explaining how they match with the four data items types in traces and how we build a hierarchy of levels of abstraction that are meaningful in the trace. We then discuss designs of the major views, temporal (\autoref{subsec:temporal_views}) and non-temporal(\autoref{subsec:non_temporal}), and how they fulfill our data and task analysis. Finally we discuss our implementation (\autoref{subsec:implementation}), including strategies we used to keep the visualization responsive.

\subsection{An Overview of Traveler Views}
\label{sec:travelerstrategy}

In support of the data and numerous tasks discussed in \autoref{sec:process}, Traveler is a configurable multiple coordinated view system. Users can flexibly re-size, arrange, hide, and close views as needed for their analysis goals. 

There are nine types of views in Traveler, some of which the user may place multiple times with different facets of the data. Of the views, we consider three to be the native views of the four data item types in execution traces. Intervals and resource state are shown together in a Gantt View, the most common idiom for execution traces. Primitives are shown with their context (i.e., creation provenance) in a node-link diagram showing the program's execution tree, following the idiom used in Atria~\cite{williams2020movingtarget}. Source code is shown in its native text format (\autoref{fig:teaser}(d)) with syntax highlighting. 

Complimenting the Gantt chart, which can show individual event details, we provide two other temporal views at higher levels of abstraction that are meaningful to performance analysis: a utilization view and an aggregated Gantt chart which summarizes the behavior of meaningful groups of tasks. 

Traveler has two additional views for showing summarized interval or resource attributes (metrics) in time, a different facet of the intervals and resources. A histogram view of interval duration provides another selection and navigation mechanism into the trace data. 

The Selection Info View (\autoref{fig:teaser}(c)) shows details such as additional attribute data for any set of selected items (e.g., intervals, primitives) from the other views.
%
%
\subsection{Temporal views}
\label{subsec:temporal_views}

Traveler has five views that use time for the horizontal axis, a Gantt chart, the novel Aggregated Gantt chart, a Utilization View, and two metric views: a simple Line Chart and the Functional Box Plot View. The Utilization View is fixed to the full duration of the execution trace. All other temporal views have linked panning and zooming as well as linked random access through Utilization View brushing. 


\subsubsection{Utilization Overview} 

The Utilization View (\autoref{fig:teaser}(e)) shows the total utilization over time using an area chart. The height of the area chart at any pixel is the total amount of resource activity in that time span divided by the total time span, such that the maximum would be the total number of resources. This view supports G5 (understanding utilization) and cross-cut sub-goal CC.2, correlating resource use with time. 

The Utilization View also acts as a navigation aid and provides context to the other views. An interactive rectangular brush shows and can alter the time span in the other temporal views, supporting abstract/elaborate and reconfigure tasks. Primitive or group interval selections from other views will draw a second area in yellow, denoting the utilization due to the selection. This feature supports cross-cut sub-goals CC1 and CC3, correlating intervals and primitives with time.

%At the top left in~\autoref{fig:teaser}(e) is the Utilization View, which shows among the available CPU core and threads, how much are being utilized at a time. This basically shows the overview of the whole execution. Here, the x-axis represents time in nanoseconds. It supports brush drawing, by mouse click-hold-drag-release, to select a specific time in this view. On selection, the gantt view (and other timeline views) will show the selected time domain. It also allows dragging a previously drawn brash horizontally.


\begin{figure}[h!]
    \centering
    \includegraphics[width=3.5in]{figures/gantt.jpg}
    \caption{Gantt View representing parent-child dependency between two intervals. Here, the highlighted yellow interval bar $b$ has parent $a$. $b$ has three children\textemdash $c$, $d$, and $e$.
    }
    \label{fig:gantt}
\end{figure}


\subsubsection{Gantt View} 

The Gantt View (\autoref{fig:teaser}(f)) represents resource state over time as rows and intervals in time as rectangular bars on the resources on which they executed. This view supports cross cutting sub-goals CC.1 and CC.2, correlating intervals and resources with time, as well as G5.1, correlating intervals with resources. We label resources by their CPU and thread ID as $core\ ID-thread\ ID$. In addition to panning and zooming in time, users can pan and zoom over the space of resources. 

Users can select an individual interval on click, which will highlight the interval in yellow and update the Selection Info View and Utilization View. Additionally, parent-child relationships related to the selected interval will be shown using yellow lines drawn between the bars (\autoref{fig:gantt}). By showing these relationships, we support G3.2, following hot paths, and G4, understanding runtime decisions. We chose to show these relationships on-demand-only because showing all of them is infeasible to interpret.

%uses a series of rectangular bars to show the amount of task execution being done in certain periods of time at a particular location (in this case CPU thread or core). Here at x-axis is time in nanoseconds. The y-axis represents CPU core and threads presented as $core\ number-thread\ number$. This view shows a task execution as an interval bar using a rectangle. Clicking on an interval bar will highlight that with yellow color. Its possible to zoom-in and zoom-out horizontally by scrolling in the gantt view. Scrolling in the y-axis will zoom vertically over the CPU core-thread locations. It also supports panning by clicking and dragging in both horizontally and vertically. In~\autoref{fig:gantt}, the yellow lines represent parent-child dependency.
%

\subsubsection{Aggregated Gantt View.} 

The Aggregated Gantt View (\autoref{fig:teaser}(h)) provides a temporal layout to meaningful groups of intervals, as defined by the execution tree of the program. It is populated using the Dependency Tree View which we describe in \autoref{subsec:dependencytree}. The Aggregated Gantt View provides a simplified view at a higher level of abstraction than individual intervals of the Gantt View but a more detailed level of abstraction than the aggregated primitives of the execution tree, further supporting the correlation of primitives in time (cross-cut sub-goal CC3).

Each bar in the Aggregated Gantt View represents a specific instance of a primitive created by a sequence of dependencies. For example, consider a primitive {\tt block} of code within a {\tt for} loop. Though there are several {\tt block}s throughout the program, the chain of dependencies leading to a particular {\tt block} uniquely defines it in comparison to the others. Because it is in a {\tt for} loop, it runs $k$ times. If shown in the Aggregated Gantt View, the {\tt block} will generate $k$ bars, showing where each was executed in time. 

Rather than showing only the {\tt block} interval, new aggregated intervals are created from all the intervals originally spawned by that particular {\tt block} instance, in other words, any interval the {\tt block} was an ancestor of. The horizontal position and length of each bar shows the starting time of its first interval and the ending time of its last. Because the different intervals spawned by the {\tt block} may occur on different resources, we cannot assign it to a single resource. Instead, we lay out the bars in a greedy fashion to avoid collision. Thus, the vertical position shows how many of these bars (e.g., loop iterations) run concurrently. 

Within each aggregated bar, we draw a yellow area chart showing the utilization due to that bar. The background of each bar is shaded in purple with the subsumed intervals in the main Gantt chart colored the same shade, aiding users in correlating intervals with primitives (sub-goal G2.4).

%a single aggregated rectangle to represent all dependent tasks which gets aggregated by a primitive. Here, overlapped aggregated bars are presented with an additional row and color coded with different shades of purple color. Interval bars in the gantt view are also being colored with the same shade of purple corresponding to the aggregated bar (to which these bars belong to) in the aggregated gantt view. The task name is also written with each aggregated bar and associated CPU utilization is drawn within the aggregated bar.


\subsubsection{Functional Box Plot and Line Chart Views} 

As explained in \autoref{sec:data}, performance counter (metric) data can be collected along with the trace in one of two ways: sampled with the interval events or sampled in time. Performance counters describe some attribute of the resource on which they are sampled. Traveler offers two views to show these metrics in time, supporting cross-cut sub-goal CC.2, correlating resource use with time. Furthermore, since these views are linked with the Gantt View and multiple of each of these views may opened with different performance counters, they also support correlating resource use with resource use, sub-goal G5.2.

As performance counter data may be sampled irregularly, they are more meaningfully represented as a rate. For a consecutive $(time_1, value_1)$ and $(time_2, value_2)$ pairs where $time_1 > time_2$, the rate is calculated as, $rate=\frac{value_1-value_2}{time_1-time_2}$. We use this derived rate in our performance counter views.

The Functional Box Plot view summarizes performance counter rates across resources. We draw three lines representing the maximum value across resources, the minimum, and the average. A shaded gray area around the average shows a standard deviation. \autoref{fig:teaser}(g) shows the Functional Box Plot view for the  PAPI (Performance Application Programming Interface)~\cite{browne2000portable} metric CPU cycles. A simple line chart view (\autoref{fig:line_chart}) is also available for sampled OS-level data, such as reported CPU Idle percentage.

\begin{figure}[h!]
    \centering
    \includegraphics[width=3.5in]{figures/line.JPG}
    \caption{CPU Idle percentage is represented in the Line chart view.
    }
    \label{fig:line_chart}
\end{figure}

%

%
%
\subsection{Non-temporal views}
\label{subsec:non_temporal}

Traveler has four non-temporal views: the Dependency Tree (execution tree) View, an Interval Histogram View, a Source Code View, and a Selection Info View. We have previously described the Source Code View and Selection Info View. We discuss the other two views below.

\subsubsection{Dependency Tree View} 
\label{subsec:dependencytree}
The Dependency Tree view is the native view for primitives. We leverage this knowledge and design from Atria. It is a node-link tree visualization where every node represents a distinct primitive call as defined by its dependencies (e.g., the yellow lines in the Gantt View). As an example, a {\tt while} primitive may be generated from multiple places in the source code. By defining the sequence of tasks that generated a particular {\tt while} interval, we can group all {\tt while} primitives associated with the same overall action in the code. This is similar to a calling context tree in serial or synchronous programs. The difference is that the parent node---the primitive that created the child node---need not wait for its children to complete. 

The Dependency Tree View is also an expression tree describing how the source code is transformed into task types with dependencies which are then scheduled for execution. Each node in the Dependency Tree View represents numerous intervals all with the same primitive type and context. As we build the Dependency Tree View from the interval dependencies found in the trace, we can also derive aggregate metrics for the total time attributable to each node. We use a purple value ramp to indicate this aggregated time value, supporting subgoals G3.1-G3.4 in the same way Atria did.

Selecting a node in the Dependency Tree View will highlight the corresponding intervals in the Gantt View, draw a highlighted area on the Utilization View showing utilization due to the node, and generate the corresponding bars in the Aggregated Gantt View. This linking supports the cross-cutting subgoal CC3, correlating primitives with time. The link to the Gantt chart in particular also supports subgoal G2.4, relating primitives to intervals.

As the execution tree can get quite large, some primitive names are available on hover rather than labeling them all. We also only draw the first five levels of the tree by default. Users can collapse or expand subtrees by clicking the arrow in the upper right of each node. 


%There could be a dependency between some tasks, like a function calls to another function and it could be instrumented as a parent child relationship between these tasks (yellow lines in the gantt view in~\autoref{fig:gantt}). The task dependency tree shows this parent-child relationship as a tree and makes it easier to navigate through each task. Now, after aggregating tasks by the subtree rooted at a specific node of this tree, it is being visualized in the aggregated gantt view (\autoref{fig:teaser}(h)). Clicking on different nodes in the task dependency tree will show the aggregated tasks in the aggregated gantt view, highlight the related interval bars in the gantt view and update highlighting in the utilization view. In the dependency tree view, clicking on the left arrow icon will collapse the subtree into a single node (associated node of the clicked arrow) and turn that arrow into a right arrow. Clicking on the right arrow will expand and show all the nodes in the subtree rooted at the associated node. Hovering over each node will show the associated task name. Nodes are shaded according to their total occurrence count (darker for higher occurrences).


\subsubsection{Interval Histogram View} 

The Interval Histogram View (\autoref{fig:teaser}(b)) shows intervals binned by their duration. By default, all intervals are shown. A dropdown menu enables filtering to a particular primitive context as in the Dependency Tree view. Bins in the histogram can be selected via brushing. When selected, all intervals contributing to a bin will be highlighted in the Gantt View and Utilization View. This view directly supports the sub-goals G3.5 and G3.6, analyzing the interval distribution and finding extreme intervals. 


%The interval histogram view (\autoref{fig:teaser}(b)) shows the count of intervals of a specific duration or length. Here, the y-axis shows the count and x-axis is the durations. This view allows clicking and draging a brush, and consequently in the gantt view, all the interval bars having length within the brushed duration will get highlighted. The highlighting in the utilization view also gets updated to show the overview of the intervals of the selected durations. With this, it is possible to find out the longest interval bars, as well as the shortest ones. 
%


% \subsection{Informative Views}
%{\bf Selection Info View.} The selection info view (\autoref{fig:teaser}(c)) displays all the related information of the execution. Clicking on an interval bar in the gantt view will highlight (in yellow color) that interval bar in the gantt view and corresponding utilization in the utilization view. The Selection Info View will show all of its relevant information.
%
%{\bf Code View.} The code view (\autoref{fig:teaser}(d)) displays the actual code which was used to generate the trace data. Traveler supports code preview written in Python, C++, and PhySL.


\subsection{Implementation}
\label{subsec:implementation}
% \note{Sayef please describe the implementation of Traveler, specifically the languages used and any major libraries used, e.g., the tabbing system. You also want to discuss the client-server setup and perhaps the bundling. If you haven’t discussed the summed area tables yet, here’s where you do it}

%the implementation of Traveler,
Traveler is a web-based client-server application. It uses a Uvicorn server that communicates with the front-end using {\tt fastapi} in a RESTful manner. The back-end pre-processes the OTF2 file, building all data structures needed for data look up and fast rendering and storing them using DiskCache~\cite{diskcache}. Additionally, the back-end renders the primary drawing space of all temporal views as well as the Interval Histogram View for displaying on the front end using HTML5 Canvas. Axes and brushes are implemented on the front-end in Javascript using D3~\cite{bostock2011d3}.

\subsubsection{Data Structures}

We used {\em summed area tables} as a data structure to enable fast generation of the temporal and histogram views and we used an {\em interval tree} for fast lookup of data attributes for the Selection Info View. These data structures are calculated at the time the data is initially given to Traveler, in a process we call {\em bundling}. Bundled datasets are saved by Traveler so the pre-processing step only occurs once. 

% THis looks good to me :)
Specifically we pre-calculate summed area tables for CPU utilization, hardware counters, and duration count for each of the thread-core location and primitives, both individually and combined. When the front-end sends a request with the number of pixels available and the time range selected, we use the relevant summed area tables to generate a bitmap of pixel values which are rendered on the front end using HTML canvas. Retrieving new bitmap information induces latency, so we overdraw to hide this overhead when the user pans the view. "

## Assistant

Here’s a dissertation-style LaTeX version of the section you provided. I’ve kept the academic tone consistent with Chapter 3, cleaned transitions, and emphasized connections to your methodology and design goals.  

```latex
\section{Traveler}
\label{sec:traveler}

We now turn to the design of Traveler (\autoref{fig:teaser}), a visualization platform created for the performance analysis of task parallel execution traces. This system embodies the design principles and methodological framing described in \autoref{sec:process}, extending them into a concrete implementation that supports diverse user tasks and complex data requirements. In what follows, we first provide an overview of Traveler’s multiple coordinated views and the rationale for their design (\autoref{sec:travelerstrategy}). We then describe the temporal and non-temporal views in detail, linking them to the task analysis outlined earlier. Finally, we discuss implementation choices and the underlying data structures that make the system responsive and scalable. This section therefore bridges the conceptual framing of the design process with its technical realization, establishing the foundation for the evaluation and discussion in later sections.

\subsection{An Overview of Traveler Views}
\label{sec:travelerstrategy}

To support the heterogeneous data and numerous analytic tasks identified in \autoref{sec:process}, Traveler is designed as a configurable multiple coordinated view (MCV) system. The interface allows users to flexibly resize, arrange, hide, and close views as needed, enabling them to adapt the visualization workspace to their analysis goals.

Traveler provides nine distinct types of views, with the possibility of instantiating several of them multiple times using different facets of the data. Of these, three can be considered the {\em native} representations of the four fundamental data item types in execution traces. Intervals and resource states are shown together in a Gantt View, following the most established idiom for execution traces. Primitives are represented within a node-link diagram that depicts the execution tree, a design informed by the Atria system~\cite{williams2020movingtarget}. Source code, as the fourth data type, is displayed in its native text format with syntax highlighting (\autoref{fig:teaser}(d)).

Complementing the detailed Gantt chart, Traveler includes two additional temporal views that present higher-level abstractions: a Utilization View and an Aggregated Gantt View. These provide summaries of behavior across groups of tasks, thereby enabling analyses that would otherwise be obscured by the fine granularity of individual events. Furthermore, Traveler incorporates two additional temporal metric views---a line chart and a functional box plot---to display interval- and resource-level attributes. Finally, a histogram view of interval durations provides both a distributional overview and a navigation mechanism into the trace data. 

Information about selections made within any of these views is communicated through the Selection Info View (\autoref{fig:teaser}(c)), which reports attributes and contextual details of selected intervals or primitives. In aggregate, this ensemble of coordinated views enables analysts to approach execution traces from multiple perspectives, transitioning fluidly between low-level details and high-level abstractions.

\subsection{Temporal Views}
\label{subsec:temporal_views}

Five views in Traveler use time as the horizontal axis: the standard Gantt chart, the novel Aggregated Gantt chart, the Utilization View, and two metric-based visualizations (the Line Chart and the Functional Box Plot). Among these, the Utilization View provides a fixed overview of the entire execution trace, while all other temporal views support linked panning, zooming, and random access through brushing in the Utilization View. This design ensures that temporal exploration remains synchronized across representations, allowing users to correlate details with broader temporal patterns.

\subsubsection{Utilization Overview} 
\label{subsec:utilization}

The Utilization View (\autoref{fig:teaser}(e)) displays total resource utilization over time using an area chart. The vertical axis encodes the proportion of active resources, normalized by the maximum possible utilization. This design directly supports goal G5 (understanding utilization) and cross-cutting sub-goal CC.2 (correlating resource use with time). 

Beyond providing an overview, the Utilization View functions as a navigation aid. An interactive rectangular brush controls the temporal domain shown in other views, thereby supporting abstract/elaborate and reconfigure tasks. Additionally, when intervals or groups of primitives are selected in other views, a secondary yellow area is drawn to represent the utilization attributable to those selections. This interaction supports CC.1 and CC.3, linking temporal utilization patterns to specific intervals and primitives.

\begin{figure}[h!]
    \centering
    \includegraphics[width=3.5in]{figures/gantt.jpg}
    \caption{Gantt View representing parent-child dependency between two intervals. The highlighted yellow interval bar $b$ has parent $a$. Interval $b$ has three children\textemdash $c$, $d$, and $e$.}
    \label{fig:gantt}
\end{figure}

\subsubsection{Gantt View} 

The Gantt View (\autoref{fig:teaser}(f)) represents resource states as rows and intervals as rectangular bars. Resources are labeled by CPU and thread identifiers, denoted as $core\ ID-thread\ ID$. The view supports panning and zooming both in time and across the resource axis. Selection of an interval highlights it in yellow and updates the Selection Info and Utilization Views. Parent-child relationships are shown on demand through yellow dependency lines (\autoref{fig:gantt}), enabling users to follow hot paths (G3.2) and reason about runtime scheduling decisions (G4). This selective strategy avoids visual clutter while maintaining interpretability.

\subsubsection{Aggregated Gantt View} 

The Aggregated Gantt View (\autoref{fig:teaser}(h)) provides an abstraction level between the fine-grained Gantt chart and the execution tree. Each aggregated bar corresponds to an instance of a primitive defined by its unique dependency context. For example, a code {\tt block} within a {\tt for} loop spawns multiple intervals; the Aggregated Gantt View groups these by instance, displaying their execution spans and concurrency patterns. Bars are laid out greedily to avoid overlap, with utilization encoded as yellow area charts and purple shading used to link aggregated intervals with their counterparts in the main Gantt chart. This design supports G2.4 and CC3, correlating primitives with intervals and temporal patterns.

\subsubsection{Functional Box Plot and Line Chart Views} 

Traveler also supports the visualization of performance counter data collected alongside the trace. Counters are sampled as values over time, which are converted into rates for meaningful comparison. The Functional Box Plot summarizes these rates across resources, displaying maximum, minimum, and average values, with a shaded deviation band (\autoref{fig:teaser}(g)). The Line Chart (\autoref{fig:line_chart}) presents sampled system-level metrics such as CPU Idle percentage. Together, these views support CC.2 and G5.2 by enabling correlations between resource usage patterns and counter metrics.

\begin{figure}[h!]
    \centering
    \includegraphics[width=3.5in]{figures/line.JPG}
    \caption{CPU Idle percentage shown in the Line Chart view.}
    \label{fig:line_chart}
\end{figure}

\subsection{Non-temporal Views}
\label{subsec:non_temporal}

Four views in Traveler are not directly temporal: the Dependency Tree View, the Interval Histogram View, the Source Code View, and the Selection Info View. The Source Code and Selection Info views were introduced above; here we discuss the two structural summaries.

\subsubsection{Dependency Tree View} 
\label{subsec:dependencytree}

The Dependency Tree View is the native representation of primitives, following design precedents from Atria. Each node in the tree corresponds to a primitive call as defined by its dependency context, akin to a calling context tree but adapted to asynchronous parallel execution. The tree thus expresses how source code constructs are transformed into task types with dependencies. Nodes aggregate numerous intervals of the same primitive type, with a purple ramp encoding total execution time. Interaction is tightly linked: selecting a node highlights intervals in the Gantt chart, shows utilization contributions, and generates bars in the Aggregated Gantt View, thereby supporting CC3 and G2.4. To manage scale, Traveler displays five levels by default, with options to collapse or expand subtrees.

\subsubsection{Interval Histogram View} 

The Interval Histogram View (\autoref{fig:teaser}(b)) displays intervals grouped by duration. Users may filter by primitive type and select bins via brushing. This interaction highlights corresponding intervals in the Gantt and Utilization Views, directly supporting goals G3.5 and G3.6 by enabling the analysis of distributional properties and the identification of extreme intervals.

\subsection{Implementation}
\label{subsec:implementation}

Traveler is implemented as a web-based client-server system. The back-end, built on {\tt fastapi} and served with Uvicorn, preprocesses OTF2 trace files into optimized data structures stored with DiskCache~\cite{diskcache}. The server generates bitmaps for temporal and histogram views, rendered on the client using HTML5 Canvas. Axes and brushes are implemented with D3~\cite{bostock2011d3}. This division allows heavy computation to remain server-side while ensuring fluid interactivity client-side.

\subsubsection{Data Structures}

To achieve scalability and responsiveness, Traveler employs two key data structures. First, {\em summed area tables} are precomputed for utilization, hardware counters, and interval duration counts across cores and primitives. These tables allow the server to generate pixel-level aggregates for arbitrary time windows efficiently, enabling responsive temporal rendering. Second, an {\em interval tree} supports fast lookup of attributes for selections, powering the Selection Info View. Together, these structures are generated in a preprocessing stage called {\em bundling}, which is performed once per dataset and cached for reuse. This strategy minimizes latency and supports interactive navigation across large traces.

```

Would you like me to also **add explicit tie-back sentences at the very end** of this section (similar to how we did for \autoref{sec:process}), so that it transitions neatly into the upcoming “Evaluation” section?
