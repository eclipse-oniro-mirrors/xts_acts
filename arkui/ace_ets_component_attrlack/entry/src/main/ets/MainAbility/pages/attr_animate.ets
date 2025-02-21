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

import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct AttrAnimationExample {
  @State widthSize: number = 200
  @State heightSize: number = 80
  @State flag: boolean = true

  @State widthSizeEaseOut: number = 200
  @State heightSizeEaseOut: number = 80
  @State flagEaseOut: boolean = true

  @State widthSizeFastOutSlowIn: number = 200
  @State heightSizeFastOutSlowIn: number = 80
  @State flagFastOutSlowIn: boolean = true

  @State widthSizeLinearOutSlowIn: number = 200
  @State heightSizeLinearOutSlowIn: number = 80
  @State flagLinearOutSlowIn: boolean = true

  @State widthSizeFastOutLinearIn: number = 200
  @State heightSizeFastOutLinearIn: number = 80
  @State flagFastOutLinearIn: boolean = true

  @State widthSizeExtremeDeceleration: number = 200
  @State heightSizeExtremeDeceleration: number = 80
  @State flagExtremeDeceleration: boolean = true

  @State widthSizeSharp: number = 200
  @State heightSizeSharp: number = 80
  @State flagSharp: boolean = true

  @State widthSizeRhythm: number = 200
  @State heightSizeRhythm: number = 80
  @State flagRhythm: boolean = true

  @State widthSizeSmooth: number = 200
  @State heightSizeSmooth: number = 80
  @State flagSmooth: boolean = true

  @State widthSizeFriction: number = 200
  @State heightSizeFriction: number = 80
  @State flagFriction: boolean = true

  build() {
    Column() {
      Button('EaseInOut')
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 200
            this.heightSize = 80
          }
          this.flag = !this.flag
        })
        .width(this.widthSize).height(this.heightSize).backgroundColor(0x317aff)
        .animation({
          duration: 2000, // 动画时长
          curve: Curve.EaseInOut, // 动画曲线
          delay: 500, // 动画延迟
          iterations: 1, // 播放次数
          playMode: PlayMode.Normal // 动画模式
        })

      Button('Curve.EaseOut')
        .onClick((event: ClickEvent) => {
          if (this.flagEaseOut) {
            this.widthSizeEaseOut = 100
            this.heightSizeEaseOut = 50
          } else {
            this.widthSizeEaseOut = 200
            this.heightSizeEaseOut = 80
          }
          this.flagEaseOut = !this.flagEaseOut
        })
        .width(this.widthSizeEaseOut).height(this.heightSizeEaseOut).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.EaseOut,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('FastOutSlowIn')
        .onClick((event: ClickEvent) => {
          if (this.flagFastOutSlowIn) {
            this.widthSizeFastOutSlowIn = 100
            this.heightSizeFastOutSlowIn = 50
          } else {
            this.widthSizeFastOutSlowIn = 200
            this.heightSizeFastOutSlowIn = 80
          }
          this.flagFastOutSlowIn = !this.flagFastOutSlowIn
        })
        .width(this.widthSizeFastOutSlowIn).height(this.heightSizeFastOutSlowIn).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.FastOutSlowIn,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('LinearOutSlowIn')
        .onClick((event: ClickEvent) => {
          if (this.flagLinearOutSlowIn) {
            this.widthSizeLinearOutSlowIn = 100
            this.heightSizeLinearOutSlowIn = 50
          } else {
            this.widthSizeLinearOutSlowIn = 200
            this.heightSizeLinearOutSlowIn = 80
          }
          this.flagLinearOutSlowIn = !this.flagLinearOutSlowIn
        })
        .width(this.widthSizeLinearOutSlowIn).height(this.heightSizeLinearOutSlowIn).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.LinearOutSlowIn,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('FastOutLinearIn')
        .onClick((event: ClickEvent) => {
          if (this.flagFastOutLinearIn) {
            this.widthSizeFastOutLinearIn = 100
            this.heightSizeFastOutLinearIn = 50
          } else {
            this.widthSizeFastOutLinearIn = 200
            this.heightSizeFastOutLinearIn = 80
          }
          this.flagFastOutLinearIn = !this.flagFastOutLinearIn
        })
        .width(this.widthSizeFastOutLinearIn).height(this.heightSizeFastOutLinearIn).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.FastOutLinearIn,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('ExtremeDeceleration')
        .onClick((event: ClickEvent) => {
          if (this.flagExtremeDeceleration) {
            this.widthSizeExtremeDeceleration = 100
            this.heightSizeExtremeDeceleration = 50
          } else {
            this.widthSizeExtremeDeceleration = 200
            this.heightSizeExtremeDeceleration = 80
          }
          this.flagExtremeDeceleration = !this.flagExtremeDeceleration
        })
        .width(this.widthSizeExtremeDeceleration).height(this.heightSizeExtremeDeceleration).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.ExtremeDeceleration,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('Sharp')
        .onClick((event: ClickEvent) => {
          if (this.flagSharp) {
            this.widthSizeSharp = 100
            this.heightSizeSharp = 50
          } else {
            this.widthSizeSharp = 200
            this.heightSizeSharp = 80
          }
          this.flagSharp = !this.flagSharp
        })
        .width(this.widthSizeSharp).height(this.heightSizeSharp).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.Sharp,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('Rhythm')
        .onClick((event: ClickEvent) => {
          if (this.flagRhythm) {
            this.widthSizeRhythm = 100
            this.heightSizeRhythm = 50
          } else {
            this.widthSizeRhythm = 200
            this.heightSizeRhythm = 80
          }
          this.flagRhythm = !this.flagRhythm
        })
        .width(this.widthSizeRhythm).height(this.heightSizeRhythm).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.Rhythm,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('Smooth')
        .onClick((event: ClickEvent) => {
          if (this.flagSmooth) {
            this.widthSizeSmooth = 100
            this.heightSizeSmooth = 50
          } else {
            this.widthSizeSmooth = 200
            this.heightSizeSmooth = 80
          }
          this.flagSmooth = !this.flagSmooth
        })
        .width(this.widthSizeSmooth).height(this.heightSizeSmooth).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.Smooth,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('Friction')
        .onClick((event: ClickEvent) => {
          if (this.flagFriction) {
            this.widthSizeFriction = 100
            this.heightSizeFriction = 50
          } else {
            this.widthSizeFriction = 200
            this.heightSizeFriction = 80
          }
          this.flagFriction = !this.flagFriction
        })
        .width(this.widthSizeFriction).height(this.heightSizeFriction).backgroundColor(0x317aff)
        .animation({
          duration: 2000,
          curve: Curve.Friction,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

    }.width('100%').margin({ top: 5 })
  }
}