static const char norm_fg[] = "#4d696f";
static const char norm_bg[] = "#fff5f3";
static const char norm_border[] = "#8b6781";

static const char sel_fg[] = "#4d696f";
static const char sel_bg[] = "#587d0a";
static const char sel_border[] = "#4d696f";

static const char urg_fg[] = "#4d696f";
static const char urg_bg[] = "#df2014";
static const char urg_border[] = "#df2014";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
