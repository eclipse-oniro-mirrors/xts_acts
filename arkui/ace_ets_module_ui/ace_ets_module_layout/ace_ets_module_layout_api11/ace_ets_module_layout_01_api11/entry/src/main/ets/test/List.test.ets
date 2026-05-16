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
import Stack_Text from './Stack_Text/Stack_Text.test';
import grid_colSpanJsunit from './GridColTest/grid_col.test';
import grid_rowOnBreakpointChangeJsunit from './GridRowTest/grid_row.test';
import inspectorJsunit from './inspectorTest/inspector.test'
import Column_Space from './ColumnTest/spaceChanged/Column_Space.test.ets';
import Column_Space_String from './ColumnTest/spaceChanged/Column_Space_String.test.ets';
import Column_Space_Default from './ColumnTest/spaceChanged/Column_Space_Default.test.ets';
import layoutWeight_Part from './ColumnTest/layoutWeight/layoutWeight_Part.test';
import layoutWeight_All from './ColumnTest/layoutWeight/layoutWeight_All.test';
import layoutWeight_Default from './ColumnTest/layoutWeight/layoutWeight_Default.test.ets';
import layoutWeight_flexGrow from './ColumnTest/layoutWeight/layoutWeight_flexGrow.test.ets';
import layoutWeight_flexShrink from './ColumnTest/layoutWeight/layoutWeight_flexShrink.test.ets';
import flexGrow_Part from './ColumnTest/flexGrow/flexGrow_Part.test.ets';
import flexGrow_Default from './ColumnTest/flexGrow/flexGrow_Default.test.ets';
import flexShrink_Part from './ColumnTest/flexShrink/flexShrink_Part.test.ets';
import flexBasis_Type from './ColumnTest/flexBasis/flexBasis_Type.test.ets';
import flexBasis_Default from './ColumnTest/flexBasis/flexBasis_Default.test.ets';
import columnNesting_Space from './ColumnTest/columnNesting/columnNesting_Space.test.ets';
import columnNesting_alignItems from './ColumnTest/columnNesting/columnNesting_alignItems.test.ets';
import columnNesting_justifyContent from './ColumnTest/columnNesting/columnNesting_justifyContent.test.ets';
import column_WidthHeight_ChangeParent from './ColumnTest/ParentComponentChanged/Column_WidthHeight_ChangeParent.test.ets';
import column_Padding_ChangeParent from './ColumnTest/ParentComponentChanged/Column_Padding_ChangeParent.test.ets';
import column_Margin_ChangeParent from './ColumnTest/ParentComponentChanged/Column_Margin_ChangeParent.test.ets';
import column_MarPad_ChangeParent from './ColumnTest/ParentComponentChanged/Column_MarPad_ChangeParent.test.ets';
import column_AlignItems_ChangeParent from './ColumnTest/ParentComponentChanged/Column_AlignItems_ChangeParent.test.ets';
import column_JustifyContent_ChangeParent from './ColumnTest/ParentComponentChanged/Column_JustifyContent_ChangeParent.test.ets';
import ColumnWidthHeight_SubChange from './ColumnTest/subComponentChanged/ColumnWidthHeight_SubChange.test.ets';
import ColumnSetPadding_SubChange from './ColumnTest/subComponentChanged/ColumnSetPadding_SubChange.test.ets';
import ColumnSetPadding_SubChangeMar from './ColumnTest/subComponentChanged/ColumnSetPadding_SubChangeMar.test.ets';
import ColumnSetPadding_SubChangePad from './ColumnTest/subComponentChanged/ColumnSetPadding_SubChangePad.test.ets';
import ColumnSetMargin_SubChange from './ColumnTest/subComponentChanged/ColumnSetMargin_SubChange.test.ets';
import ColumnSetMargin_SubChangeMar from './ColumnTest/subComponentChanged/ColumnSetMargin_SubChangeMar.test.ets';
import ColumnSetMargin_SubChangePad from './ColumnTest/subComponentChanged/ColumnSetMargin_SubChangePad.test.ets';
import ColumnSetPaddingMargin_SubChange from './ColumnTest/subComponentChanged/ColumnSetPaddingMargin_SubChange.test.ets';
import ColumnSetPaddingMargin_SubChangeMar from './ColumnTest/subComponentChanged/ColumnSetPaddingMargin_SubChangeMar.test.ets';
import ColumnSetPaddingMargin_SubChangePad from './ColumnTest/subComponentChanged/ColumnSetPaddingMargin_SubChangePad.test.ets';
import ColumnSetPosition_SubChange from './ColumnTest/subComponentChanged/ColumnSetPosition_SubChange.test.ets';
import ColumnSetOffset_SubChange from './ColumnTest/subComponentChanged/ColumnSetOffset_SubChange.test.ets';
import ColumnSetDisplayPriority_SubChange from './ColumnTest/subComponentChanged/ColumnSetDisplayPriority_SubChange.test.ets';
import ColumnSetLayoutWeight_SubChange from './ColumnTest/subComponentChanged/ColumnSetLayoutWeight_SubChange.test.ets';
import ColumnSetLayoutWeightNone_SubChange from './ColumnTest/subComponentChanged/ColumnSetLayoutWeightNone_SubChange.test.ets';
import ColumnSetFlexShink_SubChange from './ColumnTest/subComponentChanged/ColumnSetFlexShink_SubChange.test.ets';
import ColumnSetFlexShinkNone_SubChange from './ColumnTest/subComponentChanged/ColumnSetFlexShinkNone_SubChange.test.ets';
import ColumnSetVisibility_SubChange from './ColumnTest/subComponentChanged/ColumnSetVisibility_SubChange.test.ets';
import stackAlignChange from './Stack/Stack_change/stackAlignChange.test.ets';
import stackSizeChange from './Stack/Stack_change/stackSizeChange.test.ets';
import stackNoneSettingWidthHeight from './Stack/Stack_change/stackNoneSettingWidthHeight.test.ets';
import stackPaddingChange from './Stack/Stack_change/stackPaddingChange.test.ets';
import stackMarginChange from './Stack/Stack_change/stackMarginChange.test.ets';
import Stack_AlignContent from './Stack/Stack_alignContent/stack_alignContent.test';
import Stack_Offset_Change from './Stack/StackItem_change/stack_offset_change.test';
import Stack_Position_Change from './Stack/StackItem_change/stack_position_change.test';
import Stack_ZIndex from './Stack/StackItem_change/stack_zIndex.test';
import StackJsunit from './Stack/StackJsunit.test';
import StackAlignContentTest from './Stack/StackAlignContentTest.test.ets';


