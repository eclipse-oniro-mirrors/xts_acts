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
import {
  Entry,
  Component,
  Column,
  Text,
  Margin,
  ClickEvent,
  Color,
  Curve,
  PlayMode
} from '@ohos.arkui.component'
import {
  State,AppStorage,
} from '@ohos.arkui.stateManagement'
import Curves from '@ohos.curves';
import { GlobalContext } from '../../common/GlobalContext';

@Entry
@Component
struct CurveExample {
  @State widthSize: number = 100
  @State heightSize: number = 100
  @State widthSize1: number = 100
  @State heightSize1: number = 100
  @State widthSize2: number = 100
  @State heightSize2: number = 100
  @State widthSize3: number = 100
  @State heightSize3: number = 100

  onPageShow() {
    console.info("curve start page run !!!!")
  }

  build() {
    Column() {
      Text()
        .key('curve')
        .margin({ top: 100 } as Margin)
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(Color.Red)
        .onClick((e:ClickEvent) => {
          let curve = Curves.stepsCurve(9, true);
          this.widthSize = curve.interpolate(0.5) * this.widthSize;
          AppStorage.setOrCreate<number>('widthSize', this.widthSize);
          this.heightSize = curve.interpolate(0.5) * this.heightSize;
          AppStorage.setOrCreate<number>('heightSize', this.heightSize);
          console.info("Curves heightSize" + this.heightSize);
          console.info("Curves widthSize" + this.widthSize);
        })
        .animation({
          duration: 2000,
          curve: Curve.EaseIn,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Text()
        .key('curve1')
        .margin({ top: 100 } as Margin)
        .width(this.widthSize1)
        .height(this.heightSize1)
        .backgroundColor(Color.Red)
        .onClick((e:ClickEvent) => {
          let curve = Curves.springCurve(10, 1, 28, 3);
          this.widthSize1 = curve.interpolate(0.5) * this.widthSize1;
          AppStorage.setOrCreate<number>('widthSize1', this.widthSize1);
          this.heightSize1 = curve.interpolate(0.5) * this.heightSize1;
          AppStorage.setOrCreate<number>('heightSize1', this.heightSize1);
          console.info("Curves heightSize1" + this.heightSize1);
          console.info("Curves widthSize1" + this.widthSize1);
        })
        .animation({
          duration: 2000,
          curve: Curve.EaseIn,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Text()
        .key('curve2')
        .margin({ top: 100 } as Margin)
        .width(this.widthSize2)
        .height(this.heightSize2)
        .backgroundColor(Color.Red)
        .onClick((e:ClickEvent) => {
          let curve = Curves.initCurve();
          this.widthSize2 = curve.interpolate(0.5) * this.widthSize2;
          AppStorage.setOrCreate<number>('widthSize2', this.widthSize2);
          this.heightSize2 = curve.interpolate(0.5) * this.heightSize2;
          AppStorage.setOrCreate<number>('heightSize2', this.heightSize2);
          console.info("Curves heightSize2" + this.heightSize2);
          console.info("Curves widthSize2" + this.widthSize2);
        })
        .animation({
          duration: 2000,
          curve: Curve.EaseIn,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

      Text()
        .key('curve3')
        .margin({ top: 100 } as Margin)
        .width(this.widthSize3)
        .height(this.heightSize3)
        .backgroundColor(Color.Red)
        .onClick((e:ClickEvent) => {
          let curve = Curves.cubicBezierCurve(0.1, 1, 0.1, 1);
          this.widthSize3 = curve.interpolate(0.5) * this.widthSize3;
          AppStorage.setOrCreate<number>('widthSize3', this.widthSize3);
          this.heightSize3 = curve.interpolate(0.5) * this.heightSize3;
          AppStorage.setOrCreate<number>('heightSize3', this.heightSize3);
          console.info("Curves heightSize3" + this.heightSize3);
          console.info("Curves widthSize23" + this.widthSize3);
        })
        .animation({
          duration: 2000,
          curve: Curve.EaseIn,
          delay: 500,
          iterations: 1,
          playMode: PlayMode.Normal
        })

    }.width("100%").height("100%")
  }
}

