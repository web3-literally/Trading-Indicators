//+------------------------------------------------------------------+
//|                                Corey Gapfinder (c) version 1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//#property indicator_separate_window
#property indicator_buffers 94
#property indicator_plots   46

#property indicator_label1  "EMA1"
#property indicator_type1   DRAW_COLOR_LINE
#property indicator_color1  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "EMA2"
#property indicator_type2   DRAW_COLOR_LINE
#property indicator_color2  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "Open Range High"
#property indicator_type3   DRAW_COLOR_LINE
#property indicator_color3  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  3

#property indicator_label4  "Open Range Low"
#property indicator_type4   DRAW_COLOR_LINE
#property indicator_color4  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

#property indicator_label5  "IBHigh"
#property indicator_type5   DRAW_COLOR_LINE
#property indicator_color5  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style5  STYLE_SOLID
#property indicator_width5  1

#property indicator_label6  "IBLow"
#property indicator_type6   DRAW_COLOR_LINE
#property indicator_color6  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style6  STYLE_SOLID
#property indicator_width6  1

#property indicator_label7  "IBHighExt"
#property indicator_type7   DRAW_COLOR_LINE
#property indicator_color7  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style7  STYLE_SOLID
#property indicator_width7  3

#property indicator_label8  "IBLowExt"
#property indicator_type8   DRAW_COLOR_LINE
#property indicator_color8  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style8  STYLE_SOLID
#property indicator_width8  3

#property indicator_label9  "ibInside25"
#property indicator_type9   DRAW_COLOR_LINE
#property indicator_color9  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style9  STYLE_DASH
#property indicator_width9  2

#property indicator_label10  "IB25"
#property indicator_type10   DRAW_COLOR_LINE
#property indicator_color10  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style10  STYLE_DASH
#property indicator_width10  2

#property indicator_label11  "ibInside50"
#property indicator_type11   DRAW_COLOR_LINE
#property indicator_color11  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style11  STYLE_DASH
#property indicator_width11  2

#property indicator_label12  "IB50"
#property indicator_type12   DRAW_COLOR_LINE
#property indicator_color12  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style12  STYLE_DASH
#property indicator_width12  2

#property indicator_label13  "ibInside75"
#property indicator_type13   DRAW_COLOR_LINE
#property indicator_color13  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style13  STYLE_DASH
#property indicator_width13  2

#property indicator_label14  "IB75"
#property indicator_type14   DRAW_COLOR_LINE
#property indicator_color14  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style14  STYLE_DASH
#property indicator_width14  2


#property indicator_label15  "ibUp50"
#property indicator_type15   DRAW_COLOR_LINE
#property indicator_color15  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style15  STYLE_DASH
#property indicator_width15  2

#property indicator_label16  "ibUp50ext"
#property indicator_type16   DRAW_COLOR_LINE
#property indicator_color16  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style16  STYLE_DASH
#property indicator_width16  2

#property indicator_label17  "ibUp100"
#property indicator_type17   DRAW_COLOR_LINE
#property indicator_color17  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style17  STYLE_DASH
#property indicator_width17  2

#property indicator_label18  "ibUp100ext"
#property indicator_type18   DRAW_COLOR_LINE
#property indicator_color18  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style18  STYLE_DASH
#property indicator_width18  2

#property indicator_label19  "ibUpVar"
#property indicator_type19   DRAW_COLOR_LINE
#property indicator_color19  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style19  STYLE_DASH
#property indicator_width19  2

#property indicator_label20  "ibUpVarext"
#property indicator_type20   DRAW_COLOR_LINE
#property indicator_color20  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style20  STYLE_DASH
#property indicator_width20  2


#property indicator_label21  "ibDown50"
#property indicator_type21   DRAW_COLOR_LINE
#property indicator_color21  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style21  STYLE_DASH
#property indicator_width21  2

#property indicator_label22  "ibDown50ext"
#property indicator_type22   DRAW_COLOR_LINE
#property indicator_color22  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style22  STYLE_DASH
#property indicator_width22  2

#property indicator_label23  "ibDown100"
#property indicator_type23   DRAW_COLOR_LINE
#property indicator_color23  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style23  STYLE_DASH
#property indicator_width23  2

#property indicator_label24  "ibDown100ext"
#property indicator_type24   DRAW_COLOR_LINE
#property indicator_color24  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style24  STYLE_DASH
#property indicator_width24  2

#property indicator_label25  "ibDownVar"
#property indicator_type25   DRAW_COLOR_LINE
#property indicator_color25  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style25  STYLE_DASH
#property indicator_width25  2

#property indicator_label26  "ibDownVarext"
#property indicator_type26   DRAW_COLOR_LINE
#property indicator_color26  clrRed,clrBlue,clrGreen,clrYellow,clrMagenta,clrCyan,clrLime,clrOrange,clrNONE
#property indicator_style26  STYLE_DASH
#property indicator_width26  2

