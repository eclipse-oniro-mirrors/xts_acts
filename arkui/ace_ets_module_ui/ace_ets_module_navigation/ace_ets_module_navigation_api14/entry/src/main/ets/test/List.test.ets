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

import NavigationEnableDragBar from './EnableDragBarTest/NavigationEnableDragBar.test'
import RouterRecoverable from './Navigation/RouterRecoverable.test'
import RouterRecoverable2 from './Navigation/RouterRecoverable2.test'
import SafeAreaPadding from './BarStyleTest/SafeAreaPadding.test'
import MultiNavigationTest from './MultiNavigation/MultiNavigationTest.test'
import NavigationBindToScrollable from './BindToScrollable/NavigationBindToScrollable.test'
import NavigationBindToNestedScrollable from './BindToScrollable/NavigationBindToNestedScrollable.test'
import Recoverable from './Navigation/Recoverable.test'

export default function testsuite() {
  NavigationEnableDragBar();
  RouterRecoverable();
  RouterRecoverable2();
  SafeAreaPadding();
  MultiNavigationTest();
  NavigationBindToScrollable();
  NavigationBindToNestedScrollable();
  Recoverable();
}