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

import headerListJsunit from './ListTest/headerListJsunit.test'; 
import tabsOpacityJsunit from './TabsTest/tabsOpacityJsunit.test'; 
import bindTabsScroll from './TabsTest/bindTabsScroll.test';
import listItemGroupComponent from './ListTest/listItemGroupComponent.test'; 
import offsetRemainScroll from './ScrollTest/offsetRemainScroll.test'; 

export default function testsuite() {
  headerListJsunit()
  tabsOpacityJsunit()
  bindTabsScroll()
  listItemGroupComponent()
  offsetRemainScroll()
}