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

import marqueeJsunit from './MarqueeJsunit.test.ets';
import swiperJsunit from './SwiperJsunit.test.ets';
import buttonJsunit from './ButtonJsunit.test.ets';
import textStyleJsunit from './TextStyleJsunit.test.ets';
import tabsFirstJsunit from './TabsFirstJsunit.test.ets';
import tabsSecondJsunit from './TabsSecondJsunit.test.ets';
import tabsThirdJsunit from './TabsThirdJsunit.test.ets';
import stepperItemJsunit from './StepperItem.test.ets';
import navigationJsunit from './NavigationJsunit.test.ets';
import navigatorJsunit from './NavigatorJsunit.test.ets';
import timepickerJsunit from './TimePickerJsunit.test.ets';
import textpickerJsunit from './TextPickerJsunit.test.ets';
import sliderJsunit from './SliderJsunit.test.ets';
import selectJsunit from './SelectJsunit.test.ets';
import ratingJsunit from './RatingJsunit.test.ets';
import alphabetIndexerJsunit from './AlphabetIndexerJsunit.test.ets';
import formComponentJsunit from './FormComponentJsunit.test.ets';
import panelJsunit from './PanelJsunit.test.ets';
import menuItemJsunit from './MenuItemJsunit.test.ets';
import checkboxJsunit from './CheckboxJsunit.test.ets';
import loadingProgressJsunit from './LoadingProgress.test.ets';
import checkBoxGroupJsunit from './CheckBoxGroup.test.ets';
import datePickerJsunit from './DatePicker.test.ets';
import radioJsunit from './Radio.test.ets';
import hyperLinkJsunit from './HyperLink.test.ets';
import menuJsunit from './Menu.test.ets';
import pathJsunit from './Path.test.ets';
import shapeJsunit from './Shape.test.ets';
import lineJsunit from './Line.test.ets';
import dataPanelJsunit from './DataPanelJsunit.test.ets';
import gaugeJsunit from './GaugeJsunit.test.ets';
import progressJsunit from './Progress.test.ets';
import textTimerJsunit from './TextTimer.test.ets';
import textClockJsunit from './TextClockJsunit.test.ets';
import scrollJsunit from './Scroll.test.ets';
import waterFlowViewJsunit from './WaterFlowView.test.ets';
import qrCodeJsunitJsunit from './QrCodeJsunit.test.ets';
import calendarPickerJsunit from './CalendarPicker.test.ets';
import listJsunit from './List.test.ets';
import listItemJsunit from './ListItem.test.ets';
import listItemGroupJsunit from './ListItemGroup.test.ets';
import gridJsunit from './Grid.test.ets';
import gridItemJsunit from './GridItem.test.ets';
import toggleJsunit from './ToggleJsunit.test.ets';
import rectJsunit from './RectJsunit.test.ets';
import polyLineJsunit from './PolyLine.test.ets';
import counterJsunit from './Counter.test.ets';
import navRouterJsunit from './NavDestination.test.ets';
import navDestinationJsunit from './NavRouterJsunit.test.ets';
import sharedTransitionJsunit from './SharedTransitionJsunit.test.ets';
import transitionJsunit from './TransitionJsunit.test.ets';
import geometryTransitionJsunit from './GeometryTransitionJsunit.test.ets';
import motionPathJsunit from './MotionPathJsunit.test.ets';
import shortcutKeyJsunit from './ShortcutKey.test.ets';
import idKeyJsunit from './IdKeyJsunit.test.ets';

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
  stepperItemJsunit();
  navigatorJsunit();
  navigationJsunit()
  buttonJsunit();
  calendarPickerJsunit();
  timepickerJsunit();
  datePickerJsunit();
  textpickerJsunit();
  sliderJsunit();
  selectJsunit();
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
  waterFlowViewJsunit();
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
  panelJsunit();
  toggleJsunit();
  rectJsunit();
  polyLineJsunit();
  navDestinationJsunit();
  navRouterJsunit();
  counterJsunit();
}