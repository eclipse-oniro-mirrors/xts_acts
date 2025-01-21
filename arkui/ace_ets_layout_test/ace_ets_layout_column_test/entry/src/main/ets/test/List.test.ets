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


 import Column_Space from './Column/spaceChanged/Column_Space.test.ets';
 import Column_Space_String from './Column/spaceChanged/Column_Space_String.test.ets';
 import Column_Space_Default from './Column/spaceChanged/Column_Space_Default.test.ets';
 import layoutWeight_Part from './Column/layoutWeight/layoutWeight_Part.test';
 import layoutWeight_All from './Column/layoutWeight/layoutWeight_All.test';
 import layoutWeight_Default from './Column/layoutWeight/layoutWeight_Default.test.ets';
 import layoutWeight_flexGrow from './Column/layoutWeight/layoutWeight_flexGrow.test.ets';
 import layoutWeight_flexShrink from './Column/layoutWeight/layoutWeight_flexShrink.test.ets';
 import flexGrow_Part from './Column/flexGrow/flexGrow_Part.test.ets';
 import flexGrow_Default from './Column/flexGrow/flexGrow_Default.test.ets';
 import flexShrink_Part from './Column/flexShrink/flexShrink_Part.test.ets';
 import flexBasis_Type from './Column/flexBasis/flexBasis_Type.test.ets';
 import flexBasis_Default from './Column/flexBasis/flexBasis_Default.test.ets';
 import columnNesting_Space from './Column/columnNesting/columnNesting_Space.test.ets';
 import columnNesting_alignItems from './Column/columnNesting/columnNesting_alignItems.test.ets';
 import columnNesting_justifyContent from './Column/columnNesting/columnNesting_justifyContent.test.ets';
import column_WidthHeight_ChangeParent from './Column/ParentComponentChanged/Column_WidthHeight_ChangeParent.test.ets';
import column_Padding_ChangeParent from './Column/ParentComponentChanged/Column_Padding_ChangeParent.test.ets';
import column_Margin_ChangeParent from './Column/ParentComponentChanged/Column_Margin_ChangeParent.test.ets';
import column_MarPad_ChangeParent from './Column/ParentComponentChanged/Column_MarPad_ChangeParent.test.ets';
import column_AlignItems_ChangeParent from './Column/ParentComponentChanged/Column_AlignItems_ChangeParent.test.ets';
import column_JustifyContent_ChangeParent from './Column/ParentComponentChanged/Column_JustifyContent_ChangeParent.test.ets';
import ColumnWidthHeight_SubChange from './Column/subComponentChanged/ColumnWidthHeight_SubChange.test.ets';
import ColumnSetPadding_SubChange from './Column/subComponentChanged/ColumnSetPadding_SubChange.test.ets';
import ColumnSetPadding_SubChangeMar from './Column/subComponentChanged/ColumnSetPadding_SubChangeMar.test.ets';
import ColumnSetPadding_SubChangePad from './Column/subComponentChanged/ColumnSetPadding_SubChangePad.test.ets';
import ColumnSetMargin_SubChange from './Column/subComponentChanged/ColumnSetMargin_SubChange.test.ets';
import ColumnSetMargin_SubChangeMar from './Column/subComponentChanged/ColumnSetMargin_SubChangeMar.test.ets';
import ColumnSetMargin_SubChangePad from './Column/subComponentChanged/ColumnSetMargin_SubChangePad.test.ets';
import ColumnSetPaddingMargin_SubChange from './Column/subComponentChanged/ColumnSetPaddingMargin_SubChange.test.ets';
import ColumnSetPaddingMargin_SubChangeMar from './Column/subComponentChanged/ColumnSetPaddingMargin_SubChangeMar.test.ets';
import ColumnSetPaddingMargin_SubChangePad from './Column/subComponentChanged/ColumnSetPaddingMargin_SubChangePad.test.ets';
import ColumnSetPosition_SubChange from './Column/subComponentChanged/ColumnSetPosition_SubChange.test.ets';
import ColumnSetOffset_SubChange from './Column/subComponentChanged/ColumnSetOffset_SubChange.test.ets';
import ColumnSetDisplayPriority_SubChange from './Column/subComponentChanged/ColumnSetDisplayPriority_SubChange.test.ets';
import ColumnSetLayoutWeight_SubChange from './Column/subComponentChanged/ColumnSetLayoutWeight_SubChange.test.ets';
import ColumnSetLayoutWeightNone_SubChange from './Column/subComponentChanged/ColumnSetLayoutWeightNone_SubChange.test.ets';
import ColumnSetFlexShink_SubChange from './Column/subComponentChanged/ColumnSetFlexShink_SubChange.test.ets';
import ColumnSetFlexShinkNone_SubChange from './Column/subComponentChanged/ColumnSetFlexShinkNone_SubChange.test.ets';
import ColumnSetVisibility_SubChange from './Column/subComponentChanged/ColumnSetVisibility_SubChange.test.ets';

export default function testsuite() {

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
}