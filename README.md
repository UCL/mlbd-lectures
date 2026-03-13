# SPCE0038: Machine Learning with Big Data lecture material

This repository contains the lecture material delivered by
[UCL Centre for Advanced Research Computing (ARC)](https://www.ucl.ac.uk/arc) staff for the
[UCL module _Machine Learning with Big Data_ (SPCE0038)](https://www.ucl.ac.uk/module-catalogue/modules/machine-learning-with-big-data-SPCE0038).

The lectures are written as [Quarto](https://quarto.org/) documents and deployed as a [Quarto website](https://quarto.org/docs/websites/)
on GitHub Pages.
Each lecture document contains the material to render to both revealjs slides and HTML notes.
Each lecture document is also rendered as a Jupyter notebook to allow running code examples locally.
The lecture document `.qmd` Quarto Markdown source files are in the `lectures` directory,
along with a series of Lua Pandoc filters used to customise the rendering of the documents to different formats
(primarily dealing with allowing having both slide content and notes in the same source document)
as well as a custom title slide template partial and associated CSS styling rules.

## Authors

The lecture material in this repository was originally written as a series of Jupyter notebooks by
[Anastasis Georgoulas](https://uk.linkedin.com/in/anastasis-georgoulas-265b12167), who delivered the lectures from 2020-2022.
[Matt Graham](https://matt-graham.github.io) subsequently took over delivering the ARC lecture material
and has made a series of updates and additions to lectures as well as porting them to Quarto.

## Pandoc filters

`remove-pause.lua`: Removes the textual representation of any `. . .` instances in rendered output which are not of a slide format (for example revealjs) with the `. . .` syntax being used to introduces 'pauses' which separate slide content in to separate fragments.

`incremental-stack.lua`: In slide formats (for example revealjs) parses any div blocks with an `incremental-stack` class such that each child block element is displayed as a separate fragment which sequentially stack on top of each other, making use of the styling applied to the built-in Quarto `r-stack` class.
This can be used to gradually show portions of a larger section of text on a slide alongside an accompanying figure while having the text flow continuously in non-slide output.

`remove-slide-only.lua`: In non-slide formats removes any div blocks with a `slides-only` class. Used to mark content which should only appear on slides.
Content in div blocks with a `notes` class will be rendered to speaker notes as a built-in Quarto feature,
and these divs are also included in other output formats by default.

## Dependencies

To build the Quarto website locally you will need to install

- [Quarto](https://quarto.org/docs/get-started/) (tested with version 1.9.33),
- [GraphViz](https://graphviz.org/download/) (required for visualizing `dask` graphs),
- Python (tested with version 3.14.3),
- R (tested with version 4.5.3),
- git, with default branch name assumed to be configured to `main`.

Although all of the code samples are in Python or bash, R is required as the knitr Quarto engine is used to build the _Data version control I_ lecture document,
as the knitr provides support for executable `{bash}` code cells that importantly persist shell state including the working directory across the commands in each cell.
The R packages required for knitr engine to work appear to be `knitr`, `rmarkdown` and `withr`.

The Python dependencies required for running all the code cells in the lecture documents are specified in the [`requirements.txt`](requirements.txt) file.

## Building

To build the website locally run

```
quarto render 
```

from the root directory of the repository.

To render and preview the website including all formats (HTML, revealjs, Jupyter notebook) run

```
quarto preview --render all
```

from the root directory of the repository.

## License

The lecture material in this repository is openly licensed via a [Creative Commons Attribution-ShareAlike 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/).
