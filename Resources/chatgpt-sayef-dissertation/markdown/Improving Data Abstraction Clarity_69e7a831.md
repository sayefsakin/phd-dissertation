# Improving Data Abstraction Clarity

*2026-04-21 16:41 UTC*

## User

In the discussion chapter, in the section "Relating Visual Data Abstraction with Data Format", I wrote the following 
```
To apply this lesson in practice, we recommend identifying \textit{visual data abstraction} and \textit{data format} and iteratively updating both to relate with each other as closely as possible. Stakeholder engagement and domain characterization~\cite{munzner2009nested, Sedlmair2012}, revealing latent data abstractions~\cite{bigelow2020guidelines}, data reconnaissance and task wrangling~\cite{crisan2019uncovering}, and data-first strategy~\cite{oppermann2020data} are utilized to identify \textit{visual data abstraction}. \textit{Data formats} are identified by profiling the raw data landscape like determining structural organization (flat tables, nested hierarchies, multi-table collections, temporal sequences, or graphs), enumerating attribute types, ranges, and edge cases, and documenting how data flows between system components such as databases, query managers, and rendering layers~\cite{kandel2011research, battle2020structured, yang2024optimizing}. Finally, to relate the visual abstraction to the format, the gap between the two is enumerated as syntactic, structural, or semantic transformation requirements, and the data architecture is adapted, through schema redesign, query API restructuring, or data structure selection, so that the format natively mirrors the visual abstraction and minimizes inter-component conversion~\cite{kandel2011research, walny2019data, kasica2020table, battle2020structured, yang2024optimizing, bigelow2020guidelines}. Where format and abstraction cannot be aligned at the storage level, dedicated middleware architectures can coordinate between the visualization specification and the backend data system~\cite{battle2020structured, heer2023mosaic, yang2024optimizing}; and where domain partners must be brought into the alignment process~\cite{williams2023data}, the guidelines of Bigelow et al.~\cite{bigelow2020guidelines} provide a framework for negotiating which latent abstractions to reveal and at what cost.
```

This paragraph seems unreadable. The logical flow of what should be done does not come through and there is a lot of jargon. For example, early on it has a list of terms like 'data-first strategy' and 'data reconnaissance' without explaining what those methods are and how they are supposed to help with the problem. A person reading this paragraph is unlikely to be able to do anything as the suggestions are not clear. The verb tenses within this paragraph are also confusing. I cannot tell what is happening passively, what you have done, or what a person is supposed to do. You might also want to split this into multiple paragraphs.

## Assistant

```tex
To apply this lesson in practice, we recommend treating \textit{visual data abstraction} and \textit{data format} as two design decisions that should be developed together. Rather than fixing one first and adapting the other later, designers should iteratively refine both until the stored data structure closely supports the intended visual representation.

The first step is to identify the \textit{visual data abstraction}: the data model required by the visualization. This can be done through stakeholder interviews, domain characterization, and task analysis to understand what users need to see and do~\cite{munzner2009nested,Sedlmair2012}. Additional methods such as examining existing workflows, exploring the raw data, and identifying hidden relationships or aggregates can help reveal latent abstractions that are not immediately visible in the source data~\cite{crisan2019uncovering,bigelow2020guidelines,oppermann2020data}. For example, a collection of event logs may need to be reframed as timelines, hierarchies, or networks depending on the analytical goals.

The second step is to identify the current \textit{data format}: how the data is actually stored, organized, and transmitted. This includes determining whether the data exists as flat tables, nested records, graphs, temporal sequences, or multiple linked tables, and documenting how it moves through databases, APIs, query engines, and rendering pipelines~\cite{kandel2011research,battle2020structured,yang2024optimizing}.

The final step is to compare the abstraction with the format and identify mismatches. These mismatches may be syntactic (different field names or encodings), structural (tabular data that must be converted into hierarchies or graphs), or semantic (missing derived concepts needed for analysis). Once identified, the data architecture can be revised through schema redesign, query interface changes, preprocessing pipelines, or alternative data structures so that the format more directly supports the visualization and reduces repeated transformations during interaction~\cite{kandel2011research,walny2019data,kasica2020table,battle2020structured,yang2024optimizing,bigelow2020guidelines}.

When storage-level alignment is not feasible, middleware layers can translate between backend systems and visualization requirements at runtime~\cite{battle2020structured,heer2023mosaic,yang2024optimizing}. When these changes require negotiation with domain collaborators, participatory design methods can help determine which abstractions are most valuable and what trade-offs are acceptable~\cite{williams2023data,bigelow2020guidelines}.
```