/////////////////////////// Cloud - Indicator //////////////////////////////

#property indicator_label27  "Cloud1"
#property indicator_type27   DRAW_FILLING
#property indicator_color27  clrRed,clrGreen
#property indicator_width27  1

#property indicator_label28  "Cloud2"
#property indicator_type28   DRAW_FILLING
#property indicator_color28  clrYellow,clrYellow
#property indicator_width28  1

#property indicator_label29  "Cloud3"
#property indicator_type29   DRAW_FILLING
#property indicator_color29  clrYellow,clrYellow
#property indicator_width29  1

#property indicator_label30  "Cloud4"
#property indicator_type30   DRAW_FILLING
#property indicator_color30  clrGreen,clrRed
#property indicator_width230  1

#property indicator_label31  "Cloud5"
#property indicator_type31   DRAW_FILLING
#property indicator_color31  clrRed,clrGreen
#property indicator_width31  1

#property indicator_label32  "Cloud6"
#property indicator_type32   DRAW_FILLING
#property indicator_color32  clrYellow,clrYellow
#property indicator_width32  1

#property indicator_label33  "Cloud7"
#property indicator_type33   DRAW_FILLING
#property indicator_color33  clrYellow,clrYellow
#property indicator_width33  1

#property indicator_label34  "Cloud8"
#property indicator_type34   DRAW_FILLING
#property indicator_color34  clrGreen,clrRed
#property indicator_width34  1


#property indicator_label35  "Cloud9"
#property indicator_type35   DRAW_FILLING
#property indicator_color35  clrMagenta,clrMagenta
#property indicator_width35  1

#property indicator_label36  "Cloud10"
#property indicator_type36   DRAW_FILLING
#property indicator_color36  clrMagenta,clrMagenta
#property indicator_width36  1

#property indicator_label37  "Cloud11"
#property indicator_type37   DRAW_FILLING
#property indicator_color37  clrPink,clrPink
#property indicator_width37  1

#property indicator_label38  "Cloud12"
#property indicator_type38   DRAW_FILLING
#property indicator_color38  clrMagenta,clrMagenta
#property indicator_width38  1

#property indicator_label39  "Cloud13"
#property indicator_type39   DRAW_FILLING
#property indicator_color39  clrMagenta,clrMagenta
#property indicator_width39  1

#property indicator_label40  "Cloud14"
#property indicator_type40   DRAW_FILLING
#property indicator_color40  clrPink,clrPink
#property indicator_width40  1

#property indicator_label41  "Cloud15"
#property indicator_type41   DRAW_FILLING
#property indicator_color41  clrMagenta,clrMagenta
#property indicator_width41  1

#property indicator_label42  "Cloud16"
#property indicator_type42   DRAW_FILLING
#property indicator_color42  clrMagenta,clrMagenta
#property indicator_width42  1

#property indicator_label43  "Cloud17"
#property indicator_type43   DRAW_FILLING
#property indicator_color43  clrPink,clrPink
#property indicator_width43  1

#property indicator_label44  "Cloud18"
#property indicator_type44   DRAW_FILLING
#property indicator_color44  clrMagenta,clrMagenta
#property indicator_width44  1

#property indicator_label45  "Cloud19"
#property indicator_type45   DRAW_FILLING
#property indicator_color45  clrMagenta,clrMagenta
#property indicator_width45  1

#property indicator_label46  "Cloud20"
#property indicator_type46   DRAW_FILLING
#property indicator_color46  clrPink,clrPink
#property indicator_width46  1

#define INDICATOR_EMPTY_VALUE -1.0

//--- Buffers of values of segment ends
double         EMA1_Buffer[], EMA1_Colors[];
double         EMA2_Buffer[], EMA2_Colors[];
double         ORHigh_Buffer[], ORLow_Buffer[];
double         OpenRangeHigh_Buffer[], OpenRangeHigh_Colors[];
double         OpenRangeLow_Buffer[], OpenRangeLow_Colors[];
double         IBHigh_Buffer[], IBHigh_Colors[];
double         IBLow_Buffer[], IBLow_Colors[];
double         IBHighExt_Buffer[], IBHighExt_Colors[];
double         IBLowExt_Buffer[], IBLowExt_Colors[];

double         ibInside25_Buffer[], ibInside25_Colors[];
double         IB25_Buffer[], IB25_Colors[];
double         ibInside50_Buffer[], ibInside50_Colors[];
double         IB50_Buffer[], IB50_Colors[];
double         ibInside75_Buffer[], ibInside75_Colors[];
double         IB75_Buffer[], IB75_Colors[];

double         ibUp50_Buffer[], ibUp50_Colors[];
double         ibUp50ext_Buffer[], ibUp50ext_Colors[];
double         ibUp100_Buffer[], ibUp100_Colors[];
double         ibUp100ext_Buffer[], ibUp100ext_Colors[];
double         ibUpVar_Buffer[], ibUpVar_Colors[];
double         ibUpVarext_Buffer[], ibUpVarext_Colors[];

