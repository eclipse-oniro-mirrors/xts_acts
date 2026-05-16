/**
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

import { ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct TestSweepGradientOptions {
  @State p3Red: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1);
  @State p3Green: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1);
  @State p3Blue: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 0, 1, 1);
  @State repeatingFlg: boolean = false;

  build() {
    Column({ space: 5 }) {
      Row().id('testSweepGradientOptionsId')
        .width(100)
        .height(100)
        .sweepGradient({
          center: [50, 50],
          start: 0,
          end: 359,
          rotation: 45,
          repeating: this.repeatingFlg,
          colors: [[0xff0000, 0.0], [0x0000ff, 0.3], [0xffff00, 0.5]], 
          metricsColors: [[this.p3Red, 0.0], [this.p3Green, 0.5], [this.p3Blue, 1.0]]  
        })
      Button('change').id('changeId').onClick(() => {
        this.repeatingFlg = !this.repeatingFlg;
      }).height('10%')
    }
    .width('100%')
    .height('90%')
    .padding({ top: 5 })
  }
}