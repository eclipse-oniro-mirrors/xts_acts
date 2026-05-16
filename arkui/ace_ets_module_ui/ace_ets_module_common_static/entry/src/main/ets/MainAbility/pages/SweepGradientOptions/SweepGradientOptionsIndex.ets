'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ColorMetrics, ColorSpace } from '@kit.ArkUI';

@Entry
@Component
struct SweepGradientOptionsIndex {
  @State p3Green: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1);

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('SweepGradientOptionsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text('SweepGradientOpticmetricsColors')
        .id('SweepGradientOpticmetricsColors')
        .key('SweepGradientOpticmetricsColors')
        .width('30%')
        .height('5%')
        .sweepGradient({
          center: ['50%', '50%'],
          start: 0,
          end: 359,
          metricsColors: [[this.p3Green, 0.0], [this.p3Green, 0.5], [this.p3Green, 1.0]],
          colors: []
        });
    }
    .width('100%')
    .height('100%');
  }
}
