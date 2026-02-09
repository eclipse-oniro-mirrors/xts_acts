'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import FlexLayoutPolicyTest from './Flex/FlexLayoutPolicyTest.test';
import FlexMatchParentTest from './Flex/FlexMatchParentTest.test';
import GridRowNoColumnsTest from './GridRow/GridRowNoColumnsTest.test';
import LayoutInspectorTest from './inspector/layoutInspector.test';
import ColumnMatchParentTest from './Column/ColumnMatchParentTest';
import RowMatchParentTest from './Row/RowMatchParentTest';
import StackChildAlignmentTest from './Stack/StackChildAlignmentTest';
import StackMatchParentTest from './Stack/StackMatchParentTest';
import StackSafeAreaTest from './Stack/StackSafeAreaTest';
import ButtonAlignTest from './BoxAlign/ButtonAlignTest';

export default function testsuite() {
  FlexLayoutPolicyTest();
  GridRowNoColumnsTest();
  LayoutInspectorTest();
  ColumnMatchParentTest();
  FlexMatchParentTest();
  RowMatchParentTest();
  StackChildAlignmentTest();
  StackMatchParentTest();
  StackSafeAreaTest();
  ButtonAlignTest();
}
