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
import Row_layoutWeight_All from './RowTest/layoutWeight/Row_layoutWeight_All.test.ets';
import Row_layoutWeight_Default from './RowTest/layoutWeight/Row_layoutWeight_Default.test.ets';
import Row_layoutWeight_flexGrow from './RowTest/layoutWeight/Row_layoutWeight_flexGrow.test.ets';
import Row_layoutWeight_flexShrink from './RowTest/layoutWeight/Row_layoutWeight_flexShrink.test.ets';
import Row_layoutWeight_Part from './RowTest/layoutWeight/Row_layoutWeight_Part.test.ets';
import Row_flexGrow_Default from './RowTest/flexGrow/Row_flexGrow_Default.test.ets';
import Row_flexGrow_Part from './RowTest/flexGrow/Row_flexGrow_Part.test.ets';
import Row_flexShrink_Default from './RowTest/flexShrink/Row_flexShrink_Default.test.ets';
import Row_flexShrink_Part from './RowTest/flexShrink/Row_flexShrink_Part.test.ets';
import Row_flexBasis_Default from './RowTest/flexBasis/Row_flexBasis_Default.test.ets';
import Row_flexBasis_Type from './RowTest/flexBasis/Row_flexBasis_Type.test.ets';
import rowNesting_Space from './RowTest/RowNesting/rowNesting_Space.test.ets';
import rowNesting_alignItems from './RowTest/RowNesting/rowNesting_alignItems.test.ets';
import rowNesting_justifyContent from './RowTest/RowNesting/rowNesting_justifyContent.test.ets';
import row_TextSizeTest from './RowTest/subComponentChanged/Row_TextSize.test';
import rowPad_TextMarPadTest from './RowTest/subComponentChanged/RowPad_TextMarPad.test';
import rowMar_TextMarPadTest from './RowTest/subComponentChanged/RowMar_TextMarPad.test';
import rowMarPad_TextMarPadTest from './RowTest/subComponentChanged/RowMarPad_TextMarPad.test';
import row_TextPositionTest from './RowTest/subComponentChanged/Row_TextPosition.test';
import row_TextOffsetTest from './RowTest/subComponentChanged/Row_TextOffset.test';
import row_TextDisplayPriorityTest from './RowTest/subComponentChanged/Row_TextDisplayPriority.test';
import row_TextLayoutWeightTest from './RowTest/subComponentChanged/Row_TextLayoutWeight.test';
import row_TextFlexShrinkTest from './RowTest/subComponentChanged/Row_TextFlexShrink.test';
import row_TextVisibilityTest from './RowTest/subComponentChanged/Row_TextVisibility.test';
import Row_Space from './RowTest/spaceChanged/Row_Space.test.ets';
import Row_Space_String from './RowTest/spaceChanged/Row_Space_String.test.ets';
import Row_Space_Default from './RowTest/spaceChanged/Row_Space_Default.test.ets';
import Row_FlexAlign from './RowTest/parentComponentChanged/Row_FlexAlign.test';
import Row_Margin from './RowTest/parentComponentChanged/Row_Margin.test';
import Row_MarginPadding from './RowTest/parentComponentChanged/Row_MarginPadding.test';
import Row_Padding from './RowTest/parentComponentChanged/Row_Padding.test';
import Row_Size from './RowTest/parentComponentChanged/Row_Size.test';
import Row_VerticalAlign from './RowTest/parentComponentChanged/Row_VerticalAlign.test';
import enumsVerticalAlignJsunit from './Row/EnmusVerticalAlignJsunit.test';
import rowJsunit2 from './Row/RowJsunit2.test.ets';
import VisibilityJsunit from './Row/VisibilityJsunit.test';
import rowJsunit from './Row/RowJsunit.test';
import RowReverseTest from './Row/RowReverseTest.test.ets'
import RowSpaceResourceTest from './Row/RowSpaceResourceTest.test.ets'
import RowFixAtIdealSizeTest from './Row/RowFixAtIdealSizeTest.ets'
import RowMatchParentTest from './Row/RowMatchParentTest.ets'
import RowWrapContentTest from './Row/RowWrapContentTest.ets'

export default function testsuite() {
  Row_layoutWeight_All();
  Row_layoutWeight_Default();
  Row_layoutWeight_flexGrow();
  Row_layoutWeight_flexShrink();
  Row_layoutWeight_Part();
  Row_flexGrow_Default();
  Row_flexGrow_Part();
  Row_flexShrink_Default();
  Row_flexShrink_Part();
  Row_flexBasis_Default();
  Row_flexBasis_Type();
  rowNesting_Space();
  rowNesting_alignItems();
  rowNesting_justifyContent();
  row_TextSizeTest();
  rowPad_TextMarPadTest();
  rowMar_TextMarPadTest();
  rowMarPad_TextMarPadTest();
  row_TextPositionTest();
  row_TextOffsetTest();
  row_TextDisplayPriorityTest();
  row_TextLayoutWeightTest();
  row_TextFlexShrinkTest();
  row_TextVisibilityTest();
  Row_Space();
  Row_Space_String();
  Row_Space_Default();
  Row_FlexAlign();
  Row_Margin();
  Row_MarginPadding();
  Row_Padding();
  Row_Size();
  Row_VerticalAlign();
  enumsVerticalAlignJsunit();
  rowJsunit2();
  VisibilityJsunit();
  rowJsunit();
  RowReverseTest();
  RowSpaceResourceTest();
  RowFixAtIdealSizeTest();
  RowMatchParentTest();
  RowWrapContentTest();
}