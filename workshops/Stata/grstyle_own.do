 /* Setting own scheme (theme) using grstyle */
 
 grstyle init
 
/* Setting graph size to fit in landscape printing */
 
 grstyle graphsize x 5
 grstyle graphsize y 5
 
 /* Setting white background with gridline */
 grstyle color background white
 
 grstyle anglestyle vertical_tick horizontal
 
 /* Setting the grid lines */
 grstyle yesno draw_major_hgrid yes
 grstyle yesno grid_draw_min yes
 grstyle yesno grid_draw_max yes
 grstyle color major_grid gs8
 grstyle linewidth major_grid thin
 grstyle linepattern major_grid dot 
 
 /* Putting legend to the position of your choice */
 grstyle clockdir legend_position 6
 grstyle numstyle legend_cols 2
 grstyle linestyle legend none
 
 /* Making CI transparent */
 grstyle color ci_area gs12%50
 grstyle color ci_arealine gs12%0

 /* Setting Marker colors */
 grstyle color p1markline navy%0
 grstyle color p1markfill navy%50
 grstyle color p2markline maroon%0
 grstyle color p2markfill maroon%50
 
 /* Export file in pdf or svg format */
 /* graph export "graph.pdf", as(pdf) */
 /* grstyle clear */

