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
  AdaptiveColor,
  BlurOptions,
  BlurStyle,
  Color,
  Column,
  Component,
  Entry,
  FontWeight,
  HorizontalAlign,
  Margin,
  Row,
  Text,
  TextAlign,
  ThemeColorMode
} from '@ohos.arkui.component'

@Entry
@Component
struct Blur {
  build() {
    Column() {
      Row() {
        Text('foregroundBlurStyle')
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontSize(20)
      }
      .height('20%')
      .width('100%')
      .margin({ bottom: 20 } as Margin)
      .backgroundColor(Color.Red)
      .foregroundBlurStyle(BlurStyle.Thin,
        { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
      .id('foregroundBlurStyleId')

      Row() {
        Text('blur')
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontSize(20)
      }
      .height('20%')
      .width('100%')
      .margin({ bottom: 20 } as Margin)
      .backgroundColor(Color.Red)
      .blur(5, { grayscale: [10, 15] } as BlurOptions)
      .id('blurId')

      Row() {
        Text('backdropBlur')
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontSize(20)
      }
      .height('20%')
      .width('100%')
      .margin({ bottom: 20 } as Margin)
      .backgroundColor(Color.Red)
      .backdropBlur(15, { grayscale: [5, 10] })
      .id('backdropBlurId')

    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}
