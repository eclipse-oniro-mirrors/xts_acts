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
import OnlyColumnsTemplate1 from './GridTest/OnlyColumnsTemplate/OnlyColumnsTemplate1.test';
import OnlyColumnsTemplate2 from './GridTest/OnlyColumnsTemplate/OnlyColumnsTemplate2.test';
import OnlyColumnsTemplate3 from './GridTest/OnlyColumnsTemplate/OnlyColumnsTemplate3.test';
import OnlyColumnsTemplate4 from './GridTest/OnlyColumnsTemplate/OnlyColumnsTemplate4.test';
import OnlyColumnsTemplate5 from './GridTest/OnlyColumnsTemplate/OnlyColumnsTemplate5.test';
import OnlyRowsTemplate1 from './GridTest/OnlyRowsTemplate/OnlyRowsTemplate1.test';
import OnlyRowsTemplate2 from './GridTest/OnlyRowsTemplate/OnlyRowsTemplate2.test';
import OnlyRowsTemplate3 from './GridTest/OnlyRowsTemplate/OnlyRowsTemplate3.test';
import OnlyRowsTemplate4 from './GridTest/OnlyRowsTemplate/OnlyRowsTemplate4.test';
import OnlyRowsTemplate5 from './GridTest/OnlyRowsTemplate/OnlyRowsTemplate5.test';
import ColumnsTemplateAndRowsTemplate1
  from './GridTest/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplate1.test';
import ColumnsTemplateAndRowsTemplate2
  from './GridTest/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplate2.test';
import ColumnsTemplateAndRowsTemplateNoSet
  from './GridTest/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplateNoSet.test';
import Calc01 from './GridTest/Calc/Calc01Jsunit.test';
import Calc02 from './GridTest/Calc/Calc02Jsunit.test';
import GridRows1 from './GridRowTest/GridRows1.test';
import GridRows2 from './GridRowTest/GridRows2.test';
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
import enmusHorizontalAlignJsunit from './Column/EnmusHorizontalAlignJsunit.test';
import blankJsunit from './BlankTest/BlankJsunit.test';
import columnJsunit from './ColumnTest/ColumnJsunit.test';
import dividerJsunit from './DividerTest/DividerJsunit.test';
import flexJsunit from './FlexTest/FlexJsunit.test';
import gridContainerJsunit from './GridTest/GridContainerJsunit.test';
import useShadowBatching from './ColumnTest/useShadowBatching.test';
import RelativeContainer_Level from './RelativeContainer/RelativeContainer_Level/RelativeContainer_Level.test.ets';
import RelativeContainer_Vertical
  from './RelativeContainer/RelativeContainer_Vertical/RelativeContainer_Vertical.test.ets';
