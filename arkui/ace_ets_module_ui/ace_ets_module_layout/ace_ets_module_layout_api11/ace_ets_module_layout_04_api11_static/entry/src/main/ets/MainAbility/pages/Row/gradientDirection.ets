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
import { Entry, Component, Column, Text, Row, ColumnOptions, Margin, GradientDirection,Color } from '@ohos.arkui.component'
import { State,AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct linearGradientExample {
  @StoragePropRef('sDirection') sDirection: GradientDirection = GradientDirection.LeftTop

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('linearGradient').fontSize(12).width('90%').fontColor(0xCCCCCC)
      Row()
        .width(100)
        .height(100)
        .linearGradient({
          angle: 45,
          direction: this.sDirection,
          colors: [[Color.Red, 0.0], [Color.Red, 0.3], [Color.Red, 1.0]]
        }).key("GradientDirection")
    }
    .width('100%')
    .padding({ top: 5 } as Margin)
  }
}