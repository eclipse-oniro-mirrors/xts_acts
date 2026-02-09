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
 
import iconTabs from './TabsTest/iconTabs.test';
import onSelectedTabs from './TabsTest/onSelectedTabs.test'; 
import preloadSwiper from './SwiperTest/preloadSwiper.test'; 
import selectedSwiper from './SwiperTest/selectedSwiper.test'; 
import SwiperIndicatorDistanceTest from './SwiperTest/SwiperIndicatorDistanceTest.test'
import barBackground from './TabsTest/barBackground.test';
import setGridEvent from './GridTest/setGridEvent.test'; 
import setListEvent from './ListTest/setListEvent.test'; 
import setScrollEvent from './ScrollTest/setScrollEvent.test';
import GetEventUn from './GetEventUn.test';
import listDividerOptions from './ListTest/listDividerOptions.test'; 
import stackFromEndList from './ListTest/stackFromEndList.test'; 
import LazyVGridLayout from './LazyVGridLayout/LazyVGridLayout.test';

export default function testsuite() {
  iconTabs()
  onSelectedTabs()
  preloadSwiper()
  selectedSwiper()
  SwiperIndicatorDistanceTest()
  barBackground()
  setGridEvent()
  setListEvent()
  setScrollEvent()
  GetEventUn()
  listDividerOptions()
  stackFromEndList()
  LazyVGridLayout()
}