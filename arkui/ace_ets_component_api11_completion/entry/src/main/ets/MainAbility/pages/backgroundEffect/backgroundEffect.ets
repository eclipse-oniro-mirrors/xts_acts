/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
@Entry
@Component
struct backgroundEffect1 {
  build() {
    Column() {
      Text('Thin Material').fontSize(30).fontColor(0xCCCCCC)
      Image($r('app.media.icon')).id("backgroundEffect_id1")
        .width(300)
        .height(350)
        .backgroundEffect({ radius: 10, saturation: 10, adaptiveColor: AdaptiveColor.DEFAULT, blurOptions: {grayscale:[1,1]} })

      Image($r('app.media.icon')).id("backgroundEffect_id2")
        .width(300)
        .height(350)
        .backgroundEffect({ radius: 10, saturation: 10, adaptiveColor: AdaptiveColor.AVERAGE, blurOptions: {grayscale:[1,1]} })
    }
    .height('100%')
    .width('100%')
  }
}