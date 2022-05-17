CREACIÓN DATASET deads_dataset.csv

- Con el dataset shootings2.csv se ha pasado las siglas de los estados a los nombres enteros porque todos los otros datasets no tenian siglas (processing_Dataset_NEWShootings.ipynb) → se ha reutilizado lo que ya había hecho el Arnau en python. Se ha generado el dataset NEWShootings.csv

- Con NEWShootings.csv se ha creado el dataset Deads_dataset.csv que tiene (state, year, poblation, deads, ratio_deads), el ratio_deads esta normalizado → deads/poblation

- Todo este filtrado se ha hecho con R i está en el script Filtrat_Deads_dataset.R

