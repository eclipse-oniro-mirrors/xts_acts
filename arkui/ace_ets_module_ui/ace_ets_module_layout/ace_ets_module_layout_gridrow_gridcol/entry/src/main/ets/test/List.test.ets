/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import grid_colSpanJsunit from './GridColTest/grid_col.test';
import grid_rowOnBreakpointChangeJsunit from './GridRowTest/grid_row.test';
import Grid_Row_Columns from './GridTest/Grid_Row/Grid_Row_Columns/Grid_Row_Columns.test.ets';
import Grid_Row_Columns_Default from './GridTest/Grid_Row/Grid_Row_Columns/Grid_Row_Columns_Default.test.ets';
import Grid_Row_Columns_Option from './GridTest/Grid_Row/Grid_Row_Columns/Grid_Row_Columns_Option.test.ets';
import Grid_Row_Gutter from './GridTest/Grid_Row/Grid_Row_Gutter/Grid_Row_Gutter.test.ets';
import Grid_Row_Length_String from './GridTest/Grid_Row/Grid_Row_Gutter/Grid_Row_Length_String.test';
import Gutter_Length_Resource from './GridTest/Grid_Row/Grid_Row_Gutter/Grid_Row_Resource.test';
import Gutter_Length_Default from './GridTest/Grid_Row/Grid_Row_Gutter/Grid_Row_Default.test';
import Grid_Row_SizeOption from './GridTest/Grid_Row/Grid_Row_GutterOption/Grid_Row_SizeOption.test';
import Grid_Row_GutterOption_String from './GridTest/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_String.test';
import Grid_Row_GutterOption_Default from './GridTest/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Default.test';
import Grid_Row_GutterOption_Number from './GridTest/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Number.test';
import Grid_Row_Direction_Row from './GridTest/Grid_Row/Grid_Row_Direction/Grid_Row_Direction_Row.test';
import Grid_Row_Direction_RowReverse from './GridTest/Grid_Row/Grid_Row_Direction/Grid_Row_Direction_RowReverse.test';
import Grid_Row_Breakpoints_Default from './GridTest/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Default.test';
import Grid_Row_Breakpoints_Component from './GridTest/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Component.test';
import Grid_Row_Breakpoints_Window from './GridTest/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Window.test';
import Grid_Row_Breakpoints_Change from './GridTest/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Change.test';
import Grid_Row_Breakpoints_Incremental
  from './GridTest/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Incremental.test';
import Grid_Row_Breakpoints_Negative from './GridTest/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Negative.test';
import Grid_Row_Breakpoints_Quantity from './GridTest/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Quantity.test';
import GridRow_onBreakpoint from './GridTest/Grid_Row/onBreakpointChange/onBreakpointChange.test';
import Grid_Col_Span_Default from './GridColTest/Grid_Col_Span/Grid_Col_Span_Default.test.ets';
import Grid_Col_Span_Number from './GridColTest/Grid_Col_Span/Grid_Col_Span_Number.test.ets';
import Grid_Col_Span_GridColColumnOption from './GridColTest/Grid_Col_Span/Grid_Col_Span_GridColColumnOption.test.ets';
import Grid_Col_Order_Default from './GridColTest/Grid_Col_Order/Grid_Col_Order_Default.test.ets';
import Grid_Col_Order_Number from './GridColTest/Grid_Col_Order/Grid_Col_Order_Number.test.ets';
import Grid_Col_Order_GridColColumnOption from './GridColTest/Grid_Col_Order/Grid_Col_Order_GridColColumnOption.test.ets';
import Grid_Col_Offset_Default from './GridColTest/Grid_Col_Offset/Grid_Col_Offset_Default.test.ets';
import Grid_Col_Offset_Number from './GridColTest/Grid_Col_Offset/Grid_Col_Offset_Number.test.ets';
import Grid_Col_Offset_GridColColumnOption from './GridColTest/Grid_Col_Offset/Grid_Col_Offset_GridColColumnOption.test.ets';
import GridRowCol from './GridTest/GridRowCol.test';
import GridRowCol02 from './GridTest/GridRowCol02.test.ets';
import GridRowJsunit from './GridTest/GridRowJsunit.test.ets';
import gridContainerJsunit from './GridTest/GridContainerJsunit.test';
import GridRows1 from './GridRowTest/GridRows1.test';
import GridRows2 from './GridRowTest/GridRows2.test';
import gridColTest from './GridColTest/GridColJsunit.test';
import GridRowNoColumnsTest from './GridRowTest/GridRowNoColumnsTest.test.ets'
import GridRowFixAtIdealSizeTest from './GridRowTest/GridRowFixAtIdealSizeTest.ets'
import GridColFixAtIdealSizeTest from './GridColTest/GridColFixAtIdealSizeTest.ets'

export default function testsuite() {
  grid_colSpanJsunit();
  grid_rowOnBreakpointChangeJsunit();
  Grid_Row_Columns()
  Grid_Row_Columns_Option()
  Grid_Row_Columns_Default()
  Grid_Row_Gutter()
  Gutter_Length_Resource()
  Gutter_Length_Default()
  Grid_Row_GutterOption_Number()
  Grid_Row_GutterOption_Default()
  Grid_Row_Direction_Row()
  Grid_Row_Direction_RowReverse()
  Grid_Row_Length_String()
  Grid_Row_SizeOption()
  Grid_Row_GutterOption_String()
  Grid_Row_Breakpoints_Default()
  Grid_Row_Breakpoints_Component()
  Grid_Row_Breakpoints_Window()
  Grid_Row_Breakpoints_Change()
  Grid_Row_Breakpoints_Incremental()
  Grid_Row_Breakpoints_Negative()
  Grid_Row_Breakpoints_Quantity()
  GridRow_onBreakpoint()
  Grid_Col_Span_Default()
  Grid_Col_Span_Number()
  Grid_Col_Span_GridColColumnOption()
  Grid_Col_Order_Default()
  Grid_Col_Order_Number()
  Grid_Col_Order_GridColColumnOption()
  Grid_Col_Offset_Default()
  Grid_Col_Offset_Number()
  Grid_Col_Offset_GridColColumnOption()
  GridRowCol();
  GridRowCol02();
  GridRowJsunit();
  gridContainerJsunit();
  GridRows1();
  GridRows2();
  gridColTest();
  GridRowNoColumnsTest();
  GridRowFixAtIdealSizeTest();
  GridColFixAtIdealSizeTest();
}