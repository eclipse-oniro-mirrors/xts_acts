'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, Text, Rating, Margin, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct rating04 {
  @State rating: number = 1

  build() {
    Column() {
      Text('current score is ' + this.rating)
        .fontSize(24)
        .fontColor('rgba(24,36,49,0.60)')
        .margin({ top: 50 } as Margin)
        .id('ratingText04')

      Rating({ rating:this.rating, indicator: false })
        .width(300)
        .height(300)
        .stars(8)
        .stepSize(0.05)
        .margin({ top: 24 } as Margin)
        .onChange((value: number):void => {
          this.rating = value
        })
        .id('rating04')
    }.width('100%')
    .height('100%')
  }
}