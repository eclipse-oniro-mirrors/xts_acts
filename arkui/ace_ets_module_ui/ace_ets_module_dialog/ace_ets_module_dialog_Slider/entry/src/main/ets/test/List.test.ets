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

import SliderOptionValue from './Slider/slider.test';
import SliderInterfaceTest from './Slider/sliderInterfaceTest.test'
import sliderJsunit1 from './Slider/SliderJsunit1.test';
import sliderMovingJsunit from './SliderTest/slider.test';
import sliderJsunit from './SliderTest/SliderJsunit.test';
import SliderTestC from './SliderTestC/sliderJsunit.test';

import SliderAttrs from './SliderTest/SliderAttrs.test';
import SliderContentModifier from './SliderTest/SliderContentModifier.test';
import slideRange from './SliderTest/slideRange.test';
import SliderAttrs2 from './SliderTest/SliderAttrs2.test';
import XComponentSliderTest from './SliderTest/XcomponentSlider.test';
import sliderNode from './Slider/sliderNode.test';
import sliderOnChangeModifierTest from './Slider/sliderOnChangeModifier.test';
import sliderTrackColorMetricsTest from './SliderTest/sliderTrackColorMetrics.test';

export default function testsuite() {
  SliderOptionValue();
  SliderInterfaceTest();
  sliderJsunit1();
  sliderMovingJsunit();
  sliderJsunit();
  SliderTestC();
  SliderAttrs();
  SliderContentModifier();
  slideRange();
  SliderAttrs2();
  XComponentSliderTest();
  sliderNode();
  sliderOnChangeModifierTest();
  sliderTrackColorMetricsTest();
}