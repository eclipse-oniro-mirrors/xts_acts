/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import systemRouterJsunit from './SystemRouterJsunit.test';
import systemAppJsunit from './SystemAppJsunit.test';
import patternLockJsunit from './PatternLockJsunit.test';
import customDialogControllerJsunit from './CustomDialogControllerJsunit.test';
import ohosPromptJsunit from './OhosPromptJsunit.test';
import videoJsunit from './VideoJsunit.test';
import refreshJsunit from './RefreshJsunit.test';
import richTextJsunit from './RichTextJsunit.test';
import textPickerJsunit from './TextPickerJsunit.test';
import textTimerJsunit from './TextTimerJsunit.test';
import subscribedAbstractPropertyJsunit from './SubscribedAbstractPropertyJsunit.test';
import appStorageJsunit from './AppStorageJsunit.test';
import subscribaleAbstractJsunit from './SubscribaleAbstractJsunit.test';
import pathJsunit from './PathJsunit.test';
import enumsLineCapStyleJsunit from './EnmusLineCapStyleJsunit.test';
import enmusItemAlignJsunit from './EnmusItemAlignJsunit.test';
import playModeJsunit from './PlayModeJsunit.test';
import GestureModeJsunit from './GestureModeJsunit.test';
import PanDirectionJsunit from './PanDirectionJsunit.test';
import basicJsunit from './BasicJsunit.test';
import focusJsunit from './FocusJsunit.test';
import textAreaJsunit from './TextAreaJsunit.test';
import dragEventJsunit from './DragEventJsunit.test';
import calendarJsunit from './CalendarJsunit.test';
import geometryTransitionJsunit from './GeometryTransitionJsunit.test';
import textClockJsunit from './TextClockJsunit.test';
import textInputJsunit from './TextInputJsunit.test';
import polygonJsunit from './PolygonJsunit.test';
import polylineJsunit from './PolylineJsunit.test';
import imageJsunit from './ImageJsunit.test';

export default function testsuite() {
  textAreaJsunit();
  textInputJsunit();
  videoJsunit();
  enmusItemAlignJsunit();
  patternLockJsunit();
  dragEventJsunit();
  polygonJsunit();
  customDialogControllerJsunit();
  ohosPromptJsunit();
  richTextJsunit();
  refreshJsunit();
  imageJsunit();
  textPickerJsunit();
  textTimerJsunit();
  subscribedAbstractPropertyJsunit();
  textClockJsunit();
  appStorageJsunit();
  subscribaleAbstractJsunit();
  pathJsunit();
  enumsLineCapStyleJsunit();
  playModeJsunit();
  GestureModeJsunit();
  basicJsunit();
  focusJsunit();
  polylineJsunit();
  calendarJsunit();
  PanDirectionJsunit();
  geometryTransitionJsunit();
  systemRouterJsunit();
  systemAppJsunit();
}