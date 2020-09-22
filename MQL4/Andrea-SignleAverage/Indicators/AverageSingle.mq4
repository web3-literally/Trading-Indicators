//+------------------------------------------------------------------+
//|                                                AverageSingle.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//#property indicator_separate_window
#property indicator_buffers 2
#property indicator_plots   2
//--- plot Arrow1
#property indicator_label1  "BuyArrow"
#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  3
//--- plot Arrow2
#property indicator_label2  "SellArrow"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrAqua
#property indicator_style2  STYLE_SOLID
#property indicator_width2  3
//--- input parameters
input int      Average1=5;
input int      Average2=10;
input int      Average3=15;
input int      Average4=20;

input int      NCANDLES=2;
input int      RANGEPIPS=20;
//--- indicator buffers
double         Arrow1Buffer[];
double         Arrow2Buffer[];


#include "Program.mqh"
CProgram program;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,Arrow1Buffer);
   SetIndexBuffer(1,Arrow2Buffer);
//--- setting a code from the Wingdings charset as the property of PLOT_ARROW

   SetIndexStyle(0, DRAW_ARROW);
   SetIndexStyle(1, DRAW_ARROW);

   SetIndexArrow(0, 233);
   SetIndexArrow(1, 234);

   SetIndexLabel(0,"BUY");
   SetIndexLabel(1,"SELL");

   SetIndexEmptyValue(0,0.0);
   SetIndexEmptyValue(1,0.0);

   program.SetAverageCount(Average1, Average2, Average3, Average4);
   program.OnInitEvent();
//--- Set up the trading panel
   if(!program.CreateExpertPanel())
     {
      ::Print(__FUNCTION__," > Failed to create graphical interface!");
      return(INIT_FAILED);
     }
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   program.OnDeinitEvent(reason);
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
   datetime todayStart = iTime(Symbol(), PERIOD_D1, 0);
   int todayStartShift = iBarShift(Symbol(), 0, todayStart);
   double dStartOpen = iOpen(Symbol(), 0, todayStartShift);
   double dNowClose = iClose(Symbol(), 0, 0);
   double dDayOpen = iOpen(Symbol(), 0, todayStartShift);
   double dMIN = iLow(Symbol(), 0, todayStartShift);
   double dMAX = iHigh(Symbol(), 0, todayStartShift);
   for(int i=todayStartShift; i>0; i--)
     {
      double dHigh = iHigh(Symbol(), 0, i);
      double dLow = iLow(Symbol(), 0, i);
      if(dHigh > dMAX)
         dMAX = dHigh;
      if(dLow < dMIN)
         dMIN = dLow;
     }

   double StartNowPips = NormalizeDouble((dNowClose - dStartOpen) * pow(10, Digits - 1), 2);
   double StartNowPercent = NormalizeDouble((dNowClose - dStartOpen) / dStartOpen * 100, 2);

   double MinMaxPips, MinMaxPercent, MaxMinPips, MaxMinPercent;
   if(dNowClose < dDayOpen)
     {
      MinMaxPips = NormalizeDouble((dNowClose - dMIN) * pow(10, Digits - 1), 2);
      MinMaxPercent = NormalizeDouble((dNowClose - dMIN) / dMIN * 100, 2);

      MaxMinPips = NormalizeDouble((dMIN - dMAX) * pow(10, Digits - 1), 2);
      MaxMinPercent = NormalizeDouble((dMIN - dMAX) / dMAX * 100, 2);
     }
   else
     {
      MinMaxPips = NormalizeDouble((dMAX - dMIN) * pow(10, Digits - 1), 2);
      MinMaxPercent = NormalizeDouble((dMAX - dMIN) / dMIN * 100, 2);

      MaxMinPips = NormalizeDouble((dNowClose - dMAX) * pow(10, Digits - 1), 2);
      MaxMinPercent = NormalizeDouble((dNowClose - dMAX) / dMAX * 100, 2);
     }

   double dAvg1 = 0, dAvg2 = 0, dAvg3 = 0, dAvg4 = 0;
   for(int i=0; i<Average1; i++)
      dAvg1 += (iHigh(Symbol(), 0, i) - iLow(Symbol(), 0, i));
   dAvg1 = NormalizeDouble(dAvg1 / Average1 * pow(10, Digits - 1), 2);

   for(int i=0; i<Average2; i++)
      dAvg2 += (iHigh(Symbol(), 0, i) - iLow(Symbol(), 0, i));
   dAvg2 = NormalizeDouble(dAvg2 / Average1 * pow(10, Digits - 1), 2);

   for(int i=0; i<Average3; i++)
      dAvg3 += (iHigh(Symbol(), 0, i) - iLow(Symbol(), 0, i));
   dAvg3 = NormalizeDouble(dAvg3 / Average1 * pow(10, Digits - 1), 2);

   for(int i=0; i<Average4; i++)
      dAvg4 += (iHigh(Symbol(), 0, i) - iLow(Symbol(), 0, i));
   dAvg4 = NormalizeDouble(dAvg4 / Average1 * pow(10, Digits - 1), 2);

   program.SetTableData(StartNowPips, StartNowPercent, MinMaxPips, MinMaxPercent, MaxMinPips, MaxMinPercent, dAvg1, dAvg2, dAvg3, dAvg4);

   for(int i=0; i < rates_total-prev_calculated; i++)
     {
      if(i + NCANDLES > rates_total)
         continue;

      int nBullish = 0, nBearish = 0;
      double dPipRange = 0;
      dMAX = high[i];
      dMIN = low[i];
      for(int index = i; index < i + NCANDLES; index++)
        {
         if (dMAX < high[index]) dMAX = high[index];
         if (dMIN > low[index]) dMIN = low[index];
         if(close[index] > open[index])
            nBullish++;
         else
            nBearish++;
        }
      dPipRange = (dMAX - dMIN) * pow(10, Digits - 1);  
      
      if(dPipRange >= RANGEPIPS)
        {
         if(nBullish >= NCANDLES)
           {
            Arrow2Buffer[i] = close[i];
           }
         if(nBearish >= NCANDLES)
           {
            Arrow1Buffer[i] = close[i];
           }
        }
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int    id,
                  const long   &lparam,
                  const double &dparam,
                  const string &sparam)
  {
   program.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
