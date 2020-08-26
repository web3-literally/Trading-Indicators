//+------------------------------------------------------------------+
//|                              Corey Rangefinder (c) version 1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_buffers 58
#property indicator_plots   29

#property indicator_label1  "expandTriggerHigh"
#property indicator_type1   DRAW_COLOR_ARROW
#property indicator_color1  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style1  STYLE_SOLID
#property indicator_width1  3

#property indicator_label2  "expandTriggerLow"
#property indicator_type2   DRAW_COLOR_ARROW
#property indicator_color2  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style2  STYLE_SOLID
#property indicator_width2  3

#property indicator_label3  "expandHext"
#property indicator_type3   DRAW_COLOR_ARROW
#property indicator_color3  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style3  STYLE_SOLID
#property indicator_width3  3

#property indicator_label4  "expandLext"
#property indicator_type4   DRAW_COLOR_ARROW
#property indicator_color4  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style4  STYLE_SOLID
#property indicator_width4  3

#property indicator_label5  "sbar"
#property indicator_type5   DRAW_COLOR_LINE
#property indicator_color5  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style5  STYLE_SOLID
#property indicator_width5  2

#property indicator_label6  "expext1"
#property indicator_type6   DRAW_COLOR_ARROW
#property indicator_color6  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style6  STYLE_SOLID
#property indicator_width6  1

#property indicator_label7  "expext38"
#property indicator_type7   DRAW_COLOR_ARROW
#property indicator_color7  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style7  STYLE_SOLID
#property indicator_width7  1

#property indicator_label8  "expext50"
#property indicator_type8   DRAW_COLOR_ARROW
#property indicator_color8  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style8  STYLE_SOLID
#property indicator_width8  1

#property indicator_label9  "expext61"
#property indicator_type9   DRAW_COLOR_ARROW
#property indicator_color9  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style9  STYLE_SOLID
#property indicator_width9  1

#property indicator_label10  "expext78"
#property indicator_type10   DRAW_COLOR_ARROW
#property indicator_color10  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style10  STYLE_SOLID
#property indicator_width10  1

#property indicator_label11  "expext2"
#property indicator_type11   DRAW_COLOR_ARROW
#property indicator_color11  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style11  STYLE_SOLID
#property indicator_width11  1

#property indicator_label12  "exprej1"
#property indicator_type12   DRAW_COLOR_ARROW
#property indicator_color12  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style12  STYLE_SOLID
#property indicator_width12  1

#property indicator_label13  "exprej2"
#property indicator_type13   DRAW_COLOR_ARROW
#property indicator_color13  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style13  STYLE_SOLID
#property indicator_width13  1

#property indicator_label14  "exprej3"
#property indicator_type14   DRAW_COLOR_ARROW
#property indicator_color14  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style14  STYLE_SOLID
#property indicator_width14  1

#property indicator_label15  "expmidpt"
#property indicator_type15   DRAW_COLOR_ARROW
#property indicator_color15  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style15  STYLE_SOLID
#property indicator_width15  1

#property indicator_label16  "expentrypt"
#property indicator_type16   DRAW_COLOR_ARROW
#property indicator_color16  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style16  STYLE_SOLID
#property indicator_width16  1

#property indicator_label17  "expandext1"
#property indicator_type17   DRAW_COLOR_ARROW
#property indicator_color17  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style17  STYLE_SOLID
#property indicator_width17  1

#property indicator_label18  "expandext38"
#property indicator_type18   DRAW_COLOR_ARROW
#property indicator_color18  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style18  STYLE_SOLID
#property indicator_width18  1

#property indicator_label19  "expandext50"
#property indicator_type19   DRAW_COLOR_ARROW
#property indicator_color19  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style19  STYLE_SOLID
#property indicator_width19  1

#property indicator_label20  "expandext61"
#property indicator_type20   DRAW_COLOR_ARROW
#property indicator_color20  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style20  STYLE_SOLID
#property indicator_width20  1

#property indicator_label21  "expandext78"
#property indicator_type21   DRAW_COLOR_ARROW
#property indicator_color21  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style21  STYLE_SOLID
#property indicator_width21  1

#property indicator_label22  "expandext2"
#property indicator_type22   DRAW_COLOR_ARROW
#property indicator_color22  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style22  STYLE_SOLID
#property indicator_width22  1

#property indicator_label23  "expandextr1"
#property indicator_type23   DRAW_COLOR_ARROW
#property indicator_color23  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style23  STYLE_SOLID
#property indicator_width23  1

