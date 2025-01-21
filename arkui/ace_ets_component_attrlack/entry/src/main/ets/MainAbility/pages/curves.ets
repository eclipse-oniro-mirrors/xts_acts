/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CurvesEaseOut {
  @State widthSize: number = 400
  @State heightSize: number = 200
  @State flag: boolean = true

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CurvesEaseOut  start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CurvesEaseOut end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("EaseOutText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000, // 动画时长
          curve: Curve.EaseOut, // 动画曲线:以低速结束
          delay: 100, // 动画延迟
          iterations: 1, // 播放次数
          playMode: PlayMode.Normal // 动画模式
        }) // 对Button组件的宽高属性进行动画配置

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("EaseInOutText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.EaseInOut, //以低速开始和结束
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("FastOutSlowInText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.FastOutSlowIn, //标准曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("LinearOutSlowInText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.LinearOutSlowIn, //减速曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("FastOutLinearInText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.FastOutLinearIn, //加速曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("ExtremeDecelerationText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.ExtremeDeceleration, //急缓曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("SharpText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.Sharp, //锐利曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("RhythmText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.Rhythm, //节奏曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("SmoothText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.Smooth, //平滑曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Button('click me')
        .align(Alignment.Center)
        .onClick((event: ClickEvent) => {
          if (this.flag) {
            this.widthSize = 100
            this.heightSize = 50
          } else {
            this.widthSize = 400
            this.heightSize = 200
          }
          this.flag = !this.flag
        })
        .key("FrictionText")
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(0x317aff)
        .animation({
          duration: 1000,
          curve: Curve.Friction, //阻尼曲线
          delay: 100,
          iterations: 1,
          playMode: PlayMode.Normal
        })
    }
    .width("100%")
    .height("100%")
  }
}

