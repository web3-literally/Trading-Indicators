//+------------------------------------------------------------------+
//|                              Corey TPO Profile (c) version 1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link "https://www.mql5.com"
#property version "1.00"
#property indicator_separate_window

enum PPRH_MODE
  {
   PPRH_TICKSIZE = 0,  //TICKSIZE
   PPRH_AUTOMATIC = 1, //AUTOMATIC
   PPRH_CUSTOM = 2,    //CUSTOM
  };

enum TPP_MODE
  {
   TPP_DAY = 0,     //DAY
   TPP_WEEK = 1,    //WEEK
   TPP_MINUTE = 2,  //MINUTE
   TPP_HOUR = 3,    //HOUR
   TPP_MONTH = 4,   //MONTH
   TPP_OPT_EXP = 5, //OPT EXP
   TPP_CHART = 6,   //CHART
   TPP_BAR = 7,     //BAR
   TPP_YEAR = 8     //YEAR
  };

enum PRICE_TYPE
  {
   _HIGH = 0,  //HIGH
   _LOW = 1,   //LOW
   _CLOSE = 2, //CLOSE
   _OPEN = 3,  //OPEN
  };
//--- input parameters
input bool showExtensions = true;
input PPRH_MODE pricePerRowHeightMode = PPRH_TICKSIZE;
input float customRowHeight = 1.0;
input TPP_MODE timePerProfile = TPP_DAY;
input float multiplier = 1;
input bool onExpansion = false;
input int profiles = 1000;
input bool showPointOfControl = false;
input bool showValueArea = false;
input int valueAreaPercent = 70;
input int opacity = 50;
input bool ShowLabels = false;
input bool showclouds = true;
input PRICE_TYPE price = _CLOSE;
input int smaLength = 10;


int OffsetEST = 0;
int OffsetCST = 0;
int period = 0;
int period_buffer[];
int count_buffer[];
int cond_buffer[];
int height_buffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   OffsetEST = TimeGMT() - TimeTradeServer()- 4 * 3600;
   OffsetCST = TimeGMT() - TimeTradeServer()- 6 * 3600;

//---
   return (INIT_SUCCEEDED);
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
   for(int i=prev_calculated; i<rates_total; i++)
     {
      switch(timePerProfile)
        {
         case TPP_CHART:
            period_buffer[i] = 0;
         case TPP_MINUTE:
            period_buffer[i] = floor(seconds(time[i]) / 60 + day_number(time[0], time[i]) * 24 * 60);
         case TPP_HOUR:
            period_buffer[i] = floor(seconds(time[i])/3600 + day_number(time[0], time[i]) * 24);
         case TPP_DAY:
            period_buffer[i] = CountTradingDays(time[0], time[i]) - 1;
         case TPP_WEEK:
            period_buffer[i] = floor(day_number(time[0], time[i]) / 7);
         case TPP_MONTH:
            period_buffer[i] = floor(month(time[i]) - month(time[0]));
         case TPP_OPT_EXP:
            period_buffer[i] = exp_opt(time[i]) - exp_opt(time[0]);
         case TPP_BAR:
            period_buffer[i] = i;
         case TPP_YEAR:
            period_buffer[i] = floor(year(time[i]) - year(time[0]));
        }

      if(i == 0)
        {
         count_buffer[i] = 0;
         cond_buffer[i] = period_buffer[i];
        }
      else
        {
         if(period_buffer[i] != period_buffer[i - 1])
           {
            count_buffer[i] = (count_buffer[i-1] + period_buffer[i] - period_buffer[i-1]) % multiplier;
           }
         else
           {
            count_buffer[i] = count_buffer[i-1];
           }

         if(count_buffer[i] < count_buffer[i-1])
           {
            cond_buffer[i] = 1 + period_buffer[i] - period_buffer[i-1];
           }
         else
           {
            cond_buffer[i] = period_buffer[i] - period_buffer[i-1];
           }
        }
        
      switch(pricePerRowHeightMode)
      {
         case PPRH_AUTOMATIC:
            height_buffer[i] = 
      }

     }
//--- return value of prev_calculated for next call
   return (rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int seconds(datetime time)
  {
   datetime ESTDateTime;
   ESTDateTime = time + OffsetEST;
   int nESTDaySecond = ESTDateTime % (24 * 3600);
   return nESTDaySecond;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int month(datetime time)
  {
   datetime CSTDateTime;
   CSTDateTime = time + OffsetCST;
   MqlDateTime MqlTime;
   TimeToStruct(CSTDateTime, MqlTime);
   return MqlTime.year * 12 + MqlTime.mon;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int day_number(datetime firstTime, datetime curTime)
  {
   datetime ESTDateTime;
   ESTDateTime = curTime + OffsetEST;
   MqlDateTime MqlTime;
   TimeToStruct(ESTDateTime, MqlTime);
   return (curTime - firstTime) / (24 * 3600) + MqlTime.day_of_week;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int dom(datetime time)
  {
   MqlDateTime MqlTime;
   TimeToStruct(time, MqlTime);
   return MqlTime.day;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int dow(datetime time)
  {
   datetime time1 = time - (dom(time) - 1) * 24 * 3600;
   MqlDateTime MqlTime;
   TimeToStruct(time1, MqlTime);
   return MqlTime.day_of_week;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int expthismonth(datetime time)
  {
   int nDow = dow(time);
   if(nDow > 5)
     {
      return 27 - nDow;
     }
   else
     {
      return 20 - nDow;
     }
  }
//+------------------------------------------------------------------+
int exp_opt(datetime time)
  {
   if(dom(time) > expthismonth(time))
      return month(time) + 1;
   return month(time);
  }
//+------------------------------------------------------------------+
int year(datetime time)
  {
   datetime CSTDateTime;
   CSTDateTime = time + OffsetCST;
   MqlDateTime MqlTime;
   TimeToStruct(CSTDateTime, MqlTime);
   return MqlTime.year;
  }
//+------------------------------------------------------------------+
int CountTradingDays(datetime startTime, datetime endTime)
  {
   return iBarShift(NULL, PERIOD_D1, startTime) - iBarShift(NULL, PERIOD_D1, endTime);
  }
//+------------------------------------------------------------------+