#property indicator_label24  "expandextr2"
#property indicator_type24   DRAW_COLOR_ARROW
#property indicator_color24  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style24  STYLE_SOLID
#property indicator_width24  1

#property indicator_label25  "expandextr3"
#property indicator_type25   DRAW_COLOR_ARROW
#property indicator_color25  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style25  STYLE_SOLID
#property indicator_width25  1

#property indicator_label26  "expandextmp"
#property indicator_type26   DRAW_COLOR_ARROW
#property indicator_color26  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style26  STYLE_SOLID
#property indicator_width26  1

#property indicator_label27  "expandextep"
#property indicator_type27   DRAW_COLOR_ARROW
#property indicator_color27  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style27  STYLE_SOLID
#property indicator_width27  1

#property indicator_label28  "ExpandArrowUp"
#property indicator_type28   DRAW_COLOR_ARROW
#property indicator_color28  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style28  STYLE_SOLID
#property indicator_width28  3

#property indicator_label29  "ExpandArrowDown"
#property indicator_type29   DRAW_COLOR_ARROW
#property indicator_color29  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style29  STYLE_SOLID
#property indicator_width29  3

ushort   code1=159;    // Symbol code to draw in DRAW_COLOR_ARROW
ushort   code2=115;    // Symbol code to draw in DRAW_COLOR_ARROW
ushort   arrow_down_code=234;
ushort   arrow_up_code=233;


bool showExtensions = true;
input bool showBubblesRange = true;
input bool showArrows = true;
input int excessTresh = 0;

double expandTriggerHigh[], expandTriggerHigh_Color[];
double expandTriggerLow[], expandTriggerLow_Color[];
double expandHext[], expandHext_Color[];
double expandLext[], expandLext_Color[];
double sbar[], sbar_Color[];
double expext1[], expext1_Color[];
double expext38[], expext38_Color[];
double expext50[], expext50_Color[];
double expext61[], expext61_Color[];
double expext78[], expext78_Color[];
double expext2[], expext2_Color[];
double exprej1[], exprej1_Color[];
double exprej2[], exprej2_Color[];
double exprej3[], exprej3_Color[];
double expmidpt[], expmidpt_Color[];
double expentrypt[], expentrypt_Color[];
double expandext1[], expandext1_Color[];
double expandext38[], expandext38_Color[];
double expandext50[], expandext50_Color[];
double expandext61[], expandext61_Color[];
double expandext78[], expandext78_Color[];
double expandext2[], expandext2_Color[];
double expandextr1[], expandextr1_Color[];
double expandextr2[], expandextr2_Color[];
double expandextr3[], expandextr3_Color[];
double expandextmp[], expandextmp_Color[];
double expandextep[], expandextep_Color[];
double ExpandArrowUp[], ExpandArrowUp_Color[];
double ExpandArrowDown[], ExpandArrowDown_Color[];


