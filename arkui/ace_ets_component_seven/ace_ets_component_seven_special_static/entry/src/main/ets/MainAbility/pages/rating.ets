'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Flex, AttributeModifier, RatingAttribute, Column, Rating, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class RatingModifier1 implements AttributeModifier<RatingAttribute>{
  stars: int = 5
  stepSize: number = 0.5
  backgroundUri: string = 'resources/base/media/star_1.png'
  foregroundUri: string = 'resources/base/media/star_2.png'
  secondaryUri: string = 'resources/base/media/star_3.png'
  applyNormalAttribute(instance: RatingAttribute): void {

    instance.stars(this.stars)

      .stepSize(this.stepSize)

      .starStyle({
        backgroundUri: this.backgroundUri,

        foregroundUri: this.foregroundUri,

        secondaryUri: this.secondaryUri
      })
  }
}
@Entry
@Component
struct RatingPage {
  @State ratingModifier: RatingModifier1 = new RatingModifier1()
  @State rating: number = 3.5
  @State indicator: boolean = true
  @State stars: int = 5
  @State stepSize: number = 0.5
  @State text: string = 'no change'
  @State backgroundUri: string = 'resources/base/media/star_1.png'
  @State foregroundUri: string = 'resources/base/media/star_2.png'
  @State secondaryUri: string = 'resources/base/media/star_3.png'
  build() {
    Column() {
      Column() {
        Rating({ rating: this.rating, indicator: this.indicator })
          .key('rating1')
          .margin({ top: 24 } as Margin)
          .attributeModifier(this.ratingModifier)
      }.width(360).height(150).backgroundColor('#FFFFFF').margin({ top: 68 } as Margin)
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}