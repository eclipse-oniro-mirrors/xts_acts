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

import tabsBarPositionJsunit from './tabs.test.ets';
import TabsApi from './TabsTest/TabsApi.test';
import APITabsBarBackgroundBlurStyleJsunit from './TabsTest/APITabsBarBackgroundBlurStyleJsunit.test';
import tabsApi1 from './TabsTest/tabs/tabsApi1.test';
import tabs from './TabsTest/Tabs'
import tabsSec from './TabsTest/TabsSec'
import tabsThird from './TabsTest/TabsThird'
import Tabs_itemPadMar from './TabsTest/Tabs_ItemsChange/Tabs_itemPadMar.test';
import Tabs_itemSize from './TabsTest/Tabs_ItemsChange/Tabs_itemSize.test';
import tabs_IndexTest from './TabsTest/tabs_index/Tabs_index.test';
import tabs_PadMarTest from './TabsTest/Tabs_ParmsChange/Tabs_PadMar.test';
import tabs_WidHeiTest from './TabsTest/Tabs_ParmsChange/Tabs_WidHei.test';
import Tabs_barMode from './TabsTest/Tabs_ParmsChange/Tabs_barMode.test';
import Tabs_barPosition from './TabsTest/Tabs_ParmsChange/Tabs_barPosition.test';
import Tabs_barWidHei from './TabsTest/Tabs_ParmsChange/Tabs_barWidHei.test';
import Tabs_scrollable from './TabsTest/Tabs_ParmsChange/Tabs_scrollable.test';
import tabJsunit from './TabsTest/TabJsunit.test';
import tabsOnContentWillChangeJsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChange.test'
import tabsOnContentWillChangeIndex3JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex3.test';
import tabsOnContentWillChangeIndex03JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex03.test';
import tabsOnContentWillChangeIndex04JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex04.test';
import tabsOnContentWillChangeIndex05JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex05.test';
import tabsOnContentWillChangeIndex06JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex06.test';
import tabsOnContentWillChangeIndex07JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex07.test';
import tabsOnContentWillChangeIndex08JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex08.test';
import tabsOnContentWillChangeIndex09JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex09.test';
import tabsOnContentWillChangeIndex12JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex12.test';
import tabsOnContentWillChangeIndex13JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex13.test';
import tabsOnContentWillChangeIndex14JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex14.test';
import tabsOnContentWillChangeIndex15JsunitTest from './TabsTest/tabs_api12/tabsOnContentWillChangeIndex15.test';
import tabsJsunit from './TabsTest/Tabs3Jsunit.test.ets';
import tabsBarPositionJsunit1 from './TabsTest/tabs.test';

import tabIconJsunit from './TabsTest/tabIconJsunit.test';
import preloadErrorTabs from './TabsTest/preloadErrorTabs.test'; 
import symbolTabs from './TabsTest/symbolTabs.test'; 
import TabsAp1 from './TabsTest/TabsAp1.test';
import tabsAnimationMode from './TabsTest/tabsAnimationMode.test';
import tabsAnimationDuration from './TabsTest/tabsAnimationDuration.test';
import tabsOpacityJsunit from './TabsTest/tabsOpacityJsunit.test'; 
import bindTabsScroll from './TabsTest/bindTabsScroll.test';

import tabBarModifier from './TabsTest/tabBarModifier.test'; 
import tabsModeTest from './TabsTest/tabsModeTest.test';
import tabsPageMode from './TabsTest/tabsPageMode.test'; 

import TabBarComponentContent from './TabsTest/TabBarComponentContent.test';
import TabsOnSelected from './TabsTest/TabsOnSelected.test';

import iconTabs from './TabsTest/iconTabs.test';
import onSelectedTabs from './TabsTest/onSelectedTabs.test'; 
import barBackground from './TabsTest/barBackground.test';

import barHeightNoMinHeightLimit from './TabsTest/barHeightNoMinHeightLimit.test';
import curvesTabs from './TabsTest/curvesTabs.test';
import animationCurve from './TabsTest/animationCurve.test';
import tabsDemo from './textTest/TextApi/tabsDemo.test';

import tabs_onContentDidScrollTest from './TabsTest/Tabs_onContentDidScroll/tabs_onContentDidScroll.test';
import tabs_undefinedTest from './TabsTest/Tabs_onContentDidScroll/tabs_undefined.test';
import DrawableTabBarIndicatorPage from './TabContent/DrawableTabBarIndicatorPage.test';
import withIdTest from './TabsTest/observer/withId.test';
import withoutIdTest from './TabsTest/observer/withoutId.test';

export default function testsuite() {
  tabsBarPositionJsunit();
  TabsApi();
  APITabsBarBackgroundBlurStyleJsunit();
  tabsApi1();
  tabs();
  tabsSec();
  tabsThird();
  Tabs_itemPadMar();
  Tabs_itemSize();
  tabs_IndexTest();
  tabs_PadMarTest();
  tabs_WidHeiTest();
  Tabs_barMode();
  Tabs_barPosition();
  Tabs_barWidHei();
  Tabs_scrollable();
  tabJsunit();
  tabsOnContentWillChangeJsunitTest();
  tabsOnContentWillChangeIndex3JsunitTest();
  tabsOnContentWillChangeIndex03JsunitTest();
  tabsOnContentWillChangeIndex04JsunitTest();
  tabsOnContentWillChangeIndex05JsunitTest();
  tabsOnContentWillChangeIndex06JsunitTest();
  tabsOnContentWillChangeIndex07JsunitTest();
  tabsOnContentWillChangeIndex08JsunitTest();
  tabsOnContentWillChangeIndex09JsunitTest();
  tabsOnContentWillChangeIndex12JsunitTest();
  tabsOnContentWillChangeIndex13JsunitTest();
  tabsOnContentWillChangeIndex14JsunitTest();
  tabsOnContentWillChangeIndex15JsunitTest();
  tabsJsunit();
  tabIconJsunit();
  preloadErrorTabs();
  symbolTabs();
  TabsAp1();
  tabsAnimationMode();
  tabsAnimationDuration();
  tabsOpacityJsunit();
  bindTabsScroll();
  tabBarModifier();
  tabsModeTest();
  tabsPageMode();
  TabBarComponentContent();
  TabsOnSelected();
  iconTabs();
  onSelectedTabs();
  barBackground();
  barHeightNoMinHeightLimit();
  curvesTabs();
  animationCurve();
  tabsBarPositionJsunit1();
  tabsDemo();
  tabs_onContentDidScrollTest();
  tabs_undefinedTest();
  DrawableTabBarIndicatorPage();
  withoutIdTest();
  withIdTest();
  } 