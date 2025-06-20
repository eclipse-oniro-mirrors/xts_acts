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
import backgroundImageResizableTest from './backgroundImageTest/backgroundImageResizable.test';
import foregroundEffect from './foregroundEffect.test'
import systemBarEffectTest from './ImageEffectTest/systemBarEffect1.test'
import freezeTest from './ImageEffectTest/freeze.test'
import fractionStops from './ImageEffectTest/fractionStops.test'
import backgroundBrightness from './backgroundImageTest/backgroundBrightness.test';
import visualEffectTest from './visualEffectTest/visualEffect.test'
import motionBlurTest from './visualEffectTest/motionBlur.test'

export default function testsuite() {
  backgroundImageResizableTest();
  foregroundEffect();
  systemBarEffectTest();
  freezeTest();
  fractionStops()
  backgroundBrightness()
  visualEffectTest();
  motionBlurTest();
}