## User

Here, I provided the bibtex for the citations that is used in this paragraph
The BibTeX references used in the above quoted paragraph are,



```
@article{munzner2009nested,
  title={A nested model for visualization design and validation},
  author={Munzner, Tamara},
  journal={IEEE transactions on visualization and computer graphics},
  volume={15},
  number={6},
  pages={921--928},
  year={2009},
  publisher={IEEE}
}

@article{Sedlmair2012,
    author = {Sedlmair, Michael and Meyer, Miriah and Munzner, Tamara},
    title = {Design Study Methodology: Reflections from the Trenches and the
	Statcks},
    journal = {IEEE Trans. on Vis. and Comp. Graphics},
    volume = {18},
    number = {12},
    pages = {2431--2440},
    year = {2012},
}

@inproceedings{crisan2019uncovering,
  title={Uncovering data landscapes through data reconnaissance and task wrangling},
  author={Crisan, Anamaria and Munzner, Tamara},
  booktitle={2019 IEEE Visualization Conference (VIS)},
  pages={46--50},
  year={2019},
  organization={IEEE}
}

@article{bigelow2020guidelines,
  title={Guidelines for pursuing and revealing data abstractions},
  author={Bigelow, Alex and Williams, Katy and Isaacs, Katherine E},
  journal={IEEE Transactions on Visualization and Computer Graphics},
  volume={27},
  number={2},
  pages={1503--1513},
  year={2020},
  publisher={IEEE}
}

@inproceedings{oppermann2020data,
  title={Data-first visualization design studies},
  author={Oppermann, Michael and Munzner, Tamara},
  booktitle={2020 IEEE Workshop on Evaluation and Beyond-Methodological Approaches to Visualization (BELIV)},
  pages={74--80},
  year={2020},
  organization={IEEE}
}

@article{kandel2011research,
  title={Research directions in data wrangling: Visualizations and transformations for usable and credible data},
  author={Kandel, Sean and Heer, Jeffrey and Plaisant, Catherine and Kennedy, Jessie and Van Ham, Frank and Riche, Nathalie Henry and Weaver, Chris and Lee, Bongshin and Brodbeck, Dominique and Buono, Paolo},
  journal={Information visualization},
  volume={10},
  number={4},
  pages={271--288},
  year={2011},
  publisher={SAGE Publications Sage UK: London, England}
}

@article{battle2020structured,
  title={A structured review of data management technology for interactive visualization and analysis},
  author={Battle, Leilani and Scheidegger, Carlos},
  journal={IEEE Trans. on Vis. \& Comp. Graphics},
  volume={27},
  number={2},
  pages={1128--1138},
  year={2020},
  publisher={IEEE}
}

@article{yang2024optimizing,
  title={Optimizing dataflow systems for scalable interactive visualization},
  author={Yang, Junran and Joo, Hyekang Kevin and Yerramreddy, Sai and Moritz, Dominik and Battle, Leilani},
  journal={Proceedings of the ACM on Management of Data},
  volume={2},
  number={1},
  pages={1--25},
  year={2024},
  publisher={ACM New York, NY, USA}
}

@article{kandel2011research,
  title={Research directions in data wrangling: Visualizations and transformations for usable and credible data},
  author={Kandel, Sean and Heer, Jeffrey and Plaisant, Catherine and Kennedy, Jessie and Van Ham, Frank and Riche, Nathalie Henry and Weaver, Chris and Lee, Bongshin and Brodbeck, Dominique and Buono, Paolo},
  journal={Information visualization},
  volume={10},
  number={4},
  pages={271--288},
  year={2011},
  publisher={SAGE Publications Sage UK: London, England}
}

@article{heer2023mosaic,
  title={Mosaic: An architecture for scalable \& interoperable data views},
  author={Heer, Jeffrey and Moritz, Dominik},
  journal={IEEE Transactions on Visualization and Computer Graphics},
  year={2023},
  publisher={IEEE}
}

@inproceedings{williams2023data,
  title={Data abstraction elephants: The initial diversity of data representations and mental models},
  author={Williams, Katy and Bigelow, Alex and Isaacs, Katherine E},
  booktitle={Proceedings of the 2023 CHI Conference on Human Factors in Computing Systems},
  pages={1--24},
  year={2023}
}
```
You may add additional inline citations if needed. Shorten the entire discussion. Remove em-dash and any indication that this is written by AI (Humanize this).

