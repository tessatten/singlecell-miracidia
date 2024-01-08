# singlecell-miracidia
This contains all the scripts associated with the paper: A single-cell atlas of the miracidium larva of the human blood fluke Schistosoma mansoni: cell types, developmental pathways and tissue architecture

1. ###import_QC_sample1_v10.Rmd: import and QC miracidia sample 1
2. ###import_QC_sample2_v10.Rmd: import and QC miracidia sample 2
3. ###import_QC_sample3_v10.Rmd: import and QC miracidia sample 3
4. ###import_QC_sample4_v10.Rmd: import and QC miracidia sample 4
5. ###clean_integration.Rmd: combine and integrate the four samples
6. ###pre_mira_sample1_fromscvelo.Rmd: prep and QC miracidia sample 1 mapped with kb-tools
7. ###pre_mira_sample2_fromscvelo.Rmd: prep and QC miracidia sample 2 mapped with kb-tools
8. ###pre_mira_sample3_fromscvelo.Rmd: prep and QC miracidia sample 3 mapped with kb-tools
9. ###pre_mira_sample4_fromscvelo.Rmd: prep and QC miracidia sample 4 mapped with kb-tools
10. ###prep_all_mira_for_scvelo.Rmd: combine mira samples (and with sporocyst samples) for velocity analysis
11. ###prep_sporo_sample34.Rmd: prep and QC sporocyst sample 1 mapped with kb-tools
12. ###prep_sporo_sample35.Rmd: prep and QC sporocyst sample 2 mapped with kb-tools
13. ###prep_sporo_sample36.Rmd: prep and QC sporocyst sample 3 mapped with kb-tools
14. ###prep_sporo_sample37.Rmd: prep and QC sporocyst sample 4 mapped with kb-tools
15. ###prep_all_sporo_for_scvelo.Rmd: combine sporocyst samples for velocity analysis
16. ###TopGO_mira_v10.R: Script to run TopGO analysis in miracidia samples
17. ###go_analysis_miracidia.Rmd: prep and visualise GO analysis
18. ###figures_nov23.Rmd: generating additional figures
19. ###paper_miracidia_no_WSR.Rmd: analysis and visualisation without WSR genes
20. ###paper_miracidia_no_ZSR.Rmd: analysis and visualisation without ZSR genes
21. ###paper_miracidia_no_WSR._no_ZSR.Rmd: analysis and visualisation without WSR or ZSR genes
22. ###paper_miracidia_no_gametologues.Rmd: analysis and visualisation without gametologue genes
23. ###paper_miracidia_no_ZSR_with_gameto.Rmd: analysis and visualisation without ZSR but with gametologue genes
24. ###mira-v10-neuron1.ipynb: SAM analysis on Neuron 1 cluster
25. ###mirasample1_sporo_velo_nobatchcorrect_dynamical_noZW_stemteg_forpaper.ipynb: scvelo analysis on mira (sample 1) and sporocyst tegument (no batch correction)
26. 25. ###neb_paper_figs.Rmd: sleuth analysis of plate-based handpicked cells


##Mapping: 10X Chromium single-cell RNAseq reads were mapped using CellRanger v6. The code for CellRanger is accessible from the 10X website. 
