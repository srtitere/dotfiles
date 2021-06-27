const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#fff5f3", /* black   */
  [1] = "#df2014", /* red     */
  [2] = "#587d0a", /* green   */
  [3] = "#8a6f00", /* yellow  */
  [4] = "#196bec", /* blue    */
  [5] = "#c83884", /* magenta */
  [6] = "#2a79a2", /* cyan    */
  [7] = "#4d696f", /* white   */

  /* 8 bright colors */
  [8]  = "#8b6781",  /* black   */
  [9]  = "#9a511a",  /* red     */
  [10] = "#11742f", /* green   */
  [11] = "#8d590a", /* yellow  */
  [12] = "#004fff", /* blue    */
  [13] = "#9536c0", /* magenta */
  [14] = "#046c92", /* cyan    */
  [15] = "#4d696f", /* white   */

  /* special colors */
  [256] = "#fff5f3", /* background */
  [257] = "#4d696f", /* foreground */
  [258] = "#4d696f",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