## Assistant

```tex id="r4m2te"
To apply this lesson in practice, \textit{visual data abstraction} and \textit{data format} should be designed together rather than treated as separate decisions. The goal is to iteratively refine both so that the stored data organization directly supports the intended visualization.

First, identify the \textit{visual data abstraction}: the data representation needed for the tasks users want to perform. This can be informed by stakeholder discussions, domain analysis, and task analysis to understand what users need to see and compare~\cite{munzner2009nested,Sedlmair2012}. Examining existing workflows and exploring the source data can also reveal useful abstractions that are not explicit in the raw data, such as hierarchies, timelines, or relationships~\cite{crisan2019uncovering,bigelow2020guidelines,oppermann2020data}.

Next, identify the current \textit{data format}: how data is stored and passed through the system. This includes whether the data is organized as tables, nested records, graphs, temporal sequences, or multiple linked sources, and how it moves through databases, APIs, and rendering pipelines~\cite{kandel2011research,battle2020structured,yang2024optimizing}.

Then compare the abstraction with the format and locate mismatches. These may be syntactic differences, structural differences, or missing derived concepts needed for analysis. Addressing them may require schema redesign, preprocessing, query changes, or different data structures so that the format more naturally supports the visualization and reduces repeated transformations during interaction~\cite{kandel2011research,walny2019data,kasica2020table,battle2020structured,yang2024optimizing}.

If storage-level alignment is not practical, middleware can translate between backend systems and visualization needs at runtime~\cite{battle2020structured,heer2023mosaic,yang2024optimizing}. When changes require collaboration with domain partners, participatory approaches can help decide which abstractions are most valuable and feasible to support~\cite{williams2023data,bigelow2020guidelines}.
```

## User

For the last paragraph, I wrote it as follows
"Once identified, address the mismatch between abstraction and format through schema redesign~\cite{kandel2011research}, query API restructuring~\cite{walny2019data}, or data structure selection~\cite{battle2020structured, yang2024optimizing}, ensuring the chosen format aligns with the visual abstractions and minimizing conversion overhead. When format and abstraction cannot be aligned due to practical constraints, utilize dedicated middleware to coordinate between the visualization specification and the backend data system, as in the Mosaic architecture~\cite{heer2023mosaic}. Designers can involve domain collaborators to prioritize certain abstractions or formats over others. However, even collaborators can hold diverse mental model of same data~\cite{williams2023data}."

Suggest a concluding sentence where it will tell guidelines proposed by Bigelow et al.~\cite{bigelow2020guidelines} shouled be followed, include specific guideline from that paper and how that helps.

## Assistant

A useful conclusion is to follow the guidelines of Bigelow et al.~\cite{bigelow2020guidelines}, particularly to make abstractions explicit, compare alternative representations, and communicate the trade-offs of each choice with stakeholders; doing so helps reconcile differing mental models, supports informed design decisions, and leads to formats that better match visualization needs.
