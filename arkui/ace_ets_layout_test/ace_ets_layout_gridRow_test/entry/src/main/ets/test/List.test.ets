/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import Grid_Row_Columns from './Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns.test.ets';
import Grid_Row_Columns_Default from './Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns_Default.test.ets';
import Grid_Row_Columns_Option from './Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns_Option.test.ets';
import Grid_Row_Gutter from './Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Gutter.test.ets';
import Grid_Row_Length_String from './Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Length_String.test';
import Gutter_Length_Resource from './Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Resource.test';
import Gutter_Length_Default from './Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Default.test';
import Grid_Row_SizeOption from './Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_SizeOption.test';
import Grid_Row_GutterOption_String from './Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_String.test';
import Grid_Row_GutterOption_Default from './Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Default.test';
import Grid_Row_GutterOption_Number from './Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Number.test';
import Grid_Row_Direction_Row from './Grid/Grid_Row/Grid_Row_Direction/Grid_Row_Direction_Row.test';
import Grid_Row_Direction_RowReverse from './Grid/Grid_Row/Grid_Row_Direction/Grid_Row_Direction_RowReverse.test';
import Grid_Row_Breakpoints_Default from './Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Default.test';
import Grid_Row_Breakpoints_Component from './Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Component.test';
import Grid_Row_Breakpoints_Window from './Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Window.test';
import Grid_Row_Breakpoints_Change from './Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Change.test';
import Grid_Row_Breakpoints_Incremental
  from './Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Incremental.test';
import Grid_Row_Breakpoints_Negative from './Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Negative.test';
import Grid_Row_Breakpoints_Quantity from './Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Quantity.test';
import GridRow_onBreakpoint from './Grid/Grid_Row/onBreakpointChange/onBreakpointChange.test';


export default function testsuite() {


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

}