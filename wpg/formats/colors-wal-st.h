const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#3c3c3c", /* black   */
  [1] = "#B9CAC8", /* red     */
  [2] = "#92AAAC", /* green   */
  [3] = "#B2C2BE", /* yellow  */
  [4] = "#74939A", /* blue    */
  [5] = "#9DB1B1", /* magenta */
  [6] = "#9FC1C8", /* cyan    */
  [7] = "#dce2e0", /* white   */

  /* 8 bright colors */
  [8]  = "#282828",  /* black   */
  [9]  = "#d7ffff",  /* red     */
  [10] = "#a9eef4", /* green   */
  [11] = "#cfffff", /* yellow  */
  [12] = "#85cad9", /* blue    */
  [13] = "#b6fbfb", /* magenta */
  [14] = "#b7ffff", /* cyan    */
  [15] = "#fbffff", /* white   */

  /* special colors */
  [256] = "#3c3c3c", /* background */
  [257] = "#fbffff", /* foreground */
  [258] = "#fbffff",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
