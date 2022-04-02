3D Models for World2XPlane
============

This library is a collection of buildings used to generate regional scenery for X-Plane using [World2XPlane](http://www.world2xplane.com)

![Alt text](/buildings.jpg "3D Model Library")

The library is opensource and is included/updated in each release of World2XPlane. The library can also be checked out here and placed into the release manually. 

We are looking for contributors who can submit 3D buildings or optionally photographs of regional buildings to help really expand the available scenery inside X-Plane.

----------------------------------------------
Creating Models for use with World2XPlane

Please follow these basic rules for getting the model to work correctly when used for scenery generation

1) Once you have a footprint for the model, e.g. 10m - 11m, stick to the footprint, don't expand out from the house, by example, adding a garage, if it isn't included in the footprint

2) Make sure the origin of the model (0,0) point is directly in the middle ground of the house, and the model is lined up with the X and Z axis (i.e. It isn't slanted). This means that in Sketchup, the Y axis should cut straight up through the centre of the house, and the X and Z should be aligned to your outer walls. This is really important to get the model to rotate and fit properly into the footprint and match the scenery correctly.

3) Create a foundation a few metres deep for the building. Expect the house may be placed on the side of the hill or sloped terrain, and with out foundations on the negative Y axis, it will appear to float.

4) Put as many buildings as you can onto one texture sheet, mix and match styles to create new varieties if possible. The less textures X-Plane needs to load, the better.

5) Although not important, name your file so people know what it is, and if we stick to a naming convention, then they can be added automatically to the importer, instead of adding them in a config file, I'd suggest something like this

RES_10.00x15.00x3.00_PL. For a residential building (RES), with a footprint of 10m by 15m, and a height of 3M, with a regional variety of Poland.
IND_30.00x20.00x4.00_DE. For an industrial buliding (IND), with a footprint of 30m by 20m, and a height of 4M, with a regional variety of Germany (DE)
RET_15.00x20.00x4.00_EU. For a retail building (RET), with a footprint of 15m by 20m, and a height of 4M, with a regional variety of all of the EU

Please only use metric measurements, as this is what X-Plane uses, as well as the importer program.

6) Use as few faces as possible. There is no need to model window ledges, skirting. These things can be done in a texture, and really help with performance. If using models from Google Warehouse and retexturing, be aware, many of the models have hundreds of complicated faces.

7) Keep textures small, you can easily map a house using a small area of one texture sheet. The textures do not need to be high resolution


The importer will use the 3 CSV files, residential.csv, industrial.csv and agriculture.csv. These files also include items from the R2 library