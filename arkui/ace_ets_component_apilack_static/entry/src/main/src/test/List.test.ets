'use static';
/*
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

import alphabetIndexerOnSelectJsunit from './AlphabetIndexer.test';
import checkBoxGroupSelectAllJsunit from './CheckBoxGroup.test';
import circleNewJsunit from './Circle.test';
import curvesStepsJsunit from './Curves.test';
import commonBackgroundBlurStyleJsunit from './Common.test';
import common_ts_ets_apiStaticClearJsunit from './CommonTsEtsApi.test';
import ellipseNeJsunit from './Ellipse.test';
import featureAbilityStartAbilityJsunit from './FeatureAbility.test';
import focusControlJsunit from './FocusControlJsunit.test.ets'
import gestureSetDirectionJsunit from './Gesture.test';
import globalJsunit from './Global.test';
import gridMaxCountJsunit from './Grid.test';
import gridItemOnSelectJsunit from './GridItem.test';
import grid_colSpanJsunit from './GridCol.test';
import grid_rowOnBreakpointChangeJsunit from './GridRow.test';
import inspectorJsunit from './Inspector.test'
import lazyForEachOnDataAddJsunit from './LazyForEach.test';
import lineNeJsunit from './Line.test';
import listNewJsunit from './ListTest.test';
import list_itemOnSelectJsunit from './ListItem.test';
import mediaQueryOffJsunit from './MediaQuery.test';
import navigatorTargetJsunit from './Navigator.test'
import pageRouteTest from './PageRoute.test'
import panelBackgroundMaskJsunit from './Panel.test';
import pathNewTest from './Path.test';
import polygonNewJsunit from './Polygon.test';
import polyLineNeJsunit from './PolyLine.test';
import promptShowDialogJsunit from './Prompt.test';
import rectNeJsunit from './Rect.test';
import scrollOnScrollBeginJsunit from './Scroll.test';
import searchOnCutJsunit from './Search.test'
import stackAlignContentJsunit from './Stack.test';
import swiperCurveJsunit from './Swiper.test';
import tabsBarPositionJsunit from './Tabs.test';
import textMinFontSizeJsunit from './Text.test';
import textAreaOnCutJsunit from './TextArea.test';
import textInputOnEditChangeJsunit from './TextInput.test';
import videoOnFullscreenChangeJsunit from './Video.test';
import webGetTitleJsunit from './Web.test';
import xcomponentGetXComponentContextJsunit from './XComponent1.test';

export default function testsuite() {
  lazyForEachOnDataAddJsunit()
  alphabetIndexerOnSelectJsunit()
  checkBoxGroupSelectAllJsunit()
  circleNewJsunit()
  curvesStepsJsunit()
  common_ts_ets_apiStaticClearJsunit()
  commonBackgroundBlurStyleJsunit()
  ellipseNeJsunit()
  featureAbilityStartAbilityJsunit()
  gestureSetDirectionJsunit()
  globalJsunit()
  gridMaxCountJsunit()
  gridItemOnSelectJsunit()
  inspectorJsunit()
  lineNeJsunit()
  listNewJsunit()
  list_itemOnSelectJsunit()
  mediaQueryOffJsunit()
  navigatorTargetJsunit()
  pageRouteTest()
  panelBackgroundMaskJsunit()
  pathNewTest()
  polygonNewJsunit()
  polyLineNeJsunit()
  promptShowDialogJsunit()
  rectNeJsunit()
  scrollOnScrollBeginJsunit()
  searchOnCutJsunit()
  stackAlignContentJsunit()
  swiperCurveJsunit()
  tabsBarPositionJsunit()
  textMinFontSizeJsunit()
  textAreaOnCutJsunit()
  textInputOnEditChangeJsunit()
  videoOnFullscreenChangeJsunit()
  xcomponentGetXComponentContextJsunit()
}