
//------------------------------------------------------------------
#property  copyright "Mr. X"
#property  link      "www.metaquotes.net"
//------------------------------------------------------------------




#property indicator_separate_window
#property indicator_levelcolor White
#property indicator_buffers 2
#property indicator_color1 Lime
#property indicator_color2 Red
#property indicator_level1 25.0
#property indicator_level2 15.0

extern int Len = 150;
extern int HistoryBars = 500;
extern int TF1 = 0;
extern int TF2 = 0;
extern bool ModeHL = TRUE;
//extern string i1 = "===mode settings===";
extern bool ModeOnline = TRUE;
extern bool ModeinFile = FALSE;
extern bool ModeHistory = FALSE;
//extern string i2 = "===notification settings===";
extern bool alert = false;
extern bool sound = FALSE;
extern bool email = FALSE;
extern bool GV = FALSE;
extern double UrovenSignal = 25.0;
double Green_Line[];
double Red_Line[];
double gd_156;
double gd_164;
double gd_172;
int i;
int j;
int gi_196;
int iBars_Tf2;
int g_count_208;
double gd_212;
double gd_220;
double gd_228;
double gd_236;
double gd_244;
double gd_252;
double Data_Arr1[][240];
double Data_Arr2[][240];
double Data_Arr3[][240];
int Current_Tf;
int Time_Check_1;
int gi_280;
bool gi_284;
int file_handle;
bool gi_292;
int window=1;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int init() {
   window=WindowOnDropped();
   if (ModeinFile) FileDelete(Symbol() + "-SP-" + Period() + ".ini");
   if (TF2 == 0) TF2 = (int)Period();
   if(TF2 / Period()!=0)HistoryBars = NormalizeDouble(HistoryBars / (TF2 / Period()), 0);
   SetIndexBuffer(0, Green_Line);
   SetIndexBuffer(1, Red_Line);
   SetIndexStyle(0, DRAW_LINE, STYLE_SOLID, 2);
   SetIndexStyle(1, DRAW_LINE, STYLE_SOLID, 2);
   ArrayResize(Data_Arr1, HistoryBars + Len);
   ArrayResize(Data_Arr2, HistoryBars + Len);
   ArrayResize(Data_Arr3, HistoryBars + Len);
   Current_Tf = Period();
   if (ModeinFile) file_handle = FileOpen(Symbol() + "-SP-" + Period() + ".ini", FILE_WRITE, " ");
   return (0);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int start() {
   int count_0;
   int limit;
   int li_12;
   int li_20;
   int str2time_24;
   int str2int_28;
   int str2int_32;
   int file_36;
   if (ModeOnline || ModeinFile) {
      if (iTime(NULL, TF2, 0) == Time_Check_1) {
         GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Green_Line",Green_Line[2]);
         GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Red_Line",Red_Line[2]);
         //Comment(Green_Line[1],"   ",Red_Line[1]);
         Draw_Hline("Green_Line[1]",Green_Line[2],indicator_color1);
         Draw_Hline("Red_Line[1]",Red_Line[2],indicator_color2);
         return (0);
         }
      Time_Check_1 = iTime(NULL, TF2, 0);
      for (i = HistoryBars + Len; i > 0; i--) {
         iBars_Tf2 = iBarShift(NULL, TF1, iTime(NULL, TF2, i));
         count_0 = 0;
         for (j = iBars_Tf2; j > iBars_Tf2 - TF2; j--) {
            Data_Arr1[i][count_0] = iClose(NULL, TF1, j);
            if (ModeHL) Data_Arr2[i][count_0] = iHigh(NULL, TF1, j);
            else Data_Arr2[i][count_0] = MathMax(iOpen(NULL, TF1, j), iClose(NULL, TF1, j));
            if (ModeHL) Data_Arr3[i][count_0] = iLow(NULL, TF1, j);
            else Data_Arr3[i][count_0] = MathMin(iOpen(NULL, TF1, j), iClose(NULL, TF1, j));
            count_0++;
         }
      }
      limit = NormalizeDouble((Bars - IndicatorCounted()) / (TF2 / Period()), 0);
      if(limit<0)limit=0;
      if (ModeOnline && (!IsTesting())) limit = HistoryBars;
      for (i = limit; i > 0; i--) {
         g_count_208 = 0;
         gd_228 = 0;
         gd_236 = 0;
         gd_212 = 0;
         gd_220 = 1000000;
         while (g_count_208 < Len) {
            gi_196 = i + g_count_208;
            gd_244 = 0;
            gd_252 = 0;
            for (int count_8 = 0; count_8 < TF2; count_8++) {
               if (Data_Arr1[gi_196][count_8] > 0.0) gd_156 = Data_Arr1[gi_196][count_8];
               if (Data_Arr2[gi_196][count_8] > 0.0) gd_164 = Data_Arr2[gi_196][count_8];
               if (Data_Arr3[gi_196][count_8] > 0.0) gd_172 = Data_Arr3[gi_196][count_8];
               if (gd_164 > gd_212) {
                  gd_212 = gd_164;
                  gd_244 += gd_156;
               }
               if (gd_172 < gd_220) {
                  gd_220 = gd_172;
                  gd_252 += gd_156;
               }
            }
            if (gd_244 > 0.0) gd_228 += gd_244;
            if (gd_252 > 0.0) gd_236 += gd_252;
            g_count_208++;
         }
         if (gd_228 > 0.0 && gd_236 > 0.0) {
            if (ModeinFile && gi_280 != Time[i]) {
               gi_280 = Time[i];
               FileWrite(file_handle, StringConcatenate(TimeToStr(Time[i]), ";", DoubleToStr(gd_228 / gd_236, 0), ";", DoubleToStr(gd_236 / gd_228, 0)));
            }
            li_12 = iBarShift(NULL, 0, iTime(NULL, TF2, i));
            for (int li_16 = li_12; li_16 > li_12 - TF2 / Period(); li_16--) {
               Green_Line[li_16] = gd_228 / gd_236;
               Red_Line[li_16] = gd_236 / gd_228;
            }
         }
      }
   GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Green_Line",Green_Line[2]);
   GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Red_Line",Red_Line[2]);
   Draw_Hline("Green_Line[1]",Green_Line[2],indicator_color1);
   Draw_Hline("Red_Line[1]",Red_Line[2],indicator_color2);
   //Comment(Green_Line[1],"   ",Red_Line[1]);
   }
   //---
   if (ModeHistory && (!ModeOnline) && (!ModeinFile) && gi_284 == FALSE) {
      gi_284 = TRUE;
      file_36 = FileOpen(Symbol() + "-SP-" + TF2 + ".ini", FILE_READ);
      while (!FileIsEnding(file_36)) {
         str2time_24 = StrToTime(FileReadString(file_36));
         str2int_28 = StrToInteger(FileReadString(file_36));
         str2int_32 = StrToInteger(FileReadString(file_36));
         li_20 = iBarShift(NULL, 0, str2time_24, FALSE);
         for (int limit0 = li_20; limit0 > li_20 - TF2 / Period(); limit0--) {
            Green_Line[limit0] = str2int_28;
            Red_Line[limit0] = str2int_32;
         }
      }
      FileClose(file_36);
   GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Green_Line",Green_Line[2]);
   GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Red_Line",Red_Line[2]);
   Draw_Hline("Green_Line[1]",Green_Line[2],indicator_color1);
   Draw_Hline("Red_Line[1]",Red_Line[2],indicator_color2);
   //Comment(Green_Line[1],"   ",Red_Line[1]);
   }
   //---
   string ls_44 = "";
   if (sound || alert || email || GV) {
      if (Green_Line[li_16 + 1] > UrovenSignal && Green_Line[li_16 + 1] < 1000000.0) ls_44 = Symbol() + " Signal " + WindowExpertName() + " BUY ( " + DoubleToStr(Green_Line[li_16 + 1], 1) + " )";
      if (Red_Line[li_16 + 1] > UrovenSignal && Red_Line[li_16 + 1] < 1000000.0) ls_44 = Symbol() + " Signal " + WindowExpertName() + " SELL ( " + DoubleToStr(Red_Line[li_16 + 1], 1) + " )";
      if (GV && (!IsTesting())) GlobalVariableSet(Symbol() + WindowExpertName(), Green_Line[li_16 + 1] - (Red_Line[li_16 + 1]));
      if (ls_44 != "" && (!IsTesting())) {
         if (sound && gi_292 == FALSE) PlaySound("Wait.wav");
         if (alert && gi_292 == FALSE) Alert(ls_44);
         if (email && gi_292 == FALSE) Alert_function(ls_44);
         gi_292 = TRUE;
      } else gi_292 = FALSE;
   }
//---
   //Comment(Green_Line[1],"   ",Red_Line[1]);
   Draw_Hline("Green_Line[1]",Green_Line[2],indicator_color1);
   Draw_Hline("Red_Line[1]",Red_Line[2],indicator_color2);
   GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Green_Line",Green_Line[2]);
   GlobalVariableSet("PeakRepainter"+Symbol()+(string)Period()+"Red_Line",Red_Line[2]);
//---
   return (0);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alert_function(string as_0) {
   if (IsTesting() == FALSE && IsOptimization() == FALSE && IsVisualMode() == FALSE) SendMail(WindowExpertName(), as_0);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deinit() {
   if (ModeinFile) FileClose(file_handle);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Draw_Hline(string name,double price,color clr){
//---
   ObjectCreate(name, OBJ_HLINE,window,0,0);
   color color_BG = ChartGetInteger(0,CHART_COLOR_BACKGROUND,0);
   ObjectSet(name, OBJPROP_COLOR, color_BG);
   ObjectSet(name, OBJPROP_BACK,true);
   ObjectSet(name, OBJPROP_PRICE1, price);
   ObjectSet(name, OBJPROP_WIDTH, 1);
   ObjectSet(name, OBJPROP_SELECTABLE,false);
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