int countp = 0;
int countv = 0;
int count1 = 0;
int count38 = 0;
int count50 = 0;
int count61 = 0;
int count78 = 0;
int count2 = 0;
int countr1 = 0;
int countr2 = 0;
int countr3 = 0;
int countmp = 0;
int countep = 0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,expandTriggerHigh,INDICATOR_DATA);
   SetIndexBuffer(1,expandTriggerHigh_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,expandTriggerLow,INDICATOR_DATA);
   SetIndexBuffer(3,expandTriggerLow_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(4,expandHext,INDICATOR_DATA);
   SetIndexBuffer(5,expandHext_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(6,expandLext,INDICATOR_DATA);
   SetIndexBuffer(7,expandLext_Color,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(8,sbar,INDICATOR_DATA);
   SetIndexBuffer(9,sbar_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(10,expext1,INDICATOR_DATA);
   SetIndexBuffer(11,expext1_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(12,expext38,INDICATOR_DATA);
   SetIndexBuffer(13,expext38_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(14,expext50,INDICATOR_DATA);
   SetIndexBuffer(15,expext50_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(16,expext61,INDICATOR_DATA);
   SetIndexBuffer(17,expext61_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(18,expext78,INDICATOR_DATA);
   SetIndexBuffer(19,expext78_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(20,expext2,INDICATOR_DATA);
   SetIndexBuffer(21,expext2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(22,exprej1,INDICATOR_DATA);
   SetIndexBuffer(23,exprej1_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(24,exprej2,INDICATOR_DATA);
   SetIndexBuffer(25,exprej2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(26,exprej3,INDICATOR_DATA);
   SetIndexBuffer(27,exprej3_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(28,expmidpt,INDICATOR_DATA);
   SetIndexBuffer(29,expmidpt_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(30,expentrypt,INDICATOR_DATA);
   SetIndexBuffer(31,expentrypt_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(32,expandext1,INDICATOR_DATA);
   SetIndexBuffer(33,expandext1_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(34,expandext38,INDICATOR_DATA);
   SetIndexBuffer(35,expandext38_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(36,expandext50,INDICATOR_DATA);
   SetIndexBuffer(37,expandext50_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(38,expandext61,INDICATOR_DATA);
   SetIndexBuffer(39,expandext61_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(40,expandext78,INDICATOR_DATA);
   SetIndexBuffer(41,expandext78_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(42,expandext2,INDICATOR_DATA);
   SetIndexBuffer(43,expandext2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(44,expandextr1,INDICATOR_DATA);
   SetIndexBuffer(45,expandextr1_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(46,expandextr2,INDICATOR_DATA);
   SetIndexBuffer(47,expandextr2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(48,expandextr3,INDICATOR_DATA);
   SetIndexBuffer(49,expandextr3_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(50,expandextmp,INDICATOR_DATA);
   SetIndexBuffer(51,expandextmp_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(52,expandextep,INDICATOR_DATA);
   SetIndexBuffer(53,expandextep_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(54,ExpandArrowUp,INDICATOR_DATA);
   SetIndexBuffer(55,ExpandArrowUp_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(56,ExpandArrowDown,INDICATOR_DATA);
   SetIndexBuffer(57,ExpandArrowDown_Color,INDICATOR_COLOR_INDEX);

   for(int i = 0; i < indicator_plots; i++)
     {
      PlotIndexSetDouble(i,PLOT_EMPTY_VALUE,0);

      PlotIndexSetInteger(i,PLOT_ARROW,code1);
      PlotIndexSetInteger(i,PLOT_ARROW_SHIFT,1);
     }
   PlotIndexSetInteger(27,PLOT_ARROW,arrow_up_code);
   PlotIndexSetInteger(27,PLOT_ARROW_SHIFT,1);
   PlotIndexSetInteger(28,PLOT_ARROW,arrow_down_code);
   PlotIndexSetInteger(28,PLOT_ARROW_SHIFT,1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   for(int i=1; i<rates_total; i++)
     {
      bool exHigh = false;
      bool exLow = false;
      if(i > 0 && high[i] > high[i-1] && low[i] < low[i-1])
        {
         exHigh = true;
         exLow = true;
        }
      /////////////////////////////////// expandTriggerHigh & expandTriggerLow ///////////////////////////////
      if(exHigh)
        {
         expandTriggerHigh[i] = high[i];
         expandTriggerHigh_Color[i] = 0;
        }
      else
        {
         expandTriggerHigh[i] = 0;
        }

      if(exLow)
        {
         expandTriggerLow[i] = low[i];
         expandTriggerLow_Color[i] = 0;
        }
      else
        {
         expandTriggerLow[i] = 0;
        }
      /////////////////////////////////// expandHext & expandLext ///////////////////////////////
      if(i > 0 && expandTriggerHigh[i] == 0 && expandTriggerHigh[i -1 ] != 0)
         countp = 1;
      else
         if(i > 0)
            countp++;

      if(i > 0 && expandTriggerHigh[i] == 0)
        {
         expandHext[i] = expandTriggerHigh[i - countp];
         expandHext_Color[i] = 0;
        }
      else
        {
         expandHext[i] = 0;
        }
      if(i > 0 && expandTriggerLow[i] == 0 && expandTriggerLow[i -1 ] != 0)
         countv = 1;
      else
         if(i > 0)
            countv++;

      if(i > 0 && expandTriggerLow[i] == 0)
        {
         expandLext[i] = expandTriggerLow[i - countv];
         expandLext_Color[i] = 0;
        }
      else
        {
         expandLext[i] = 0;
        }
      /////////////////////////////////// Define Target ///////////////////////////////
      double imbal, flip, range;

      if(close[i] > open[i])
        {
         imbal = high[i];
         flip = 1;
        }
      else
        {
         imbal = low[i];
         flip = -1;
        }
      range = high[i] - low[i];

      int period = 3;
      double avg = Average(close, i, period);
      if(avg)
        {
         sbar[i] = avg;
         sbar_Color[i] = 2;
        }
      else
        {
         sbar[i] = 0;
        }
      /////////////////////////////////// Target Condition ///////////////////////////////
      if(exHigh)
        {
         expext1[i] = imbal + flip * range * 1.0;
         expext1_Color[i] = 3;
         expext38[i] = imbal + flip * range * 0.382;
         expext38_Color[i] = 4;
         expext50[i] = imbal + flip * range * 0.5;
         expext50_Color[i] = 4;
         expext61[i] = imbal + flip * range * 0.618;
         expext61_Color[i] = 4;
         expext78[i] = imbal + flip * range * 0.786;
         expext78_Color[i] = 5;
         expext2[i] = imbal + flip * range * 2.0;
         expext2_Color[i] = 0;
         exprej1[i] = imbal - (flip * range) - flip * range * 0.5;
         exprej1_Color[i] = 9;
         exprej2[i] = imbal - (flip * range) - flip * range * 1;
         exprej2_Color[i] = 9;
         exprej3[i] = imbal - (flip * range) - flip * range * 3;
         exprej3_Color[i] = 9;
         expmidpt[i] = (expandTriggerHigh[i] + expandTriggerLow[i]) / 2.0;
         expmidpt_Color[i] = 9;
         expentrypt[i] = close[i];
         expentrypt_Color[i] = 3;
        }
      else
        {
         expext1[i] = 0;
         expext38[i] = 0;
         expext50[i] = 0;
         expext61[i] = 0;
         expext78[i] = 0;
         expext2[i] = 0;
         exprej1[i] = 0;
         exprej2[i] = 0;
         exprej3[i] = 0;
         expmidpt[i] = 0;
         expentrypt[i] = 0;
        }
      /////////////////////////////////// Extend Targets ///////////////////////////////
      if(i > 0 && expext1[i] == 0 && expext1[i - 1 ] != 0)
         count1 = 1;
      else
         if(i > 0)
            count1++;

      if(i > 0 && showExtensions && expext1[i] == 0)
        {
         expandext1[i] = expext1[i - count1];
         expandext1_Color[i] = 3;
        }
      else
        {
         expandext1[i] = 0;
        }


      if(i > 0 && expext38[i] == 0 && expext38[i - 1 ] != 0)
         count38 = 1;
      else
         if(i > 0)
            count38++;

      if(i > 0 && showExtensions && expext38[i] == 0)
        {
         expandext38[i] = expext38[i - count38];
         expandext38_Color[i] = 4;
        }
      else
        {
         expandext38[i] = 0;
        }
      if(i > 0 && expext50[i] == 0 && expext50[i - 1 ] != 0)
         count50 = 1;
      else
         if(i > 0)
            count50++;

      if(i > 0 && showExtensions && expext50[i] == 0)
        {
         expandext50[i] = expext50[i - count50];
         expandext50_Color[i] = 4;
        }
      else
        {
         expandext50[i] = 0;
        }

      if(i > 0 && expext61[i] == 0 && expext61[i - 1 ] != 0)
         count61 = 1;
      else
         if(i > 0)
            count61++;

      if(i > 0 && showExtensions && expext61[i] == 0)
        {
         expandext61[i] = expext61[i - count61];
         expandext61_Color[i] = 4;
        }
      else
        {
         expandext61[i] = 0;
        }

      if(i > 0 && expext78[i] == 0 && expext78[i - 1 ] != 0)
         count78 = 1;
      else
         if(i > 0)
            count78++;

      if(i > 0 && showExtensions && expext78[i] == 0)
        {
         expandext78[i] = expext78[i - count78];
         expandext78_Color[i] = 5;
        }
      else
        {
         expandext78[i] = 0;
        }

      if(i > 0 && expext2[i] == 0 && expext2[i - 1 ] != 0)
         count2 = 1;
      else
         if(i > 0)
            count2++;

      if(i > 0 && showExtensions && expext2[i] == 0)
        {
         expandext2[i] = expext2[i - count2];
         expandext2_Color[i] = 0;
        }
      else
        {
         expandext2[i] = 0;
        }

      if(i > 0 && exprej1[i] == 0 && exprej1[i - 1 ] != 0)
         countr1 = 1;
      else
         if(i > 0)
            countr1++;

      if(i > 0 && showExtensions && exprej1[i] == 0)
        {
         expandextr1[i] = exprej1[i - countr1];
         expandextr1_Color[i] = 9;
        }
      else
        {
         expandextr1[i] = 0;
        }

      if(i > 0 && exprej2[i] == 0 && exprej2[i - 1 ] != 0)
         countr2 = 1;
      else
         if(i > 0)
            countr2++;

      if(i > 0 && showExtensions && exprej2[i] == 0)
        {
         expandextr2[i] = exprej2[i - countr2];
         expandextr2_Color[i] = 9;
        }
      else
        {
         expandextr2[i] = 0;
        }

      if(i > 0 && exprej3[i] == 0 && exprej3[i - 1 ] != 0)
         countr3 = 1;
      else
         if(i > 0)
            countr3++;

      if(i > 0 && showExtensions && exprej3[i] == 0)
        {
         expandextr3[i] = exprej3[i - countr3];
         expandextr3_Color[i] = 9;
        }
      else
        {
         expandextr3[i] = 0;
        }

      if(i > 0 && expmidpt[i] == 0 && expmidpt[i - 1 ] != 0)
         countmp = 1;
      else
         if(i > 0)
            countmp++;

      if(i > 0 && showExtensions && expmidpt[i] == 0)
        {
         expandextmp[i] = expmidpt[i - countmp];
         expandextmp_Color[i] = 9;
        }
      else
        {
         expandextmp[i] = 0;
        }

      if(i > 0 && expentrypt[i] == 0 && expentrypt[i - 1 ] != 0)
         countep = 1;
      else
         if(i > 0)
            countep++;

      if(i > 0 && showExtensions && expentrypt[i] == 0)
        {
         expandextep[i] = expentrypt[i - countep];
         expandextep_Color[i] = 3;
        }
      else
        {
         expandextep[i] = 0;
        }

      /////////////////////////////////// Arrow Definitions ///////////////////////////////
      bool secBar = false, secBarClose = false;
      if(i + 1 < rates_total && Average(close, i - 1, period) < close[i] && close[i + 1] >= close[i])
         secBar = true;
      if(i + 2 < rates_total && close[i + 2] > high[i])
         secBarClose = true;

      /////////////////////////////////// Up Down Arrows ///////////////////////////////
      if(showArrows && i + 1 < rates_total && (exHigh && secBar) || (exHigh && flip == -1 && close[i + 1] > close[i]) || (exHigh && calcBote(rates_total, open, high, low, close, i) < excessTresh))
        {
         ExpandArrowUp[i] = low[i];

         if((i+2 < rates_total && close[i+2] <= open[i+2]) || (i > 0 && low[i] < expandextr1[i-1]))
            ExpandArrowUp_Color[i] = 3;
         else
            if(i+2<rates_total && close[i+2] < expandTriggerLow[i])
               ExpandArrowUp_Color[i] = 0;
            else
               if(calcTope(rates_total, open, high, low, close, i+1) < calcBote(rates_total, open, high, low, close, i+1))
                  ExpandArrowUp_Color[i] = 2;
               else
                  ExpandArrowUp_Color[i] = 2;
        }
      else
        {
         ExpandArrowUp[i] = 0;
        }

      if(showArrows && exHigh && !secBar)
        {
         ExpandArrowDown[i] = high[i];
         if(i+2 < rates_total && close[i+2] > open[i+2])
            ExpandArrowDown_Color[i] = 3;
         else
            if(i+2 < rates_total && (exHigh && close[i+2] > high[i]))
               ExpandArrowDown_Color[i] = 2;
            else
               if(calcTope(rates_total, open, high, low, close, i+1) > calcBote(rates_total, open, high, low, close, i+1))
                  ExpandArrowDown_Color[i] = 0;
               else
                  ExpandArrowDown_Color[i] = 0;
        }
      else
        {
         ExpandArrowDown[i] = 0;
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Average(const double &price[], int index, int period)
  {
   if(period && index >= period - 1)
     {
      double sumPrice = 0;
      for(int k = 0; k < period; k++)
         sumPrice += price[index - k];
      return sumPrice / period;
     }
   else
      return 0;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double calcTope(const int rates_total,
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                int i)
  {
   if(i >= rates_total)
      return 0;

   double rangeTotal = high[i] - low[i];
   if(rangeTotal)
     {
      if(open[i] < close[i])
        {
         return (high[i] - close[i]) / rangeTotal * 100.0;
        }
      else
        {
         return (high[i] - open[i]) / rangeTotal * 100.0;
        }
     }
   else
      return 0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double calcBote(const int rates_total,
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                int i)
  {
   if(i >= rates_total)
      return 0;

   double rangeTotal = high[i] - low[i];
   if(rangeTotal)
     {
      if(open[i] < close[i])
        {
         return (open[i] - low[i]) / rangeTotal * 100.0;
        }
      else
        {
         return (close[i] - low[i]) / rangeTotal * 100.0;
        }
     }
   else
      return 0;
  }
//+------------------------------------------------------------------+