import RelativeContainer_AnchorPoint_Absent
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Absent.test.ets';
import RelativeContainer_AnchorPoint_Circular_Dependency
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Circular_Dependency.test.ets';
import RelativeContainer_AnchorPoint_Interdependence
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Interdependence.test.ets';
import RelativeContainer_AnchorPoint_Margin
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Margin.test.ets';
import RelativeContainer_AnchorPoint_Padding
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Padding.test.ets';
import RelativeContainer_AnchorPoint_ThreeDirection
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_ThreeDirection.test.ets';
import RelativeContainer_AnchorPoint_TwoDirection
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_TwoDirection.test.ets';
import RelativeContainer_AnchorPoint_Visibility_Hidden
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Visibility_Hidden.test.ets';
import RelativeContainer_AnchorPoint_Visibility_None
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Visibility_None.test.ets';
import RelativeContainer_AnchorPoint_NoId
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_NoId.test.ets';
import RelativeContainer_AnchorPoint_Id_Null
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Id_Null.test.ets';
import RelativeContainer_AnchorPoint_Id_Undefined
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Id_Undefined.test.ets';
import RelativeContainer_AnchorPoint_Offset
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Offset.test.ets';
import RelativeContainer_AnchorPoint_Position
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Position.test.ets';
import blankUIJsunit from './BlankTest/BlankUIJsunit.test.ets';
import dividerUIJsunit from './DividerTest/dividerUIJsunit.test.ets';
import blank3Jsunit from './BlankTest/Blank3Jsunit.test';
import flexWrapJsunit from './FlexTest/FlexWrapJsunit.test.ets';
import gradientDirectionJsunit from './Row/GradientDirectionJsunit.test.ets';
import dividerJsunitt from './DividerTest/DividerJsunitt.test.ets';
import directionJsunit from './Flex/DirectionJsunit.test.ets';
import direction2Jsunit from './Flex/Direction2Jsunit.test.ets';
import placementJsunit from './Flex/PlacementJsunit.test';
import rowJsunit2 from './Row/RowJsunit2.test.ets';
import flexDirectionJsunit from './Flex/FlexDirectionJsunit.test.ets';
import DividerJsunit from './DividerTest/DividerJsunit1.test.ets';
export default function testsuite() {
  GridRows2();
  GridRows1();
  OnlyRowsTemplate3();
  OnlyColumnsTemplate4();
  OnlyRowsTemplate4();
  OnlyColumnsTemplate1();
  OnlyRowsTemplate1();
  OnlyColumnsTemplate5();
  OnlyRowsTemplate5();
  OnlyColumnsTemplate2();
  OnlyColumnsTemplate3();
  OnlyRowsTemplate2();
  ColumnsTemplateAndRowsTemplate1();
  ColumnsTemplateAndRowsTemplate2();
  ColumnsTemplateAndRowsTemplateNoSet();
  Calc01();
  Calc02();
  Row_Space()
  Row_Space_String()
  Row_Space_Default()
  Row_layoutWeight_All()
  Row_layoutWeight_Default()
  Row_layoutWeight_flexGrow()
  Row_layoutWeight_flexShrink()
  Row_layoutWeight_Part()
  Row_flexGrow_Default()
  Row_flexGrow_Part()
  Row_flexShrink_Default()
  Row_flexShrink_Part()
  Row_flexBasis_Default()
  Row_flexBasis_Type()
  rowNesting_Space()
  rowNesting_alignItems()
  rowNesting_justifyContent()
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
  Row_FlexAlign();
  Row_Margin();
  Row_MarginPadding();
  Row_Padding();
  Row_Size();
  Row_VerticalAlign();
  blankJsunit()
  columnJsunit()
  dividerJsunit()
  flexJsunit()
  dividerUIJsunit();
  blankUIJsunit();
  blank3Jsunit();
  flexWrapJsunit();
  gradientDirectionJsunit();
  dividerJsunitt();
  directionJsunit();
  direction2Jsunit();
  placementJsunit();
  rowJsunit2();
  flexDirectionJsunit();
  DividerJsunit();
  gridContainerJsunit()
  useShadowBatching()
  RelativeContainer_Level()
  RelativeContainer_Vertical()
  RelativeContainer_AnchorPoint_Absent()
  RelativeContainer_AnchorPoint_Circular_Dependency()
  RelativeContainer_AnchorPoint_Interdependence()
  RelativeContainer_AnchorPoint_Margin()
  RelativeContainer_AnchorPoint_Padding()
  RelativeContainer_AnchorPoint_ThreeDirection()
  RelativeContainer_AnchorPoint_TwoDirection()
  RelativeContainer_AnchorPoint_Visibility_Hidden()
  RelativeContainer_AnchorPoint_Visibility_None()
  RelativeContainer_AnchorPoint_NoId()
  RelativeContainer_AnchorPoint_Id_Null()
  RelativeContainer_AnchorPoint_Id_Undefined()
  RelativeContainer_AnchorPoint_Offset()
  RelativeContainer_AnchorPoint_Position()
  enmusHorizontalAlignJsunit()
}