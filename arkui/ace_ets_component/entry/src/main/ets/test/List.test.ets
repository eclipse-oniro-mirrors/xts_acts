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

import appearJsunit from './AppearJsunit.test';
import areaChangeJsunit from './AreaChangeJsunit.test';
import ellipseJsunit from './EllipseJsunit.test';
import enableJsunit from './EnableJsunit.test';
import gaugeJsunit from './GaugeJsunit.test';
import globalJsunit from './GlobalJsunit.test';
import girdContainerJsunit from './GridContainerJsunit.test';
import gridSettingsJsunit from './GridSettingsJsunit.test';
import imageEffectsJsunit from './ImageEffectsJsunit.test';
import layoutConstraintsJsunit from './LayoutConstraintsJsunit.test';
import listJsunit from './ListJsunit.test';
import marqueeJsunit from './MarqueeJsunit.test';
import overLayJsunit from './OverlayJsunit.test';
import stepperJsunit from './StepperJsunit.test';
import swiperJsunit from './SwiperJsunit.test';
import textStyleJsunit from './TextStyleJsunit.test';
import touchAbleJsunit from './TouchAbleJsunit.test';
import touchJsunit from './TouchJsunit.test';
import visibilityJsunit from './VisibilityJsunit.test';
import zIndexJsunit from './ZIndexJsunit.test';

export default function testsuite() {
  touchAbleJsunit();
  enableJsunit();
  appearJsunit();
  zIndexJsunit();
  ellipseJsunit();
  gaugeJsunit();
  globalJsunit();
  visibilityJsunit();
  girdContainerJsunit();
  areaChangeJsunit();
  imageEffectsJsunit();
  layoutConstraintsJsunit();
  listJsunit();
  marqueeJsunit();
  overLayJsunit();
  stepperJsunit();
  swiperJsunit();
  textStyleJsunit();
  touchJsunit();
  gridSettingsJsunit();
}