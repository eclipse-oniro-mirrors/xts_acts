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
import interceptSwiperTest from './SwiperTest/interceptSwiperTest.test';
import tabBarModifier from './TabsTest/tabBarModifier.test';
import getIndicator from './IndicatorComponent/getIndicator.test';
import swiperModeTest from './SwiperTest/swiperModeTest.test'
import tabsModeTest from './TabsTest/tabsModeTest.test'
import swiperPageMode from './SwiperTest/swiperPageMode.test';
import tabsPageMode from './TabsTest/tabsPageMode.test';
import getAttributeScroll from './ScrollTest/getAttributeScroll.test';
import showDotIndicator from './IndicatorComponent/showDotIndicator.test';
import SwiperChangeIndexTest from './SwiperTest/SwiperChangeIndex.test';

export default function testsuite() {
  interceptSwiperTest();
  tabBarModifier();
  getIndicator();
  swiperModeTest();
  tabsModeTest();
  swiperPageMode();
  tabsPageMode();
  // getAttributeScroll();
  showDotIndicator();
  SwiperChangeIndexTest();
}
