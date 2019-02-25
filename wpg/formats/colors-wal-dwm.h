static const char norm_fg[] = "#fbffff";
static const char norm_bg[] = "#3c3c3c";
static const char norm_border[] = "#282828";

static const char sel_fg[] = "#fbffff";
static const char sel_bg[] = "#92AAAC";
static const char sel_border[] = "#fbffff";

static const char urg_fg[] = "#fbffff";
static const char urg_bg[] = "#B9CAC8";
static const char urg_border[] = "#B9CAC8";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
