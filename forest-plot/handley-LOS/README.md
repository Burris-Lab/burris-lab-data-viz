# README

## Forest plots for Handley et al. 2021 & 2022 length of stay studies

Resources in this folder reproduce the forest plot figures that accompany the following length of stay studies by Handley et al.:

- Handley et al. 2021: [Birth Hospital Length of Stay and Rehospitalization During COVID-19 | Pediatrics | American Academy of Pediatrics](https://publications-aap-org.proxy.library.upenn.edu/pediatrics/article/149/1/e2021053498/183458/Birth-Hospital-Length-of-Stay-and)
- Handley et al. 2022: [Postpartum Length of Stay and Hospital Readmission Before and During the Coronavirus Disease 2019 (COVID-19) Pandemic: Obstetrics & Gynecology](https://journals.lww.com/greenjournal/Fulltext/2022/03000/Postpartum_Length_of_Stay_and_Hospital_Readmission.5.aspx)

The original R code written by Heather Burris was adapted for an R Markdown file by Silvia Canelón.

- Original R script is `Maternal paper figures r code20211117.R`
- R Markdown file is `forest-plot-handley-LOS.Rmd`.

To view a **step-by-step code-through** of the R code used to produce the forest plots, check out [the rendered HTML file](https://spcanelon.github.io/burris-lab-data-viz/forest-plot/handley-LOS/forest-plot-handley-LOS.html) online.

You can find the R Markdown file along with the original R script, data, and plot files organized in the `handley-LOS` folder. Each is organized according to the directory tree below.

The R Markdown file and the corresponding HTML file are found at the root of the "handley-LOS" folder. Code can be found in the "code" folder, data in the "data" folder", and plot files in the "output" folder.

```
.
├── Burris Lab Data Viz Resources
└── forest-plot
    └── handley-LOS
        ├── README.md
        ├── forest-plot-handley-LOS.Rmd
        ├── forest-plot-handley-LOS.html
        ├── code
        ├── data
        └── output

```

Detailed directory tree:

```
.
├── Burris Lab Data Viz Resources
└── forest-plot
    └── handley-LOS
        ├── README.md
        ├── forest-plot-handley-LOS.Rmd
        ├── forest-plot-handley-LOS.html
        ├── code
        │   └── Maternal paper figures r code20211117.R
        ├── data
        │   ├── Data for Figure of mat readmit1121.csv
        │   └── dataforLMatLOS1121.csv
        └── output
            ├── PlotsSara_cosmos_fig_LOSONLY2noannote1.tiff
            ├── PlotsSara_cosmos_fig_MATERNALreadmitONLY2noannote1.tiff
            ├── bPlotsSara_cosmos_fig_MATERNALLOSONLY3withEE.tiff
            ├── cPlotsSara_cosmos_fig_MATERNALBOTH3withee.tiff
            └── cPlotsSara_cosmos_fig_MATERNALreadmitONLY3withee.tiff
```

## Direct links

- Forest plots for Handley 2021 & 2022 papers: https://burris-lab.github.io/burris-lab-data-viz/forest-plot/handley-LOS/forest-plot-handley-LOS.html
