'use static';
/*
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
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  FontWeight,
  ImageFit,
  ImageRepeat,
  ImageInterpolation,
  ImageRenderMode,
  ImageCompleteEvent,
  ImageError
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { Callback } from '@ohos.base';

@Entry
@Component
struct image_textcase {
  @State myWidth: number = 0
  @State myHeight: number = 0

  onPageShow() {
    console.info('Image page show called');
  }

  onBuildDone() {
    console.info('Image page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Image page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Image("/resources/rawfile/hand.png")
          .matchTextDirection(false)
          .fitOriginalSize(false)
          .fillColor(0xCCCCCC)
          .objectFit(ImageFit.Cover)
          .objectRepeat(ImageRepeat.NoRepeat)
          .interpolation(ImageInterpolation.None)
          .renderMode(ImageRenderMode.Original)
          .autoResize(false)
          .syncLoad(false)
          .sourceSize({ width: UIContext.resolveUIContext()!.px2vp(200), height: UIContext.resolveUIContext()!.px2vp(100) })
          .alt("/resources/rawfile/person.png")
          .key('image1')
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.Contain)
          .objectRepeat(ImageRepeat.X)
          .interpolation(ImageInterpolation.High)
          .renderMode(ImageRenderMode.Template)
          .key('image2')
          .height(180)
          .width(180)
          .onComplete((msg?: ImageCompleteEvent) => {
            if (msg !== undefined) {
              this.myWidth = msg.width
              this.myHeight = msg.height
              console.info('Width ----' + this.myWidth)
              console.info('height ----' + this.myHeight)
            }
          })
          .onError((error: ImageError) => {
            console.info('load image fail')
          })
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.Fill)
          .objectRepeat(ImageRepeat.Y)
          .interpolation(ImageInterpolation.Low)
          .key('image3')
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.None)
          .objectRepeat(ImageRepeat.XY)
          .interpolation(ImageInterpolation.Medium)
          .key('image4')
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.ScaleDown)
          .key('image5')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(4)
    }
  }
}