export default function testsuite() {
  Stack_Text()
  inspectorJsunit()
  Column_Space()
  Column_Space_String()
  Column_Space_Default()
  layoutWeight_Part()
  layoutWeight_All()
  layoutWeight_Default()
  layoutWeight_flexGrow()
  layoutWeight_flexShrink()
  flexGrow_Part()
  flexGrow_Default()
  flexShrink_Part()
  flexBasis_Type()
  flexBasis_Default()
  columnNesting_Space()
  columnNesting_alignItems()
  columnNesting_justifyContent()
  column_WidthHeight_ChangeParent()
  column_Padding_ChangeParent()
  column_Margin_ChangeParent()
  column_MarPad_ChangeParent()
  column_AlignItems_ChangeParent()
  column_JustifyContent_ChangeParent()
  ColumnWidthHeight_SubChange()
  ColumnSetPadding_SubChange()
  ColumnSetPadding_SubChangeMar()
  ColumnSetPadding_SubChangePad()
  ColumnSetMargin_SubChange()
  ColumnSetMargin_SubChangeMar()
  ColumnSetMargin_SubChangePad()
  ColumnSetPaddingMargin_SubChange()
  ColumnSetPaddingMargin_SubChangeMar()
  ColumnSetPaddingMargin_SubChangePad()
  ColumnSetPosition_SubChange()
  ColumnSetOffset_SubChange()
  ColumnSetDisplayPriority_SubChange()
  ColumnSetLayoutWeight_SubChange()
  ColumnSetLayoutWeightNone_SubChange()
  ColumnSetFlexShink_SubChange()
  ColumnSetFlexShinkNone_SubChange()
  ColumnSetVisibility_SubChange()
  stackAlignChange();
  stackSizeChange();
  stackNoneSettingWidthHeight();
  stackPaddingChange();
  stackMarginChange();
  Stack_AlignContent();
  Stack_Offset_Change();
  Stack_Position_Change();
  Stack_ZIndex();
  StackJsunit()
  StackAlignContentTest();
}