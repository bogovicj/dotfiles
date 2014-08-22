// Configs
S.cfga({
    "defaultToCurrentScreen" : true,
    "secondsBetweenRepeat" : 0.1,
    "checkDefaultsOnLoad" : true,
    "focusCheckWidthMax" : 3000,
    "focusPreferSameApp" : false
});

var halfScrnX = "screenSizeX/2";
var qtrScrnX  = "+screenSizeX/4";
var halfScrnY = "screenSizeY/2";
var qtrScrnY  = "screenSizeY/4";

var full = S.op("move", {
      "x" : "screenOriginX",
      "y" : "screenOriginY",
      "width" : "screenSizeX",
      "height" : "screenSizeY"
});

var lhalf = full.dup({ "width" : "screenSizeX/2" });
var rhalf = lhalf.dup({ "x" : "screenOriginX + (screenSizeX/2)" });
var thalf = full.dup({ "height" : "screenSizeY/2" });
var bhalf = thalf.dup({ "y" : "screenOriginY + (screenSizeY/2)" });

var iwQtrX = S.op( "resize", {
    "width"  : "+25%",
    "height" : "+0%"
});
var dwQtrX = S.op( "resize", {
    "width"  : "-25%",
    "height" : "+0%"
});
var iwQtrXR = iwQtrX.dup({ "anchor":"top-right" });
var dwQtrXR = dwQtrX.dup({ "anchor":"top-right" });

//var 

// Batch bind everything
S.bnda({

    // Location bindings
    "m:ctrl;cmd" : full, 
    "h:ctrl;cmd" : lhalf, 
    "l:ctrl;cmd" : rhalf,
    "j:ctrl;cmd" : thalf,
    "k:ctrl;cmd" : bhalf,

    // Focus bindings
    "u:shift;cmd" : S.op( "focus", { "direction" : "left" }),
    "i:shift;cmd" : S.op( "focus", { "direction" : "right" }),

    // Resize bindings
    //"right:alt" : rsQtrX,  

    // Window hits
    "esc:cmd" : S.op("hint",
        { "characters" : "JKLHUIOPNM" }),
    
    // Grid
    "esc:ctrl" : S.op("grid") 

});