double         ibDown50_Buffer[], ibDown50_Colors[];
double         ibDown50ext_Buffer[], ibDown50ext_Colors[];
double         ibDown100_Buffer[], ibDown100_Colors[];
double         ibDown100ext_Buffer[], ibDown100ext_Colors[];
double         ibDownVar_Buffer[], ibDownVar_Colors[];
double         ibDownVarext_Buffer[], ibDownVarext_Colors[];

double         Cloud1Up[], Cloud1Down[];
double         Cloud2Up[], Cloud2Down[];
double         Cloud3Up[], Cloud3Down[];
double         Cloud4Up[], Cloud4Down[];
double         Cloud5Up[], Cloud5Down[];
double         Cloud6Up[], Cloud6Down[];
double         Cloud7Up[], Cloud7Down[];
double         Cloud8Up[], Cloud8Down[];
double         Cloud9Up[], Cloud9Down[];
double         Cloud10Up[], Cloud10Down[];
double         Cloud11Up[], Cloud11Down[];
double         Cloud12Up[], Cloud12Down[];
double         Cloud13Up[], Cloud13Down[];
double         Cloud14Up[], Cloud14Down[];
double         Cloud15Up[], Cloud15Down[];
double         Cloud16Up[], Cloud16Down[];
double         Cloud17Up[], Cloud17Down[];
double         Cloud18Up[], Cloud18Down[];
double         Cloud19Up[], Cloud19Down[];
double         Cloud20Up[], Cloud20Down[];


//--- input parameters
input bool     showArrows=true;
input bool     ShowQuads=true;
input bool     ShowExtensions=true;
input bool     ShowCloudsIB=true;
input bool     ShowCloudExt=true;
input bool     ShowLabels=true;

input int      OpenRangeMinutes = 60;
input int      MarketOpenTime = 0930;
input bool     ShowTodayOnly = false;
input bool     UseEMACross = true;
input int      EMA1_Len = 8;
input int      EMA2_Len = 13;
input float    ExtensionVariable = 3.00;

