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

import { Entry, Column, Component, Margin, Rating, $rawfile } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
@Entry
@Component
struct ratingStarStyle_01 {
  @State rating: number = 3.5

  build() {
    Column() {
      Rating({ rating: this.rating, indicator: false })
        .id('rating_001')
        .stars(5)
        .stepSize(0.5)
        .starStyle({
          backgroundUri: $rawfile('image1.png'),
          foregroundUri: $rawfile('image2.png'),
          secondaryUri: $rawfile('image3.png'),
        })
        .margin({ top: 24 } as Margin)
        .onChange((value: number) => {
          this.rating = value
        })
      Rating({ rating: this.rating, indicator: false })
        .id('rating_002')
        .stars(5)
        .stepSize(0.5)
        .starStyle({
          backgroundUri: 'resources/rawfile/image1.png',
          foregroundUri: 'resources/rawfile/image2.png',
          secondaryUri: 'resources/rawfile/image3.png',
        })
        .margin({ top: 24 } as Margin)
        .onChange((value: number) => {
          this.rating = value
        })
      Rating({ rating: this.rating, indicator: false })
        .id('rating_003')
        .stars(5)
        .stepSize(0.5)
        .starStyle({
          backgroundUri: undefined,
          foregroundUri: undefined,
          secondaryUri: undefined,
        })
        .margin({ top: 24 } as Margin)
        .onChange((value: number) => {
          this.rating = value
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}