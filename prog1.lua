--------------------------------------------------------------------------------
--
--  Program Name: Point Processing
--  Authors: Matt Dyke & Christian Sieh
--  Course: CSC 442 - Digital Image Processing
--  Instructor: Dr. Weiss
--  Date: 1/22/2017
--  
--  Description:
--  
--------------------------------------------------------------------------------

--LuaIP image processing routines
require "ip"   -- this loads the packed distributable
local viz = require "visual"
local il = require "il"
local pointProc = require "pointProc"
local hist = require "hist"
local misc = require "misc"

--Load images listed on command line
local imgs = {...}
for i, fname in ipairs(imgs) do loadImage(fname) end

--Define menu of point process operations
imageMenu("Point Processes",
  {
    {"Grayscale", pointProc.grayscale},
    {"Grayscale - Weiss", il.grayscale},
    {"Negate", pointProc.negate},
    {"Negate - Weiss", il.negate},
    {"Posterize", pointProc.posterize, {{name = "levels", type = "number", displaytype = "spin", default = 8, min = 2, max = 64}}},
    {"Posterize - Weiss", il.posterize, {{name = "levels", type = "number", displaytype = "spin", default = 8, min = 2, max = 64}}},
    {"Brightness", pointProc.brightness, {{name = "levels", type = "number", displaytype = "spin", default = 8, min = 2, max = 64}}},
    {"Brightness - Weiss", il.brighten, {{name = "levels", type = "number", displaytype = "spin", default = 8, min = 2, max = 64}}},
    {"Gamma", pointProc.gamma, {{name = "gamma", type = "string", default = "1.0"}}},
    {"Gamma - Weiss", il.gamma, {{name = "gamma", type = "string", default = "1.0"}}},
    {"Log", pointProc.logScale},
    {"Log - Weiss", il.logscale},
    {"Bitplane Slice", pointProc.slice, {{name = "plane", type = "number", displaytype = "spin", default = 7, min = 0, max = 7}}},
    {"Bitplane Slice - Weiss", il.slice, {{name = "plane", type = "number", displaytype = "spin", default = 7, min = 0, max = 7}}},
    {"Disc Pseudocolor", pointProc.distPsuedocolor},
    {"Disc Pseudocolor - Weiss", il.pseudocolor2},
    {"Cont Pseudocolor", pointProc.contPsuedocolor},
    {"Cont Pseudocolor - Weiss", il.pseudocolor1},
  }
)

imageMenu("Histogram processes",
  {
    {"Contrast Stretch", hist.contrastStretch},
    {"Contrast Stretch - Weiss", il.stretch},
    {"Contrast Specify\tCtrl-H", hist.contrastSpecify, hotkey = "C-H",
      {{name = "lp", type = "number", displaytype = "spin", default = 1, min = 0, max = 100},
        {name = "rp", type = "number", displaytype = "spin", default = 99, min = 0, max = 100}}},
    {"Contrast Specify\tCtrl-H - Weiss", il.stretchSpecify, hotkey = "C-H",
      {{name = "lp", type = "number", displaytype = "spin", default = 1, min = 0, max = 100},
        {name = "rp", type = "number", displaytype = "spin", default = 99, min = 0, max = 100}}},
    --{"Histogram Equalize YIQ - Weiss", il.equalizeYIQ},
    --{"Histogram Equalize YUV - Weiss", il.equalizeYUV},
    --{"Histogram Equalize IHS - Weiss", il.equalizeIHS},
    {"Histogram Display", il.showHistogram},
    {"Histogram Equalize RGB", hist.equalizeRGB},
    {"Histogram Equalize RGB - Weiss", il.equalizeRGB},
    {"Histogram Equalize Clip", hist.equalizeClip, {{name = "clip %", type = "number", displaytype = "textbox", default = "1.0"}}},
    {"Histogram Equalize Clip - Weiss", il.equalizeClip, {{name = "clip %", type = "number", displaytype = "textbox", default = "1.0"}}},
    --{"Display Greyscale Histogram - Weiss", il.showHistogram},
  }
)

imageMenu("Misc",
  {
    {"Binary Threshold", misc.threshold, {{name = "threshold", type = "number", displaytype = "slider", default = 128, min = 0, max = 255}}},
    {"Binary Threshold - Wiess", il.threshold, {{name = "threshold", type = "number", displaytype = "slider", default = 128, min = 0, max = 255}}},
    {"Auto Threshold", misc.autoThreshold},
    {"Auto Threshold - Weiss", il.iterativeBinaryThreshold},
  }
)

imageMenu("Help",
  {
    { "Help", viz.imageMessage( "Help", "Abandon all hope, ye who enter here..." ) },
    { "About", viz.imageMessage( "LuaIP Demo " .. viz.VERSION, "Authors: JMW and AI\nClass: CSC442/542 Digital Image Processing\nDate: Spring 2017" ) },
    {"Debug Console", viz.imageDebug},
  }
)

--Begin program
start()
