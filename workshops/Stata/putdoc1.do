/* Putdoc example to create a ready-to-print table in Word document */ 

putdocx clear 
putdocx begin
putdocx paragraph, style("Title")
putdocx text ("Produce a table from regression results")
regress  HappyPlanetIndex lgdp 
putdocx table tbl_est = etable
putdocx save etable_1.docx, replace