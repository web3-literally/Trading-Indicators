//+------------------------------------------------------------------+
//|                                Corey Gapfinder (c) version 1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_buffers 24
#property indicator_plots   12
//--- plot Color_Zigzag
#property indicator_label1  "GDS"
#property indicator_type1   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color1  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style1  STYLE_SOLID
#property indicator_width1  3

#property indicator_label2  "GDE"
#property indicator_type2   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color2  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style2  STYLE_SOLID
#property indicator_width2  3

#property indicator_label3  "GUS"
#property indicator_type3   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color3  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style3 STYLE_SOLID
#property indicator_width3  3

#property indicator_label4  "GUE"
#property indicator_type4   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color4  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style4 STYLE_SOLID
#property indicator_width4  3

#property indicator_label5  "GDSext"
#property indicator_type5   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color5  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style5  STYLE_SOLID
#property indicator_width5  3

#property indicator_label6  "GDSext2"
#property indicator_type6   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color6  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style6  STYLE_SOLID
#property indicator_width6  3

#property indicator_label7  "GUSext"
#property indicator_type7   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color7  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style7  STYLE_SOLID
#property indicator_width7  3

#property indicator_label8  "GUSext2"
#property indicator_type8   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color8  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style8  STYLE_SOLID
#property indicator_width8  3

#property indicator_label9  "GDArrow"
#property indicator_type9   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color9  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style9  STYLE_SOLID
#property indicator_width9  5

#property indicator_label10  "GUArrow"
#property indicator_type10   DRAW_COLOR_ARROW
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color10  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style10  STYLE_SOLID
#property indicator_width10  5

#property indicator_label11  "Cloud1"
#property indicator_type11   DRAW_FILLING
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color11  clrRed,clrRed
#property indicator_width11  5

#property indicator_label12  "Cloud2"
#property indicator_type12   DRAW_FILLING
//--- Define 8 colors for coloring sections (they are stored in a special array)
#property indicator_color12  clrGreen,clrGreen
#property indicator_width12  5


ushort   code1=159;    // Symbol code to draw in DRAW_COLOR_ARROW
ushort   code2=115;    // Symbol code to draw in DRAW_COLOR_ARROW
ushort   arrow_down_code=242;
ushort   arrow_up_code=241;
ushort   shift=1;    // Symbol code to draw in DRAW_COLOR_ARROW

//--- Buffers of values of segment ends
double         GDSBuffer[], GDSColors[];
double         GDEBuffer[], GDEColors[];
double         GUSBuffer[], GUSColors[];
double         GUEBuffer[], GUEColors[];
double         GDSextBuffer[], GDSextColors[];
double         GDSext2Buffer[], GDSext2Colors[];
double         GUSextBuffer[], GUSextColors[];
double         GUSext2Buffer[], GUSext2Colors[];
double         GDArrowBuffer[], GDArrowColors[];
double         GUArrowBuffer[], GUArrowColors[];
double         Cloud1Buffer_1[], Cloud1Buffer_2[];
double         Cloud2Buffer_1[], Cloud2Buffer_2[];

enum GAP_TYPE
  {
   _HIGH=0, //HIGH
   _LOW=1, //LOW
   _CLOSE=2, //CLOSE
   _OPEN=3, //OPEN
  };
//--- input parameters
input bool     showArrows=false;
input bool     showClouds=false;
input GAP_TYPE GapDownStart = _CLOSE;
input GAP_TYPE GapDownEnd = _OPEN;
input GAP_TYPE GapUpStart = _CLOSE;
input GAP_TYPE GapUpEnd = _OPEN;


