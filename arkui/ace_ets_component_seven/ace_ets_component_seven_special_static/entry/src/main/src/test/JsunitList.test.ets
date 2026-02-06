'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import marqueeJsunit from './MarqueeJsunit.test';
import swiperJsunit from './SwiperJsunit.test';
import buttonJsunit from './ButtonJsunit.test';
import textStyleJsunit from './TextStyleJsunit.test';
import tabsFirstJsunit from './TabsFirstJsunit.test';
import tabsSecondJsunit from './TabsSecondJsunit.test';
import tabsThirdJsunit from './TabsThirdJsunit.test';
import navigationJsunit from './NavigationJsunit.test';
import sliderJsunit from './SliderJsunit.test';
import ratingJsunit from './RatingJsunit.test';
import alphabetIndexerJsunit from './AlphabetIndexerJsunit.test';
import formComponentJsunit from './FormComponentJsunit.test';
import menuItemJsunit from './MenuItemJsunit.test';
import checkboxJsunit from './CheckboxJsunit.test';
import loadingProgressJsunit from './LoadingProgress.test';
import checkBoxGroupJsunit from './CheckBoxGroup.test';
import radioJsunit from './Radio.test';
import hyperLinkJsunit from './HyperLink.test';
import menuJsunit from './Menu.test';
import pathJsunit from './Path.test';
import shapeJsunit from './Shape.test';
import lineJsunit from './Line.test';
import dataPanelJsunit from './DataPanelJsunit.test';
import gaugeJsunit from './GaugeJsunit.test';
import progressJsunit from './Progress.test';
import textTimerJsunit from './TextTimer.test';
import textClockJsunit from './TextClockJsunit.test';
import scrollJsunit from './Scroll.test';
import qrCodeJsunitJsunit from './QrCodeJsunit.test';
import listJsunit from './List.test';
import listItemJsunit from './ListItem.test';
import listItemGroupJsunit from './ListItemGroup.test';
import gridJsunit from './Grid.test';
import gridItemJsunit from './GridItem.test';
import toggleJsunit from './ToggleJsunit.test';
import rectJsunit from './RectJsunit.test';
import polyLineJsunit from './PolyLine.test';
import counterJsunit from './Counter.test';
import navRouterJsunit from './NavDestination.test';
import navDestinationJsunit from './NavDestination.test';
import sharedTransitionJsunit from './SharedTransitionJsunit.test';
import transitionJsunit from './TransitionJsunit.test';
import geometryTransitionJsunit from './GeometryTransitionJsunit.test';
import motionPathJsunit from './MotionPathJsunit.test';
import shortcutKeyJsunit from './ShortcutKey.test';
import idKeyJsunit from './IdKeyJsunit.test';

export default function testsuite() {
  idKeyJsunit();
  shortcutKeyJsunit();
  sharedTransitionJsunit();
  transitionJsunit();
  geometryTransitionJsunit();
  motionPathJsunit();
  textStyleJsunit();
  tabsFirstJsunit();
  tabsSecondJsunit();
  tabsThirdJsunit();
  navigationJsunit();
  buttonJsunit();
  sliderJsunit();
  ratingJsunit();
  radioJsunit();
  checkboxJsunit();
  menuItemJsunit();
  menuJsunit();
  hyperLinkJsunit();
  alphabetIndexerJsunit();
  listItemGroupJsunit();
  listItemJsunit();
  listJsunit();
  gridItemJsunit();
  gridJsunit();
  swiperJsunit();
  scrollJsunit();
  textTimerJsunit();
  textClockJsunit();
  qrCodeJsunitJsunit();
  progressJsunit();
  marqueeJsunit();
  loadingProgressJsunit();
  gaugeJsunit();
  dataPanelJsunit();
  shapeJsunit();
  pathJsunit();
  lineJsunit();
  checkBoxGroupJsunit();
  formComponentJsunit();
  toggleJsunit();
  rectJsunit();
  polyLineJsunit();
  navDestinationJsunit();
  counterJsunit();
}