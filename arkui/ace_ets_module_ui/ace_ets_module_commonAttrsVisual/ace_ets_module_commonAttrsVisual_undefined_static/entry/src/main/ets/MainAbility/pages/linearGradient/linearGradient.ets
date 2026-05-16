'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { State } from '@ohos.arkui.stateManagement'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  GradientDirection,
  LinearGradientOptions,
  Color
} from '@ohos.arkui.component'

@Entry
@Component
struct LinearGradientPage {
  @State isShow: boolean | undefined = true;

  build() {
    Column() {
      Text('linearGradient').fontSize(12).width('90%').fontColor(Color.Gray)
      Row()
        .width('90%')
        .height(50)
        .linearGradient(this.isShow ? {
          angle: 90,
          direction: GradientDirection.Left,
          colors: [['#ff0000', 0.0], ['#0000ff', 0.3], ['#ffff00', 1.0]],
          repeating: true
        } as LinearGradientOptions : undefined)
        .id('linearGradientTest')
      Button('linearGradient: ')
        .id('linearGradient')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}