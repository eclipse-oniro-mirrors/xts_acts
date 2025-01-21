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
import gridJsunit from './GridJsunit.test';
import canvasJsunit from './CanvasJsunit.test';
import textJsunit from './TextJsunit.test';
import badgeJsunit from './BadgeJsunit.test';
import longPressGestureJsUnit from './LongPressGesture.test';
import buttonJsunit from './ButtonJsunit.test';
import responseRegionJsunit from './ResponseRegionJsunit.test';
import panGestureJsunit from './PanGestureJsunit.test';
import tabsJsunit from './TabsJsunit.test';
import qrCodeJsunit from './QrCodeJsunit.test';
import tapGesture from './TapGesture.test';
import progressJsunit from './ProgressJsunit.test';
import animateJsunit from './AnimateJsunit.test';
import commonJsunit from './CommonJsunit.test';
import spanJsunit from './SpanJsunit.test';
import ratingJsunit from './RatingJsunit.test';
import canvas2Jsunit from './Canvas2Jsunit.test';
import toggleJsunit from './ToggleJsunit.test';
import shapeJsunit from './ShapeJsunit.test';
import motionPathJsunit from './MotionPathJsunit.test';
import scrollCodeJsunit from './ScrollCodeJsunit.test';
import transitionJsunit from './TransitionJsunit.test';
import priorityGestureJsunit from './PriorityGestureJsunit.test';
import parallelGestureJsunit from './ParallelGestureJsunit.test';
import blankJsunit from './BlankJsunit.test';
import sharedTransitionJsunit from './SharedTransitionJsunit.test';
import lineJsunit from './LineJsunit.test';
import circleJsunit from './CircleJsunit.test';
import aboutToDisappearJsunit from './AboutToDisappearJsunit.test';
import timeStampJsunit from './TimeStampJsunit.test';

export default function testsuite() {
  badgeJsunit();
  lineJsunit();
  progressJsunit();
  textJsunit();
  buttonJsunit();
  tabsJsunit();
  qrCodeJsunit();
  circleJsunit();
  gridJsunit();
  tapGesture();
   panGestureJsunit();
  canvasJsunit();
  canvas2Jsunit();
  longPressGestureJsUnit();
  responseRegionJsunit();
  animateJsunit();
  commonJsunit();
  spanJsunit();
  ratingJsunit();
  toggleJsunit();
  shapeJsunit();
  motionPathJsunit();
  scrollCodeJsunit();
  transitionJsunit();
  priorityGestureJsunit();
  parallelGestureJsunit();
  blankJsunit();
  sharedTransitionJsunit();
  aboutToDisappearJsunit();
  timeStampJsunit();
}