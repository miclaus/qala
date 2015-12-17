# var grid = document.querySelector('.container');
# 
# var msnry = new Masonry( grid, {
# 	itemSelector: '.item',
# 	columnWidth: '.item',
# 	percentPosition: true,
#     isAnimated: true,
#     isFitWidth: true
# });
# 
# imagesLoaded( grid, function() {
# 	msnry.layout();
# });

grid = document.querySelector('.container')
msnry = new Masonry(grid,
  itemSelector: '.item'
  columnWidth: '.item'
  percentPosition: true
  isAnimated: true
  isFitWidth: true)
imagesLoaded grid, ->
  msnry.layout()
  return


