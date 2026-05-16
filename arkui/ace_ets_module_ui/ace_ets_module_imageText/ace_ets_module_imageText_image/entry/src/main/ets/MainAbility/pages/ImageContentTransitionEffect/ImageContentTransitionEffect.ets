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

@Entry
@Component
struct ImageContentTransitionEffectPage {
  @State imageResource: Resource = $r('app.media.image1');
  @State imageContentTransitionEffect: ContentTransitionEffect | undefined | null = ContentTransitionEffect.OPACITY

  build() {
    Column({ space: 10 }) {
      Image(this.imageResource)
        .width('40%')
        .height('40%')// 启用淡入淡出过渡效果。
        .contentTransition(this.imageContentTransitionEffect)
        .id('image')

      Flex({ wrap: FlexWrap.Wrap }) {
        Button('OPACITY').height('6%')
          .onClick(() => {
            this.imageResource = $r('app.media.image1')
            this.imageContentTransitionEffect = ContentTransitionEffect.OPACITY
          })
          .id('OpacityID')

        Button('IDENTITY').height('6%')
          .onClick(() => {
            this.imageResource = $r('app.media.image2')
            this.imageContentTransitionEffect = ContentTransitionEffect.IDENTITY
          })
          .id('IdentityID')

        Button('undefined').height('6%')
          .onClick(() => {
            this.imageResource = $r('app.media.image3')
            this.imageContentTransitionEffect = undefined
          })
          .id('undefinedID')

        Button('null').height('6%')
          .onClick(() => {
            this.imageResource = $r('app.media.image4')
            this.imageContentTransitionEffect = null
          })
          .id('nullID')
      }
    }.width('100%').margin({ top: 30 })
  }
}