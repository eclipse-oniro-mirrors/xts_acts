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

import marqueeJsunit from './MarqueeJsunit.test';
import swiperJsunit from './SwiperJsunit.test';
import buttonJsunit from './ButtonJsunit.test';
import tabsFirstJsunit from './TabsFirstJsunit.test';
import columnJsunit from './ColumnJsunit.test';
import rowJsunit from './RowJsunit.test';
import imageSpanJsunit from './ImageSpanJsunit.test';
import textJsunit from './TextJsunit.test';
import navigationJsunit from './NavigationJsunit.test';
import navigatorJsunit from './NavigatorJsunit.test';
import timepickerJsunit from './TimePickerJsunit.test';
import textpickerJsunit from './TextPickerJsunit.test';
import sliderJsunit from './SliderJsunit.test';
import ratingJsunit from './RatingJsunit.test';
import alphabetIndexerJsunit from './AlphabetIndexerJsunit.test';
import formComponentJsunit from './FormComponentJsunit.test';
import panelJsunit from './PanelJsunit.test';
import menuItemJsunit from './MenuItemJsunit.test';
import checkboxJsunit from './CheckboxJsunit.test';
import loadingProgressJsunit from './LoadingProgress.test';
import checkBoxGroupJsunit from './CheckBoxGroup.test';
import datePickerJsunit from './DatePicker.test';
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
import navRouterJsunit from './NavRouterJsunit.test';
import navDestinationJsunit from './NavDestination.test';
import sharedTransitionJsunit from './SharedTransitionJsunit.test';
import transitionJsunit from './TransitionJsunit.test';
import geometryTransitionJsunit from './GeometryTransitionJsunit.test';
import motionPathJsunit from './MotionPathJsunit.test';
import shortcutKeyJsunit from './ShortcutKey.test';
import common1Jsunit from './Common1.test';
import polygonJsunit from './Polygon.test';
import common9Jsunit from './Common9Jsunit.test';
import blankJsunit from './Blank.test';
import dividerJsunit from './Divider.test';
import gridColJsunit from './GridCol.test';
import gridRowJsunit from './GridRow.test';
import imageJsunit from './Image.test';
import imageAnimatorJsunit from './ImageAnimator.test';
import patternLockJsunit from './PatternLock.test';
import videoJsunit from './Video.test';
import scrollNestedScrollJsunit from './ScrollNestedScroll.test';
import stackJsunit from './StackJsunit.test';
import richEditorJsunit from './RichEditorJsunit.test';
import searchJsunit from './SearchJsunit.test';
import spanJsunit from './SpanJsunit.test';
import textAreaJsunit from './TextAreaJsunit.test';
import textInputJsunit from './TextInput.test';
import gridNestedScrollJsunit from './GridNestedScroll.test';
import listNestedScrollJsunit from './ListNestedScroll.test';

export default function testsuite() {
  common9Jsunit();
  common1Jsunit();
  shortcutKeyJsunit();
  geometryTransitionJsunit();
  motionPathJsunit();
  sharedTransitionJsunit();
  transitionJsunit();
  columnJsunit();
  rowJsunit();
  blankJsunit();
  dividerJsunit();
  gridColJsunit();
  gridRowJsunit();
  navDestinationJsunit();
  navigationJsunit()
  navigatorJsunit();
  navRouterJsunit();
  stackJsunit();
  tabsFirstJsunit();
  gridJsunit();
  gridNestedScrollJsunit();
  gridItemJsunit();
  listJsunit();
  listNestedScrollJsunit();
  listItemJsunit();
  listItemGroupJsunit();
  scrollNestedScrollJsunit();
  scrollJsunit();
  swiperJsunit();
  buttonJsunit();
  checkboxJsunit();
  checkBoxGroupJsunit();
  counterJsunit();
  datePickerJsunit();
  radioJsunit();
  ratingJsunit();
  sliderJsunit();
  textpickerJsunit();
  timepickerJsunit();
  toggleJsunit();
  imageSpanJsunit();
  patternLockJsunit();
  richEditorJsunit();
  searchJsunit();
  spanJsunit();
  textJsunit();
  textAreaJsunit();
  textInputJsunit();
  imageJsunit();
  imageAnimatorJsunit();
  videoJsunit();
  dataPanelJsunit();
  gaugeJsunit();
  loadingProgressJsunit();
  marqueeJsunit();
  progressJsunit();
  qrCodeJsunitJsunit();
  textClockJsunit();
  textTimerJsunit();
  lineJsunit();
  pathJsunit();
  polygonJsunit();
  polyLineJsunit();
  rectJsunit();
  shapeJsunit();
  alphabetIndexerJsunit();
  formComponentJsunit();
  hyperLinkJsunit();
  menuItemJsunit();
  menuJsunit();
  panelJsunit();
}