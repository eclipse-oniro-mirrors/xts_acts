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
import FlexMatchParentTest from './Flex/FlexMatchParentTest.test.ets'
import GridRowNoColumnsTest from './GridRow/GridRowNoColumnsTest.test.ets'
import LayoutInspectorTest from './inspector/layoutInspector.test.ets'
import ColumnFixAtIdealSizeTest from './Column/ColumnFixAtIdealSizeTest.ets'
import RowFixAtIdealSizeTest from './Row/RowFixAtIdealSizeTest.ets'
import StackFixAtIdealSizeTest from './Stack/StackFixAtIdealSizeTest.ets'
import FlexFixAtIdealSizeTest from './Flex/FlexFixAtIdealSizeTest.ets'
import GridRowFixAtIdealSizeTest from './GridRow/GridRowFixAtIdealSizeTest.ets'
import GridColFixAtIdealSizeTest from './GridCol/GridColFixAtIdealSizeTest.ets'
import ColumnMatchParentTest from './Column/ColumnMatchParentTest.ets'
import ColumnWrapContentTest from './Column/ColumnWrapContentTest.ets'
import FlexWrapContentTest from './Flex/FlexWrapContentTest.ets'
import RowMatchParentTest from './Row/RowMatchParentTest.ets'
import RowWrapContentTest from './Row/RowWrapContentTest.ets'

import StackMatchParentTest from './Stack/StackMatchParentTest.ets'
import StackWrapContentTest from './Stack/StackWrapContentTest.ets'

import ButtonAlignTest from './BoxAlign/ButtonAlignTest.ets'
import StackSafeAreaTest from './Stack/StackSafeAreaTest.ets'
import StackChildAlignmentTest from './Stack/StackChildAlignmentTest.ets'

import StackBackgroundTest from './Stack/StackBackgroundTest.ets'

export default function testsuite() {
  FlexMatchParentTest();
  GridRowNoColumnsTest();

  ColumnMatchParentTest();
  ColumnWrapContentTest();
  FlexWrapContentTest();
  RowMatchParentTest();
  RowWrapContentTest();
 
  StackMatchParentTest();
  StackWrapContentTest();
  LayoutInspectorTest();

  ColumnFixAtIdealSizeTest();
  RowFixAtIdealSizeTest();
  StackFixAtIdealSizeTest();
  FlexFixAtIdealSizeTest();
  GridRowFixAtIdealSizeTest();
  GridColFixAtIdealSizeTest();

  ButtonAlignTest();
  StackSafeAreaTest();
  StackChildAlignmentTest();

  StackBackgroundTest();

}