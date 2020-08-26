//+------------------------------------------------------------------+
//|                             Corey Singlefinder (c) version 1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_buffers 20
#property indicator_plots   10

#property indicator_label1  "bearSingle"
#property indicator_type1   DRAW_COLOR_ARROW
#property indicator_color1  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "bearSingle2"
#property indicator_type2   DRAW_COLOR_ARROW
#property indicator_color2  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "bullSingle"
#property indicator_type3   DRAW_COLOR_ARROW
#property indicator_color3  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4  "bullSingle2"
#property indicator_type4   DRAW_COLOR_ARROW
#property indicator_color4  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

#property indicator_label5  "bearExt"
#property indicator_type5   DRAW_COLOR_ARROW
#property indicator_color5  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style5  STYLE_SOLID
#property indicator_width5  1

#property indicator_label6  "bearExt2"
#property indicator_type6   DRAW_COLOR_ARROW
#property indicator_color6  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style6  STYLE_SOLID
#property indicator_width6  1

#property indicator_label7  "bullExt"
#property indicator_type7   DRAW_COLOR_ARROW
#property indicator_color7  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style7  STYLE_SOLID
#property indicator_width7  1

#property indicator_label8  "bullExt2"
#property indicator_type8   DRAW_COLOR_ARROW
#property indicator_color8  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style8  STYLE_SOLID
#property indicator_width8  1

#property indicator_label9  "bearSingleArrow"
#property indicator_type9   DRAW_COLOR_ARROW
#property indicator_color9  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style9  STYLE_SOLID
#property indicator_width9  2

#property indicator_label10  "bullSingleArrow"
#property indicator_type10   DRAW_COLOR_ARROW
#property indicator_color10  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE, clrWhite
#property indicator_style10  STYLE_SOLID
#property indicator_width10  2

input bool ShowExtensions = true;
input bool ShowArrows = true;
input bool ShowLabels = true;

ushort   code1=159;    // Symbol code to draw in DRAW_COLOR_ARROW
ushort   code2=115;    // Symbol code to draw in DRAW_COLOR_ARROW
ushort   arrow_down_code=234;
ushort   arrow_up_code=233;

double bearSingle[], bearSingle_Color[];
double bearSingle2[], bearSingle2_Color[];
double bullSingle[], bullSingle_Color[];
double bullSingle2[], bullSingle2_Color[];
double bearExt[], bearExt_Color[];
double bearExt2[], bearExt2_Color[];
double bullExt[], bullExt_Color[];
double bullExt2[], bullExt2_Color[];
double bearSingleArrow[], bearSingleArrow_Color[];
double bullSingleArrow[], bullSingleArrow_Color[];

