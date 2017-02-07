--------------------------------------------------------------------------------
--
--  File Name: helper
--  Authors: Matt Dyke & Christian Sieh
--  Course: CSC 442 - Digital Image Processing
--  Instructor: Dr. Weiss
--  Date: 1/22/2017
--  
--  Description: 
--  
--------------------------------------------------------------------------------

--Define already loaded il file
local il = require("il");

--Table to hold the point process functions
local helper = {};


--------------------------------------------------------------------------------
--
-- Function Name: performContrastStretch
--
-- Description: 
--
-- Parameters:
--   img - An image object from ip.lua representing the image to process
--   low - User selected lower endpoint for contrast stretch
--   high - User selected upper endpoint for contrast stretch
--
-- Return: 
--   img - The image object after having the point process performed upon it
--
--------------------------------------------------------------------------------
local function performContrastStretch( img, low, high )
  --Loop over each pixel
  for r,c in img:pixels() do
    --Calculate pixel value after contrast stretching, using formula from book
    local temp = ( 255 / ( high - low ) ) * ( img:at(r,c).i - low );
    
    --Clip high and low pixel values that are out of bounds
    if temp > 255 then
      temp = 255;
    end
    if temp < 0 then
      temp = 0;
    end
    
    --Assign new pixel value
    img:at(r,c).i = temp;
  end
  
  return img;
end
helper.performContrastStretch = performContrastStretch;


--Return table of helper functions
return helper;  