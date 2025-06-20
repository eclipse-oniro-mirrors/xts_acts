/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { RatingModifier } from "@ohos.arkui.modifier";

class CustomModifier extends RatingModifier {
  applyNormalAttribute(instance: RatingAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.stepSize(0.4)
  }
}

@Entry
@Component
struct RatingPage {
  @State rating: number = 3.5
  @State indicator: boolean = true
  @State stars: number = 5
  @State stepSize: number = 0.5
  @State text: string = 'no change'
  @State backgroundUri: string = 'resources/base/media/star_1.png'
  @State foregroundUri: string = 'resources/base/media/star_2.png'
  @State secondaryUri: string = 'resources/base/media/star_3.png'

  @State customModifier: RatingModifier = new CustomModifier()
    .stars(this.stars)
    .stepSize(this.stepSize)
    .starStyle({
      backgroundUri: this.backgroundUri,
      foregroundUri: this.foregroundUri,
      secondaryUri: this.secondaryUri})

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();})
        .key("changeButton")
      Column() {
        Rating({ rating: this.rating, indicator: this.indicator })
          .key('rating1')
          .margin({ top: 24 })
          .attributeModifier(this.customModifier as CustomModifier)
      }.width(360).height(150).backgroundColor('#FFFFFF').margin({ top: 68 })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}