int countp = 0;
int countp2 = 0;
int countv = 0;
int countv2 = 0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,bearSingle,INDICATOR_DATA);
   SetIndexBuffer(1,bearSingle_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,bearSingle2,INDICATOR_DATA);
   SetIndexBuffer(3,bearSingle2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(4,bullSingle,INDICATOR_DATA);
   SetIndexBuffer(5,bullSingle_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(6,bullSingle2,INDICATOR_DATA);
   SetIndexBuffer(7,bullSingle2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(8,bearExt,INDICATOR_DATA);
   SetIndexBuffer(9,bearExt_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(10,bearExt2,INDICATOR_DATA);
   SetIndexBuffer(11,bearExt2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(12,bullExt,INDICATOR_DATA);
   SetIndexBuffer(13,bullExt_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(14,bullExt2,INDICATOR_DATA);
   SetIndexBuffer(15,bullExt2_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(16,bearSingleArrow,INDICATOR_DATA);
   SetIndexBuffer(17,bearSingleArrow_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(18,bullSingleArrow,INDICATOR_DATA);
   SetIndexBuffer(19,bullSingleArrow_Color,INDICATOR_COLOR_INDEX);

   for(int i = 0; i < indicator_plots; i++)
     {
      PlotIndexSetDouble(i,PLOT_EMPTY_VALUE,0);

      PlotIndexSetInteger(i,PLOT_ARROW,code1);
      PlotIndexSetInteger(i,PLOT_ARROW_SHIFT,1);
     }
   PlotIndexSetInteger(8,PLOT_ARROW,arrow_down_code);
   PlotIndexSetInteger(8,PLOT_ARROW_SHIFT,1);
   PlotIndexSetInteger(9,PLOT_ARROW,arrow_up_code);
   PlotIndexSetInteger(9,PLOT_ARROW_SHIFT,1);
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
      bool bearishSingle = false, bullishSingle = false;
      if(i+1 < rates_total && i-1 >= 0 && high[i+1] < low[i-1] && high[i] > low[i-1] && low[i] < high[i+1])
         bearishSingle = true;
      if(i+1 < rates_total && i-1 >= 0 && high[i-1] < low[i+1] && high[i] > low[i+1] && low[i] < high[i-1])
         bullishSingle = true;
      /////////////////////////////////////////////////////////////////////////////////
      if(i+1 < rates_total && i-1 >= 0 && bearishSingle)
        {
         bearSingle[i] = high[i+1];
         bearSingle_Color[i] = 7;

         bearSingle2[i] = low[i-1];
         bearSingle2_Color[i] = 7;
        }
      else
      {
         bearSingle[i] = 0;
         bearSingle2[i] = 0;
      }

      if(i+1 < rates_total && i-1 >= 0 && bullishSingle)
        {
         bullSingle[i] = high[i-1];
         bullSingle_Color[i] = 4;

         bullSingle2[i] = low[i+1];
         bullSingle2_Color[i] = 4;
        }
      else
      {
         bullSingle[i] = 0;
         bullSingle2[i] = 0;
      }
      /////////////////////////////////////////////////////////////////////////////////
      if(i-1 >= 0 && bearSingle[i] == 0 && bearSingle[i-1] != 0)
         countp = 1;
      else
         if(i-1 >= 0)
            countp++;

      if(ShowExtensions && bearSingle[i] == 0)
        {
         bearExt[i] = bearSingle[i - countp];
         bearExt_Color[i] = 7;
        }
      else
      {
         bearExt[i] = 0;
      }

      if(i-1 >= 0 && bearSingle2[i] == 0 && bearSingle2[i-1] != 0)
         countp2 = 1;
      else
         if(i-1 >= 0)
            countp2++;

      if(ShowExtensions && bearSingle2[i] == 0)
        {
         bearExt2[i] = bearSingle2[i - countp2];
         bearExt2_Color[i] = 7;
        }
      else
      {
         bearExt2[i] = 0;
      }

      /////////////////////////////////////////////////////////////////////////////////
      if(i-1 >= 0 && bullSingle[i] == 0 && bullSingle[i-1] != 0)
         countv = 1;
      else
         if(i-1 >= 0)
            countv++;

      if(ShowExtensions && bullSingle[i] == 0)
        {
         bullExt[i] = bullSingle[i - countv];
         bullExt_Color[i] = 4;
        }
      else
      {
         bullExt[i] = 0;
      }

      if(i-1 >= 0 && bullSingle2[i] == 0 && bullSingle2[i-1] != 0)
         countv2 = 1;
      else
         if(i-1 >= 0)
            countv2++;

      if(ShowExtensions && bullSingle2[i] == 0)
        {
         bullExt2[i] = bullSingle2[i - countv2];
         bullExt2_Color[i] = 4;
        }
      else
      {
         bullExt2[i] = 0;
      }
        
      /////////////////////////////////////////////////////////////////////////////////
      if (ShowArrows && bearishSingle)
      {
         bearSingleArrow[i] = high[i];
         bearSingleArrow_Color[i] = 7; 
      }
      else
      {
         bearSingleArrow[i] = 0;
      }
      
      if (ShowArrows && bullishSingle)
      {
         bullSingleArrow[i] = low[i];
         bullSingleArrow_Color[i] = 4; 
      }
      else
      {
         bullSingleArrow[i] = 0;
      }


     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
