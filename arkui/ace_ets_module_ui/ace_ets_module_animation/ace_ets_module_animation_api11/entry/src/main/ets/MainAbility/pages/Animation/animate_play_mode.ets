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

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct AttrAnimationExample {
  @State widthSize: number = 200
  @State heightSize: number = 100
  @State flag: boolean = true
  @State widthSizeAlternate: number = 200
  @State heightSizeAlternate: number = 100
  @State flagAlternate: boolean = true
  @State widthSizeNormal: number = 200
  @State heightSizeNormal: number = 100
  @State flagNormal: boolean = true
  @State widthSizeAlternateReverse: number = 200
  @State heightSizeAlternateReverse: number = 100
  @State flagAlternateReverse: boolean = true

  build() {
    Column() {
      Button('PlayMode.Reverse')
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 200
            this.heightSize = 100
          }
          this.flag = !this.flag
        })
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .key("Reverse")
        .animation({
          duration: 3000, // 动画时长
          curve: Curve.EaseOut, // 动画曲线
          delay: 1000, // 动画延迟
          iterations: 1, // 播放次数
          playMode: PlayMode.Reverse // 动画模式
        }) // 对Button组件的宽高属性进行动画配置

      Button('PlayMode.Alternate')
        .onClick((event: ClickEvent) => {
          if (this.flagAlternate) {
            this.widthSizeAlternate = 100
            this.heightSizeAlternate = 50
          } else {
            this.widthSizeAlternate = 200
            this.heightSizeAlternate = 100
          }
          this.flagAlternate = !this.flagAlternate
        })
        .width(this.widthSizeAlternate)
        .height(this.heightSizeAlternate)
        .backgroundColor(0x317aff)
        .key("Alternate")
        .animation({
          duration: 3000,
          curve: Curve.EaseOut,
          delay: 1000,
          iterations: 1,
          playMode: PlayMode.Alternate
        })

      Button('PlayMode.Normal')
        .onClick((event: ClickEvent) => {
          if (this.flagNormal) {
            this.widthSizeNormal = 100
            this.heightSizeNormal = 50
          } else {
            this.widthSizeNormal = 200
            this.heightSizeNormal = 100
          }
          this.flagNormal = !this.flagNormal
        })
        .width(this.widthSizeNormal)
        .height(this.heightSizeNormal)
        .backgroundColor(0x317aff)
        .key("Normal")
        .animation({
          duration: 3000,
          curve: Curve.EaseOut,
          delay: 1000,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('PlayMode.AlternateReverse')
        .onClick((event: ClickEvent) => {
          if (this.flagAlternateReverse) {
            this.widthSizeAlternateReverse = 100
            this.heightSizeAlternateReverse = 50
          } else {
            this.widthSizeAlternateReverse = 200
            this.heightSizeAlternateReverse = 100
          }
          this.flagAlternateReverse = !this.flagAlternateReverse
        })
        .width(this.widthSizeAlternateReverse)
        .height(this.heightSizeAlternateReverse)
        .backgroundColor(0x317aff)
        .key("AlternateReverse")
        .animation({
          duration: 3000,
          curve: Curve.EaseOut,
          delay: 1000,
          iterations: 1,
          playMode: PlayMode.AlternateReverse
        })
    }.width('100%').margin({ top: 5 })
  }
}