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
import waterFlow_WaterFlowFrictionTest from './WaterFlowTest/WaterFlow_attribute/WaterFlow_WaterFlowFriction.test';
import ScrollToIndexForWaterFlowJsunit01 from './ScrollTest/ScrollToIndex/ScrollToIndexForWaterFlowJsunit01.test';
import ScrollToIndexForWaterFlowJsunit02 from './ScrollTest/ScrollToIndex/ScrollToIndexForWaterFlowJsunit02.test';
import ApiCommponentAdd02Jsunit from './ScrollTest/ApiCommponentAdd02Jsunit.test.ets';
import tabsOnContentWillChangeIndex10JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex10.test'
import tabsOnContentWillChangeIndex11JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex11.test'
import sidebarTypeTest from './SideBarContainerTest/sidebarType.test';
import sideBarShowSideBarJsunit from './SideBarContainerTest/sideBar.test';

export default function testsuite() {
  waterFlow_WaterFlowFrictionTest()
  ScrollToIndexForWaterFlowJsunit01();
  ScrollToIndexForWaterFlowJsunit02();
  ApiCommponentAdd02Jsunit();
  tabsOnContentWillChangeIndex10JsunitTest()
  tabsOnContentWillChangeIndex11JsunitTest()
  sidebarTypeTest();
  sideBarShowSideBarJsunit()
}