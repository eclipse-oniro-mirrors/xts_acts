'use static';
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

import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Gauge, Margin,Color} from '@ohos.arkui.component'
import { State,  AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct GaugeExample {
  @StoragePropRef('gaugeValue') gaugeValue: number = 50;
  @StoragePropRef('strokeWidthValue') strokeWidthValue: string = '20';
  @StoragePropRef('startAngleValue') startAngleValue: number = 210;
  @StoragePropRef('endAngleValue') endAngleValue: number = 150;
  @StoragePropRef('colorValues') colorValues: string = JSON.stringify([[Color.Red, 1], [Color.Red, 1], [Color.Red, 1], [Color.Red, 1], [Color.Red, 1]]);

  build() {
    Column() {
      Gauge({ value: 0, min: 0, max: 100 })
        .key("gauge")
        .value(this.gaugeValue)
        .startAngle(this.startAngleValue)
        .endAngle(this.endAngleValue)
        .strokeWidth(`${this.strokeWidthValue}`)
        .width(200)
        .height(200)
    }
    .width('100%')
    .margin({ top: 300 } as Margin)
  }
}