int countp = 0;
int countp1 = 0;
int countv = 0;
int countv1 = 0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,GDSBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,GDSColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(2,GDEBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,GDEColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(4,GUSBuffer,INDICATOR_DATA);
   SetIndexBuffer(5,GUSColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(6,GUEBuffer,INDICATOR_DATA);
   SetIndexBuffer(7,GUEColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(8,GDSextBuffer,INDICATOR_DATA);
   SetIndexBuffer(9,GDSextColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(10,GDSext2Buffer,INDICATOR_DATA);
   SetIndexBuffer(11,GDSext2Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(12,GUSextBuffer,INDICATOR_DATA);
   SetIndexBuffer(13,GUSextColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(14,GUSext2Buffer,INDICATOR_DATA);
   SetIndexBuffer(15,GUSext2Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(16,GDArrowBuffer,INDICATOR_DATA);
   SetIndexBuffer(17,GDArrowColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(18,GUArrowBuffer,INDICATOR_DATA);
   SetIndexBuffer(19,GUArrowColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(20,Cloud1Buffer_1,INDICATOR_DATA);
   SetIndexBuffer(21,Cloud1Buffer_2,INDICATOR_DATA);

   SetIndexBuffer(22,Cloud2Buffer_1,INDICATOR_DATA);
   SetIndexBuffer(23,Cloud2Buffer_2,INDICATOR_DATA);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(4,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(5,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(6,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(7,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(8,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(9,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(10,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(11,PLOT_EMPTY_VALUE,0);
   
   PlotIndexSetInteger(0,PLOT_ARROW,code1);
   PlotIndexSetInteger(0,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(1,PLOT_ARROW,code1);
   PlotIndexSetInteger(1,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(2,PLOT_ARROW,code2);
   PlotIndexSetInteger(2,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(3,PLOT_ARROW,code2);
   PlotIndexSetInteger(3,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(4,PLOT_ARROW,code1);
   PlotIndexSetInteger(4,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(5,PLOT_ARROW,code1);
   PlotIndexSetInteger(5,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(6,PLOT_ARROW,code2);
   PlotIndexSetInteger(6,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(7,PLOT_ARROW,code2);
   PlotIndexSetInteger(7,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(8,PLOT_ARROW,arrow_down_code);
   PlotIndexSetInteger(8,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(9,PLOT_ARROW,arrow_up_code);
   PlotIndexSetInteger(9,PLOT_ARROW_SHIFT,shift);
   PlotIndexSetInteger(10,PLOT_SHIFT,shift);
   PlotIndexSetInteger(11,PLOT_SHIFT,shift);
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
      //////////////////////////////////////////////////////////////////
      if(GapDownStartValue(rates_total, open, high, low, close, i-1) > GapDownEndValue(rates_total, open, high, low, close, i))
        {
         GDSBuffer[i] = GapDownStartValue(rates_total, open, high, low, close, i-1);
         GDSColors[i] = 0;

         GDEBuffer[i] = GapDownEndValue(rates_total, open, high, low, close, i);
         GDEColors[i] = 0;
        }
      else
        {
         GDSBuffer[i] = 0;
         GDSColors[i] = 8;

         GDEBuffer[i] = 0;
         GDEColors[i] = 8;
        }

      //////////////////////////////////////////////////////////////////
      if(GapUpStartValue(rates_total, open, high, low, close, i-1) < GapUpEndValue(rates_total, open, high, low, close, i))
        {
         GUSBuffer[i] = GapUpStartValue(rates_total, open, high, low, close, i-1);
         GUSColors[i] = 2;

         GUEBuffer[i] = GapUpEndValue(rates_total, open, high, low, close, i);
         GUEColors[i] = 2;
        }
      else
        {
         GUSBuffer[i] = 0;
         GUSColors[i] = 8;

         GUEBuffer[i] = 0;
         GUEColors[i] = 8;
        }
      //////////////////////////////////////////////////////////////////

      if(GDSBuffer[i] == 0 && GDSBuffer[i-1] != 0)
         countp = 1;
      else
         countp++;

      double dGDSValue = 0;
      if(i - countp >= 0)
         dGDSValue = GDSBuffer[i - countp];

      if(GDSBuffer[i] == 0)
        {
         GDSextBuffer[i] = dGDSValue;
         GDSextColors[i] = 0;
        }
      else
        {
         GDSextBuffer[i] = 0;
         GDSextColors[i] = 8;
        }
      //////////////////////////////////////////////////////////////////

      if(GDEBuffer[i] == 0 && GDEBuffer[i-1] != 0)
         countp1 = 1;
      else
         countp1++;

      double dGDEValue = 0;
      if(i - countp1 >= 0)
         dGDEValue = GDEBuffer[i - countp1];

      if(GDEBuffer[i] == 0)
        {
         GDSext2Buffer[i] = dGDEValue;
         GDSext2Colors[i] = 0;
        }
      else
        {
         GDSext2Buffer[i] = 0;
         GDSext2Colors[i] = 8;
        }

      //////////////////////////////////////////////////////////////////

      if(GUSBuffer[i] == 0 && GUSBuffer[i-1] != 0)
         countv = 1;
      else
         countv++;

      double dGUSValue = 0;
      if(i - countv >= 0)
         dGUSValue = GUSBuffer[i - countv];

      if(GUSBuffer[i] == 0)
        {
         GUSextBuffer[i] = dGUSValue;
         GUSextColors[i] = 2;
        }
      else
        {
         GUSextBuffer[i] = 0;
         GUSextColors[i] = 8;
        }
      //////////////////////////////////////////////////////////////////

      if(GUEBuffer[i] == 0 && GUEBuffer[i-1] != 0)
         countv1 = 1;
      else
         countv1++;

      double dGUEValue = 0;
      if(i - countv1 >= 0)
         dGUEValue = GUEBuffer[i - countv1];

      if(GUSBuffer[i] == 0)
        {
         GUSext2Buffer[i] = dGUEValue;
         GUSext2Colors[i] = 2;
        }
      else
        {
         GUSext2Buffer[i] = 0;
         GUSext2Colors[i] = 8;
        }
      ////////////////////////////////////////////////////////////////////
      if(GapDownStartValue(rates_total, open, high, low, close, i-1) > GapDownEndValue(rates_total, open, high, low, close, i) && showArrows)
        {
         GDArrowBuffer[i] = high[i];
         GDArrowColors[i] = 0;
        }
      else
        {
         GDArrowBuffer[i] = 0;
         GDArrowColors[i] = 8;
        }
      ////////////////////////////////////////////////////////////////////
      if(GapUpStartValue(rates_total, open, high, low, close, i-1) < GapUpEndValue(rates_total, open, high, low, close, i) && showArrows)
        {
         GUArrowBuffer[i] = low[i];
         GUArrowColors[i] = 2;
        }
      else
        {
         GUArrowBuffer[i] = 0;
         GUArrowColors[i] = 8;
        }
      /////////////////////////////////////////////////////////////////////
      if(showClouds)
        {
         Cloud1Buffer_1[i] = GUSextBuffer[i];
         Cloud1Buffer_2[i] = GUSext2Buffer[i];

         Cloud2Buffer_1[i] = GDSextBuffer[i];
         Cloud2Buffer_2[i] = GDSext2Buffer[i];
        }
      else
      {
         Cloud1Buffer_1[i] = 0;
         Cloud1Buffer_2[i] = 0;

         Cloud2Buffer_1[i] = 0;
         Cloud2Buffer_2[i] = 0;
      }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GapDownStartValue(const int rates_total,
                         const double &open[],
                         const double &high[],
                         const double &low[],
                         const double &close[],
                         int nIndex)
  {
   if(nIndex >= rates_total || nIndex < 0)
      return 0;
   if(GapDownStart == _HIGH)
     {
      return high[nIndex];
     }
   else
      if(GapDownStart == _LOW)
        {
         return low[nIndex];
        }
      else
         if(GapDownStart == _CLOSE)
           {
            return close[nIndex];
           }
         else
            if(GapDownStart == _OPEN)
              {
               return open[nIndex];
              }
            else
              {
               return 0;
              }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GapDownEndValue(const int rates_total,
                       const double &open[],
                       const double &high[],
                       const double &low[],
                       const double &close[],
                       int nIndex)
  {
   if(nIndex >= rates_total || nIndex < 0)
      return 0;
   if(GapDownEnd == _HIGH)
     {
      return high[nIndex];
     }
   else
      if(GapDownEnd == _LOW)
        {
         return low[nIndex];
        }
      else
         if(GapDownEnd == _CLOSE)
           {
            return close[nIndex];
           }
         else
            if(GapDownEnd == _OPEN)
              {
               return open[nIndex];
              }
            else
              {
               return 0;
              }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GapUpStartValue(const int rates_total,
                       const double &open[],
                       const double &high[],
                       const double &low[],
                       const double &close[],
                       int nIndex)
  {
   if(nIndex >= rates_total || nIndex < 0)
      return 0;
   if(GapUpStart == _HIGH)
     {
      return high[nIndex];
     }
   else
      if(GapUpStart == _LOW)
        {
         return low[nIndex];
        }
      else
         if(GapUpStart == _CLOSE)
           {
            return close[nIndex];
           }
         else
            if(GapUpStart == _OPEN)
              {
               return open[nIndex];
              }
            else
              {
               return 0;
              }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GapUpEndValue(const int rates_total,
                     const double &open[],
                     const double &high[],
                     const double &low[],
                     const double &close[],
                     int nIndex)
  {
   if(nIndex >= rates_total || nIndex < 0)
      return 0;
   if(GapUpEnd == _HIGH)
     {
      return high[nIndex];
     }
   else
      if(GapUpEnd == _LOW)
        {
         return low[nIndex];
        }
      else
         if(GapUpEnd == _CLOSE)
           {
            return close[nIndex];
           }
         else
            if(GapUpEnd == _OPEN)
              {
               return open[nIndex];
              }
            else
              {
               return 0;
              }
  }
//+------------------------------------------------------------------+
