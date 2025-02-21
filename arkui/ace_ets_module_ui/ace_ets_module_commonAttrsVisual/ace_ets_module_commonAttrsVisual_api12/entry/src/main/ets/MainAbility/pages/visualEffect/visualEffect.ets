/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import uiEffect from '@ohos.graphics.uiEffect'

@Entry
@Component
struct visualEffect1 {
  @State visualEffectTest: uiEffect.VisualEffect = uiEffect.createEffect()
  @State filterTest: uiEffect.Filter = uiEffect.createFilter()

  build() {
    Column({ space: 15 }) {
      Text('visualEffect').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text().id("visualEffect_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))
        .visualEffect(this.visualEffectTest) // 通过 visualEffect 设置背景颜色提亮效果

      Text('foregroundFilter').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text().id("foregroundFilter_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))
        .foregroundFilter(this.filterTest.blur(10)) // by foregroundFilter pixelExpand

      Text('backgroundFilter').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text().id("backgroundFilter_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))
        .backgroundFilter(this.filterTest.blur(10)) // 通过 backgroundFilter 设置模糊效果

      Text('compositingFilter').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text().id("compositingFilter_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))
        .compositingFilter(this.filterTest.blur(10)) // 通过 compositingFilter 设置模糊效果
    }
    .height('100%')
    .width('100%')
  }
}