int OffsetEST = 0;
int countp = 0;
int countv = 0;
int counti25 = 0;
int counti50 = 0;
int counti75 = 0;
int countUp50 = 0;
int countUp100 = 0;
int countUpVar = 0;
int countDown50 = 0;
int countDown100 = 0;
int countDownVar = 0;


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,EMA1_Buffer,INDICATOR_DATA);
   SetIndexBuffer(1,EMA1_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(2,EMA2_Buffer,INDICATOR_DATA);
   SetIndexBuffer(3,EMA2_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(4,OpenRangeHigh_Buffer,INDICATOR_DATA);
   SetIndexBuffer(5,OpenRangeHigh_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(6,OpenRangeLow_Buffer,INDICATOR_DATA);
   SetIndexBuffer(7,OpenRangeLow_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(8,IBHigh_Buffer,INDICATOR_DATA);
   SetIndexBuffer(9,IBHigh_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(10,IBLow_Buffer,INDICATOR_DATA);
   SetIndexBuffer(11,IBLow_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(12,IBHighExt_Buffer,INDICATOR_DATA);
   SetIndexBuffer(13,IBHighExt_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(14,IBLowExt_Buffer,INDICATOR_DATA);
   SetIndexBuffer(15,IBLowExt_Colors,INDICATOR_COLOR_INDEX);


   SetIndexBuffer(16,ibInside25_Buffer,INDICATOR_DATA);
   SetIndexBuffer(17,ibInside25_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(18,IB25_Buffer,INDICATOR_DATA);
   SetIndexBuffer(19,IB25_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(20,ibInside50_Buffer,INDICATOR_DATA);
   SetIndexBuffer(21,ibInside50_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(22,IB50_Buffer,INDICATOR_DATA);
   SetIndexBuffer(23,IB50_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(24,ibInside75_Buffer,INDICATOR_DATA);
   SetIndexBuffer(25,ibInside75_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(26,IB75_Buffer,INDICATOR_DATA);
   SetIndexBuffer(27,IB75_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(28,ibUp50_Buffer,INDICATOR_DATA);
   SetIndexBuffer(29,ibUp50_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(30,ibUp50ext_Buffer,INDICATOR_DATA);
   SetIndexBuffer(31,ibUp50ext_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(32,ibUp100_Buffer,INDICATOR_DATA);
   SetIndexBuffer(33,ibUp100_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(34,ibUp100ext_Buffer,INDICATOR_DATA);
   SetIndexBuffer(35,ibUp100ext_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(36,ibUpVar_Buffer,INDICATOR_DATA);
   SetIndexBuffer(37,ibUpVar_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(38,ibUpVarext_Buffer,INDICATOR_DATA);
   SetIndexBuffer(39,ibUpVarext_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(40,ibDown50_Buffer,INDICATOR_DATA);
   SetIndexBuffer(41,ibDown50_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(42,ibDown50ext_Buffer,INDICATOR_DATA);
   SetIndexBuffer(43,ibDown50ext_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(44,ibDown100_Buffer,INDICATOR_DATA);
   SetIndexBuffer(45,ibDown100_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(46,ibDown100ext_Buffer,INDICATOR_DATA);
   SetIndexBuffer(47,ibDown100ext_Colors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(48,ibDownVar_Buffer,INDICATOR_DATA);
   SetIndexBuffer(49,ibDownVar_Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(50,ibDownVarext_Buffer,INDICATOR_DATA);
   SetIndexBuffer(51,ibDownVarext_Colors,INDICATOR_COLOR_INDEX);




   SetIndexBuffer(52,Cloud1Up,INDICATOR_DATA);
   SetIndexBuffer(53,Cloud1Down,INDICATOR_DATA);
   SetIndexBuffer(54,Cloud2Up,INDICATOR_DATA);
   SetIndexBuffer(55,Cloud2Down,INDICATOR_DATA);
   SetIndexBuffer(56,Cloud3Up,INDICATOR_DATA);
   SetIndexBuffer(57,Cloud3Down,INDICATOR_DATA);
   SetIndexBuffer(58,Cloud4Up,INDICATOR_DATA);
   SetIndexBuffer(59,Cloud4Down,INDICATOR_DATA);
   SetIndexBuffer(60,Cloud5Up,INDICATOR_DATA);
   SetIndexBuffer(61,Cloud5Down,INDICATOR_DATA);
   SetIndexBuffer(62,Cloud6Up,INDICATOR_DATA);
   SetIndexBuffer(63,Cloud6Down,INDICATOR_DATA);
   SetIndexBuffer(64,Cloud7Up,INDICATOR_DATA);
   SetIndexBuffer(65,Cloud7Down,INDICATOR_DATA);
   SetIndexBuffer(66,Cloud8Up,INDICATOR_DATA);
   SetIndexBuffer(67,Cloud8Down,INDICATOR_DATA);
   SetIndexBuffer(68,Cloud9Up,INDICATOR_DATA);
   SetIndexBuffer(69,Cloud9Down,INDICATOR_DATA);
   SetIndexBuffer(70,Cloud10Up,INDICATOR_DATA);
   SetIndexBuffer(71,Cloud10Down,INDICATOR_DATA);
   SetIndexBuffer(72,Cloud11Up,INDICATOR_DATA);
   SetIndexBuffer(73,Cloud11Down,INDICATOR_DATA);
   SetIndexBuffer(74,Cloud12Up,INDICATOR_DATA);
   SetIndexBuffer(75,Cloud12Down,INDICATOR_DATA);
   SetIndexBuffer(76,Cloud13Up,INDICATOR_DATA);
   SetIndexBuffer(77,Cloud13Down,INDICATOR_DATA);
   SetIndexBuffer(78,Cloud14Up,INDICATOR_DATA);
   SetIndexBuffer(79,Cloud14Down,INDICATOR_DATA);
   SetIndexBuffer(80,Cloud15Up,INDICATOR_DATA);
   SetIndexBuffer(81,Cloud15Down,INDICATOR_DATA);
   SetIndexBuffer(82,Cloud16Up,INDICATOR_DATA);
   SetIndexBuffer(83,Cloud16Down,INDICATOR_DATA);
   SetIndexBuffer(84,Cloud17Up,INDICATOR_DATA);
   SetIndexBuffer(85,Cloud17Down,INDICATOR_DATA);
   SetIndexBuffer(86,Cloud18Up,INDICATOR_DATA);
   SetIndexBuffer(87,Cloud18Down,INDICATOR_DATA);
   SetIndexBuffer(88,Cloud19Up,INDICATOR_DATA);
   SetIndexBuffer(89,Cloud19Down,INDICATOR_DATA);
   SetIndexBuffer(90,Cloud20Up,INDICATOR_DATA);
   SetIndexBuffer(91,Cloud20Down,INDICATOR_DATA);

   SetIndexBuffer(92,ORHigh_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(93,ORLow_Buffer,INDICATOR_CALCULATIONS);


   for(int i = 0; i<indicator_plots; i++)
     {
      PlotIndexSetDouble(i,PLOT_EMPTY_VALUE,INDICATOR_EMPTY_VALUE);
     }

   PlotIndexSetInteger(0, PLOT_LINE_COLOR, clrPink);
   PlotIndexSetInteger(1, PLOT_LINE_COLOR, clrYellow);
   PlotIndexSetInteger(2, PLOT_LINE_COLOR, clrRed);
   PlotIndexSetInteger(3, PLOT_LINE_COLOR, clrGreen);
   PlotIndexSetInteger(4, PLOT_LINE_COLOR, clrRed);
   PlotIndexSetInteger(5, PLOT_LINE_COLOR, clrGreen);
   PlotIndexSetInteger(6, PLOT_LINE_COLOR, clrRed);
   PlotIndexSetInteger(7, PLOT_LINE_COLOR, clrGreen);

   for(int i = 8; i<indicator_plots; i++)
     {
      PlotIndexSetInteger(i, PLOT_LINE_COLOR, clrWhite);
     }
//PlotIndexSetInteger(26,PLOT_SHIFT,1);

   OffsetEST = TimeGMT() - TimeTradeServer()- 4 * 3600;
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
   int maHandle1 = iMA(Symbol(), PERIOD_CURRENT, EMA1_Len, 0, MODE_EMA, PRICE_HIGH);
   int maHandle2 = iMA(Symbol(), PERIOD_CURRENT, EMA2_Len, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(maHandle1, 0, 0, rates_total, EMA1_Buffer);
   CopyBuffer(maHandle2, 0, 0, rates_total, EMA2_Buffer);

   for(int i = 1; i < rates_total-1; i++)
     {
      ORHigh(time, high, i);
      ORLow(time, low, i);

      ////////////////////////////// OPEN RANGE HIGH & LOW ////////////////////////////////
      if(ShowTodayOnly && !today(time, rates_total, i))
        {
         OpenRangeHigh_Buffer[i] = INDICATOR_EMPTY_VALUE;
         OpenRangeLow_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      else
         if(!OpenRangeTime(time[i]))
           {
            OpenRangeHigh_Buffer[i] = ORHigh_Buffer[i];
            OpenRangeLow_Buffer[i] = ORLow_Buffer[i];
           }
         else
           {
            OpenRangeHigh_Buffer[i] = INDICATOR_EMPTY_VALUE;
            OpenRangeLow_Buffer[i] = INDICATOR_EMPTY_VALUE;
           }
      //////////////////////////////// IBHIGH & IBLOW //////////////////////////////
      if(SwingHigh(i))
        {
         IBHigh_Buffer[i] = ORHigh_Buffer[i];
        }
      else
        {
         IBHigh_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(SwingLow(i))
        {
         IBLow_Buffer[i] = ORLow_Buffer[i];
        }
      else
        {
         IBLow_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      //////////////////////////////IBHIGHEXT & IBLOWEXT////////////////////////////////
      if(IBHigh_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && IBHigh_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countp = 1;
      else
         countp++;

      if(IBHigh_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         IBHighExt_Buffer[i] = IBHigh_Buffer[i - countp];
        }
      else
        {
         IBHighExt_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(IBLow_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && IBLow_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countv = 1;
      else
         countv++;

      if(IBLow_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         IBLowExt_Buffer[i] = IBLow_Buffer[i - countv];
        }
      else
        {
         IBLowExt_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      //////////////////////////////ibInside25 & IB25////////////////////////////////
      if(ShowQuads && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibInside25_Buffer[i] = (ORHigh_Buffer[i] - ORLow_Buffer[i]) / 4 + ORLow_Buffer[i];
        }
      else
        {
         ibInside25_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibInside25_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibInside25_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         counti25 = 1;
      else
         counti25++;

      if(ibInside25_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         IB25_Buffer[i] = ibInside25_Buffer[i - counti25];
        }
      else
        {
         IB25_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      //////////////////////////////ibInside50 & IB50////////////////////////////////
      if(ShowQuads && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibInside50_Buffer[i] = (ORHigh_Buffer[i] - ORLow_Buffer[i]) / 2 + ORLow_Buffer[i];
        }
      else
        {
         ibInside50_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibInside50_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibInside50_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         counti50 = 1;
      else
         counti50++;

      if(ibInside50_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         IB50_Buffer[i] = ibInside50_Buffer[i - counti50];
        }
      else
        {
         IB50_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      //////////////////////////////ibInside75 & IB75////////////////////////////////
      if(ShowQuads && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibInside75_Buffer[i] = (ORHigh_Buffer[i] - ORLow_Buffer[i]) / 4 * 3 + ORLow_Buffer[i];
        }
      else
        {
         ibInside75_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibInside75_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibInside75_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         counti75 = 1;
      else
         counti75++;

      if(ibInside75_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         IB75_Buffer[i] = ibInside75_Buffer[i - counti75];
        }
      else
        {
         IB75_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }




      //////////////////////////////ibUp50 & ibUp50ext////////////////////////////////
      if(ShowExtensions && OpenRangeHigh_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibUp50_Buffer[i] = (ORHigh_Buffer[i] - ORLow_Buffer[i]) / 2 + ORHigh_Buffer[i];
        }
      else
        {
         ibUp50_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibUp50_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibUp50_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countUp50 = 1;
      else
         countUp50++;

      if(ibUp50_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         ibUp50ext_Buffer[i] = ibUp50_Buffer[i - countUp50];
        }
      else
        {
         ibUp50ext_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      //////////////////////////////ibUp100 & ibUp100ext////////////////////////////////
      if(ShowExtensions && OpenRangeHigh_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibUp100_Buffer[i] = (ORHigh_Buffer[i] - ORLow_Buffer[i]) / 1 + ORHigh_Buffer[i];
        }
      else
        {
         ibUp100_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibUp100_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibUp100_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countUp100 = 1;
      else
         countUp100++;

      if(ibUp100_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         ibUp100ext_Buffer[i] = ibUp100_Buffer[i - countUp100];
        }
      else
        {
         ibUp100ext_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      //////////////////////////////ibUpVar & ibUpVarext////////////////////////////////
      if(ShowExtensions && OpenRangeHigh_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibUpVar_Buffer[i] = (ORHigh_Buffer[i] - ORLow_Buffer[i]) * ExtensionVariable + ORHigh_Buffer[i];
        }
      else
        {
         ibUpVar_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibUpVar_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibUpVar_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countUpVar = 1;
      else
         countUpVar++;

      if(ibUpVar_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         ibUpVarext_Buffer[i] = ibUpVar_Buffer[i - countUpVar];
        }
      else
        {
         ibUpVarext_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }



      //////////////////////////////ibDown50 & ibDown50ext////////////////////////////////
      if(ShowExtensions && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibDown50_Buffer[i] = ORLow_Buffer[i] - (ORHigh_Buffer[i] - ORLow_Buffer[i]) / 2;
        }
      else
        {
         ibDown50_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibDown50_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibDown50_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countDown50 = 1;
      else
         countDown50++;

      if(ibDown50_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         ibDown50ext_Buffer[i] = ibDown50_Buffer[i - countDown50];
        }
      else
        {
         ibDown50ext_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      //////////////////////////////ibDown100 & ibDown100ext////////////////////////////////
      if(ShowExtensions && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibDown100_Buffer[i] = ORLow_Buffer[i] - (ORHigh_Buffer[i] - ORLow_Buffer[i]) / 1;
        }
      else
        {
         ibDown100_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibDown100_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibDown100_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countDown100 = 1;
      else
         countDown100++;

      if(ibDown100_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         ibDown100ext_Buffer[i] = ibDown100_Buffer[i - countDown100];
        }
      else
        {
         ibDown100ext_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }
      //////////////////////////////ibDownVar & ibDownVarext////////////////////////////////
      if(ShowExtensions && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         ibDownVar_Buffer[i] = ORLow_Buffer[i] - (ORHigh_Buffer[i] - ORLow_Buffer[i]) * ExtensionVariable;
        }
      else
        {
         ibDownVar_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }

      if(ibDownVar_Buffer[i] == INDICATOR_EMPTY_VALUE && (i-1 >=0 && ibDownVar_Buffer[i-1] != INDICATOR_EMPTY_VALUE))
         countDownVar = 1;
      else
         countDownVar++;

      if(ibDownVar_Buffer[i] == INDICATOR_EMPTY_VALUE && LastMinute(time[i]))
        {
         ibDownVarext_Buffer[i] = ibDownVar_Buffer[i - countDownVar];
        }
      else
        {
         ibDownVarext_Buffer[i] = INDICATOR_EMPTY_VALUE;
        }


      //////////////////////////////Cloud////////////////////////////////
      if(ShowCloudsIB && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE)
         Cloud1Up[i] = OpenRangeLow_Buffer[i];
      else
         Cloud1Up[i] = 0;

      if(ShowCloudsIB && ibInside25_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud1Down[i] = ibInside25_Buffer[i];
         Cloud2Up[i] = ibInside25_Buffer[i];
        }
      else
        {
         Cloud1Down[i] = 0;
         Cloud2Up[i] = 0;
        }

      if(ShowCloudsIB && ibInside50_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud2Down[i] = ibInside50_Buffer[i];
         Cloud3Up[i] = ibInside50_Buffer[i];
        }
      else
        {
         Cloud2Down[i] = 0;
         Cloud3Up[i] = 0;
        }

      if(ShowCloudsIB && ibInside75_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud3Down[i] = ibInside75_Buffer[i];
         Cloud4Up[i] = ibInside75_Buffer[i];
        }
      else
        {
         Cloud3Down[i] = 0;
         Cloud4Up[i] = 0;
        }

      if(ShowCloudsIB && OpenRangeHigh_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud4Down[i] = OpenRangeHigh_Buffer[i];
        }
      else
        {
         Cloud4Down[i] = 0;
        }

      //////////////////////////////Cloud////////////////////////////////
      if(ShowCloudsIB && IBLowExt_Buffer[i] != INDICATOR_EMPTY_VALUE)
         Cloud5Up[i] = IBLowExt_Buffer[i];
      else
         Cloud5Up[i] = 0;

      if(ShowCloudsIB && IB25_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud5Down[i] = IB25_Buffer[i];
         Cloud6Up[i] = IB25_Buffer[i];
        }
      else
        {
         Cloud5Down[i] = 0;
         Cloud6Up[i] = 0;
        }

      if(ShowCloudsIB && IB50_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud6Down[i] = IB50_Buffer[i];
         Cloud7Up[i] = IB50_Buffer[i];
        }
      else
        {
         Cloud6Down[i] = 0;
         Cloud7Up[i] = 0;
        }

      if(ShowCloudsIB && IB75_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud7Down[i] = IB75_Buffer[i];
         Cloud8Up[i] = IB75_Buffer[i];
        }
      else
        {
         Cloud7Down[i] = 0;
         Cloud8Up[i] = 0;
        }

      if(ShowCloudsIB && IBHighExt_Buffer[i] != INDICATOR_EMPTY_VALUE)
        {
         Cloud8Down[i] = IBHighExt_Buffer[i];
        }
      else
        {
         Cloud8Down[i] = 0;
        }

      //////////////////////////////Cloud////////////////////////////////
      if(ShowCloudExt && OpenRangeLow_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyLow(time[i]) < OpenRangeLow_Buffer[i])
        {
         Cloud9Up[i] = ibDown50_Buffer[i];
         Cloud9Down[i] = OpenRangeLow_Buffer[i];
        }
      else
        {
         Cloud9Up[i] = 0;
         Cloud9Down[i] = 0;
        }

      if(ShowCloudExt && ibDown50_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyLow(time[i]) < ibDown50_Buffer[i])
        {
         Cloud10Up[i] = ibDown100_Buffer[i];
         Cloud10Down[i] = ibDown50_Buffer[i];
        }
      else
        {
         Cloud10Up[i] = 0;
         Cloud10Down[i] = 0;
        }


      if(ShowCloudExt && ibDown100_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyLow(time[i]) < ibDown100_Buffer[i])
        {
         Cloud11Up[i] = DailyLow(time[i]);
         Cloud11Down[i] = ibDown100_Buffer[i];
        }
      else
        {
         Cloud11Up[i] = 0;
         Cloud11Down[i] = 0;
        }


      //////////////////////////////Cloud////////////////////////////////
      if(ShowCloudExt && IBLowExt_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyLow(time[i]) < IBLowExt_Buffer[i])
        {
         Cloud12Up[i] = ibDown50ext_Buffer[i];
         Cloud12Down[i] = IBLowExt_Buffer[i];
        }
      else
        {
         Cloud12Up[i] = 0;
         Cloud12Down[i] = 0;
        }

      if(ShowCloudExt && ibDown50ext_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyLow(time[i]) < ibDown50ext_Buffer[i])
        {
         Cloud13Up[i] = ibDown100ext_Buffer[i];
         Cloud13Down[i] = ibDown50ext_Buffer[i];
        }
      else
        {
         Cloud13Up[i] = 0;
         Cloud13Down[i] = 0;
        }


      if(ShowCloudExt && ibDown100ext_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyLow(time[i]) < ibDown100ext_Buffer[i])
        {
         Cloud14Up[i] = DailyLow(time[i]);
         Cloud14Down[i] = ibDown100ext_Buffer[i];
        }
      else
        {
         Cloud14Up[i] = 0;
         Cloud14Down[i] = 0;
        }

      //////////////////////////////Cloud////////////////////////////////
      if(ShowCloudExt && OpenRangeHigh_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyHigh(time[i]) > OpenRangeHigh_Buffer[i])
        {
         Cloud15Up[i] = OpenRangeHigh_Buffer[i];
         Cloud15Down[i] = ibUp50_Buffer[i];
        }
      else
        {
         Cloud15Up[i] = 0;
         Cloud15Down[i] = 0;
        }

      if(ShowCloudExt && ibUp50_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyHigh(time[i]) > ibUp50_Buffer[i])
        {
         Cloud16Up[i] = ibUp50_Buffer[i];
         Cloud16Down[i] = ibUp100_Buffer[i];
        }
      else
        {
         Cloud16Up[i] = 0;
         Cloud16Down[i] = 0;
        }


      if(ShowCloudExt && ibUp100_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyHigh(time[i]) > ibUp100_Buffer[i])
        {
         Cloud17Up[i] = ibUp100_Buffer[i];
         Cloud17Down[i] = DailyHigh(time[i]);
        }
      else
        {
         Cloud17Up[i] = 0;
         Cloud17Down[i] = 0;
        }

      //////////////////////////////Cloud////////////////////////////////
      if(ShowCloudExt && IBHighExt_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyHigh(time[i]) > IBHighExt_Buffer[i])
        {
         Cloud18Up[i] = IBHighExt_Buffer[i];
         Cloud18Down[i] = ibUp50ext_Buffer[i];
        }
      else
        {
         Cloud18Up[i] = 0;
         Cloud18Down[i] = 0;
        }

      if(ShowCloudExt && ibUp50ext_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyHigh(time[i]) > ibUp50ext_Buffer[i])
        {
         Cloud19Up[i] = ibUp50ext_Buffer[i];
         Cloud19Down[i] = ibUp100ext_Buffer[i];
        }
      else
        {
         Cloud19Up[i] = 0;
         Cloud19Down[i] = 0;
        }


      if(ShowCloudExt && ibUp100ext_Buffer[i] != INDICATOR_EMPTY_VALUE && DailyHigh(time[i]) > ibUp100ext_Buffer[i])
        {
         Cloud20Up[i] = ibUp100ext_Buffer[i];
         Cloud20Down[i] = DailyHigh(time[i]);
        }
      else
        {
         Cloud20Up[i] = 0;
         Cloud20Down[i] = 0;
        }

     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool today(const datetime &time[], int rates_total, int nIndex)
  {
   MqlDateTime LastestDateTime, CurrentDateTime;
   TimeToStruct(time[rates_total - 1], LastestDateTime);
   TimeToStruct(time[nIndex], CurrentDateTime);
   if(LastestDateTime.day_of_year == CurrentDateTime.day_of_year)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FirstMinute(datetime time)
  {
   datetime ESTDateTime;
   ESTDateTime = time + OffsetEST;
   int nESTDaySecond = ESTDateTime % (24 * 3600);
   int nMarketOpenTimeSeconds = (MarketOpenTime / 100) * 3600 + (MarketOpenTime % 100) * 60;
   if(nESTDaySecond - nMarketOpenTimeSeconds < 60)
      return true;
   else
      return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool LastMinute(datetime time)
  {
   datetime ESTDateTime;
   ESTDateTime = time + OffsetEST;
   int nESTDaySecond = ESTDateTime % (24 * 3600);
   int nMarketOpenTimeSeconds = (MarketOpenTime / 100) * 3600 + (MarketOpenTime % 100) * 60;
   if(nMarketOpenTimeSeconds - nESTDaySecond > 60)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool OpenRangeTime(datetime time)
  {
   datetime ESTDateTime;
   ESTDateTime = time + OffsetEST;
   int nESTDaySecond = ESTDateTime % (24 * 3600);
   int nMarketOpenTimeSeconds = (MarketOpenTime / 100) * 3600 + (MarketOpenTime % 100) * 60;
   if(nESTDaySecond - nMarketOpenTimeSeconds < 60 * OpenRangeMinutes)
      return true;
   else
      return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ORHigh(const datetime &time[],
              const double &high[],
              const int nIndex)
  {
   if(nIndex == 0)
     {
      ORHigh_Buffer[nIndex] = high[nIndex];
      return high[nIndex];
     }
   else
      if(FirstMinute(time[nIndex]))
        {
         ORHigh_Buffer[nIndex] = high[nIndex];
         return high[nIndex];
        }
      else
         if(OpenRangeTime(time[nIndex]) && (high[nIndex] > ORHigh_Buffer[nIndex - 1]))
           {
            ORHigh_Buffer[nIndex] = high[nIndex];
            return high[nIndex];
           }
         else
           {
            ORHigh_Buffer[nIndex] = ORHigh_Buffer[nIndex - 1];
            return ORHigh_Buffer[nIndex - 1];
           }
  }
//+------------------------------------------------------------------+
double ORLow(const datetime &time[],
             const double &low[],
             const int nIndex)
  {
   if(nIndex == 0)
     {
      ORLow_Buffer[nIndex] = low[nIndex];
      return low[nIndex];
     }
   else
      if(FirstMinute(time[nIndex]))
        {
         ORLow_Buffer[nIndex] = low[nIndex];
         return low[nIndex];
        }
      else
         if(OpenRangeTime(time[nIndex]) && (low[nIndex] < ORLow_Buffer[nIndex - 1]))
           {
            ORLow_Buffer[nIndex] = low[nIndex];
            return low[nIndex];
           }
         else
           {
            ORLow_Buffer[nIndex] = ORLow_Buffer[nIndex - 1];
            return ORLow_Buffer[nIndex - 1];
           }
  }
//+------------------------------------------------------------------+
bool SwingHigh(int nIndex)
  {
   if(OpenRangeHigh_Buffer[nIndex] != INDICATOR_EMPTY_VALUE)
      return true;
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SwingLow(int nIndex)
  {
   if(OpenRangeLow_Buffer[nIndex] != INDICATOR_EMPTY_VALUE)
      return true;
   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double DailyLow(datetime time)
  {
   return iLow(Symbol(), PERIOD_D1, iBarShift(Symbol(), PERIOD_D1, time));
  }
//+------------------------------------------------------------------+
double DailyHigh(datetime time)
  {
   return iHigh(Symbol(), PERIOD_D1, iBarShift(Symbol(), PERIOD_D1, time));
  }
//+------------------------------------------------------------------+
