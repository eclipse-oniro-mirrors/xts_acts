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


import chipDirectionTest from './chip/chipDirection.test';
import ChipAction from './chip/ChipAction.test';
import ChipOnClose from './chip/ChipOnClose.test';
import ChipAction2 from './chip/ChipAction2.test';
import ChipOnClose2 from './chip/ChipOnClose2.test';
import ChipOnClick from './chip/ChipOnClick.test.ets'
import ChipTest0010 from './chip/ChipTest0010.test'; 
import accessibilitySelectedTypeTest from './chip/accessibilitySelectedTypeTest.test';
import ChipApi1 from './chip/ChipApi1.test'
import ChipGroupApi1 from './ChipGroupTest/ChipGroupApi1.test'
import ChipCloseOptions from './chip/ChipCloseOptions.test'
import ChipFontScale from './chip/ChipFontScale.test'
import ChipFontSize from './chip/ChipFontSize.test'
import ChipPadding from './chip/ChipPadding.test'

import startSpaceTest from './ChipGroupTest/startSpaceTest.test'
import endSpaceTest from './ChipGroupTest/endSpaceTest.test'
import itemSpaceTest from './ChipGroupTest/itemSpaceTest.test'
import localizedLabelMarginTest from './chip/localizedLabelMarginTest';
import ChipGroupIconItemOptionsTest from './ChipGroupTest/ChipGroupIconItemOptionsTest.test';
import ChipGroupSymbolItemOptionsTest from './ChipGroupTest/ChipGroupSymbolItemOptionsTest.test';
export default function testsuite() {
  chipDirectionTest();
  ChipAction();
  ChipOnClose();
  ChipAction2();
  ChipOnClose2();
  ChipOnClick();
  ChipTest0010();
  accessibilitySelectedTypeTest();
  ChipApi1();
  startSpaceTest();
  endSpaceTest();
  itemSpaceTest();
  localizedLabelMarginTest();
  ChipGroupIconItemOptionsTest();
  ChipGroupSymbolItemOptionsTest();
  ChipPadding();
  ChipFontSize();
  ChipFontScale();
  ChipCloseOptions();
}