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
import stackAlignChange from './Stack/Stack_change/stackAlignChange.test.ets';
import stackSizeChange from './Stack/Stack_change/stackSizeChange.test.ets';
import stackNoneSettingWidthHeight from './Stack/Stack_change/stackNoneSettingWidthHeight.test.ets';
import stackPaddingChange from './Stack/Stack_change/stackPaddingChange.test.ets';
import stackMarginChange from './Stack/Stack_change/stackMarginChange.test.ets';
import Stack_AlignContent from './Stack/Stack_alignContent/stack_alignContent.test';
import Stack_Offset_Change from './Stack/StackItem_change/stack_offset_change.test';
import Stack_Position_Change from './Stack/StackItem_change/stack_position_change.test';
import Stack_ZIndex from './Stack/StackItem_change/stack_zIndex.test';

export default function testsuite() {
 
stackAlignChange()
stackSizeChange()
stackNoneSettingWidthHeight()
stackPaddingChange()
stackMarginChange()
  Stack_AlignContent();
  Stack_Offset_Change();
  Stack_Position_Change();
  Stack_ZIndex();

}