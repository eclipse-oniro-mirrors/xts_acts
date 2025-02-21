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

import Grid_Col_Span_Default from './Grid/Grid_Col/Grid_Col_Span/Grid_Col_Span_Default.test.ets';
 import Grid_Col_Span_Number from './Grid/Grid_Col/Grid_Col_Span/Grid_Col_Span_Number.test.ets';
 import Grid_Col_Span_GridColColumnOption from './Grid/Grid_Col/Grid_Col_Span/Grid_Col_Span_GridColColumnOption.test.ets';
 import Grid_Col_Order_Default from './Grid/Grid_Col/Grid_Col_Order/Grid_Col_Order_Default.test.ets';
 import Grid_Col_Order_Number from './Grid/Grid_Col/Grid_Col_Order/Grid_Col_Order_Number.test.ets';
 import Grid_Col_Order_GridColColumnOption from './Grid/Grid_Col/Grid_Col_Order/Grid_Col_Order_GridColColumnOption.test.ets';
 import Grid_Col_Offset_Default from './Grid/Grid_Col/Grid_Col_Offset/Grid_Col_Offset_Default.test.ets';
 import Grid_Col_Offset_Number from './Grid/Grid_Col/Grid_Col_Offset/Grid_Col_Offset_Number.test.ets';
 import Grid_Col_Offset_GridColColumnOption from './Grid/Grid_Col/Grid_Col_Offset/Grid_Col_Offset_GridColColumnOption.test.ets';



export default function testsuite() {

  Grid_Col_Span_Default()
  Grid_Col_Span_Number()
  Grid_Col_Span_GridColColumnOption()
  Grid_Col_Order_Default()
  Grid_Col_Order_Number()
  Grid_Col_Order_GridColColumnOption()
  Grid_Col_Offset_Default()
  Grid_Col_Offset_Number()
  Grid_Col_Offset_GridColColumnOption()

}