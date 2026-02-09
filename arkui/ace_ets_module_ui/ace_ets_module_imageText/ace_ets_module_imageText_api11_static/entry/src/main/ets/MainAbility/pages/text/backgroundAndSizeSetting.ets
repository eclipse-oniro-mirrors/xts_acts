//'use static';
// /**
//  * Copyright (c) 2025 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
import {
  Entry,
  Component,
  Column,
  Text,
  ColumnOptions,
  Padding,
  Color,
  Row,
  ImageRepeat,
  ImageSize,
  TextAlign,
  SizeOptions,
  Position
} from '@ohos.arkui.component'
import {
  State,
  StoragePropRef
} from '@ohos.arkui.stateManagement'
import emitter from '@ohos.events.emitter';

@Entry
@Component
struct BackgroundExample {
  @StoragePropRef('width1') width1: number = 80
  @StoragePropRef('height1') height1: number = 80
  @StoragePropRef('padding1') padding1: number = 20
  @StoragePropRef('margin1') margin1: number = 20
  @StoragePropRef('sizeWidth') sizeWidth: string = '100%';
  @StoragePropRef('sizeHeight') sizeHeight: string = '100%';
  @StoragePropRef('layoutWeight1') layoutWeight1: number = 1;
  @State layoutWeight2: number = 2;

  onPageShow() {
    console.info('background page show called');

  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('background color')
        .fontSize(9)
        .width('90%')
        .fontColor(0xFF0000)
        .key("fontColor")
      Row()
        .width('90%')
        .height(50)
        .backgroundColor(0xEEEE00)
        .key("backgroundColor")
        .border({ width: 1 })
      Text('background image repeat along X')
        .fontSize(9)
        .width('90%')
        .fontColor(0xCCCCCC)
      Row()
        .backgroundImage('/images/bg.jpg', ImageRepeat.X)
        .backgroundImageSize({ width: '250px', height: '140px' } as SizeOptions)
        .width('90%')
        .height(70)
        .border({ width: 1 })
      Text('background image repeat along Y')
        .fontSize(9)
        .width('90%')
        .fontColor(0xFF0000)
      Row()
        .backgroundImage('/images/bg.jpg', ImageRepeat.Y)
        .backgroundImageSize({ width: '500px', height: '120px' } as SizeOptions)
        .width('90%')
        .height(100)
        .border({ width: 1 })
      Text('background image size')
        .fontSize(9)
        .width('90%')
        .fontColor(0xFF0000)
      Row()
        .width('90%')
        .height(150)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize({ width: 1000, height: 500 } as SizeOptions)
        .border({ width: 1 })
      Text('background fill the box(Cover)')
        .fontSize(9)
        .width('90%')
        .fontColor(0xFF0000)
      Row()
        .width(200)
        .height(50)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize(ImageSize.Cover)
        .border({ width: 1 })
      Text('background fill the box(Contain)')
        .fontSize(9)
        .width('90%')
        .fontColor(0xFF0000)
      Row()
        .width(200)
        .height(50)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize(ImageSize.Contain)
        .border({ width: 1 })
      Text('background image position')
        .fontSize(9)
        .width('90%')
        .fontColor(0xFF0000)
      Row()
        .width(100)
        .height(50)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize({ width: 1000, height: 560 } as SizeOptions)
        .backgroundImagePosition({ x: -500, y: -300 } as Position)
        .border({ width: 1 })

      Text('margin and padding:')
        .fontSize(26)
        .fontColor(Color.Black)
        .width('90%')
      Row() {
        Row() {
          Row()
            .size({ width: this.sizeWidth, height: this.sizeHeight })
            .backgroundColor(0xAFEEEE)
            .key('innerRow')
        }
        .key('centerRow')
        .width(this.width1)
        .height(this.height1)
        .padding(this.padding1)
        .margin(this.margin1)
        .backgroundColor(0xFDF5E6)
      }.backgroundColor(0xFFA500)

      Text('layoutWeight')
        .fontSize(26)
        .fontColor(Color.Black)
        .width('90%')
      Row() {
        Text('layoutWeight(1)')
          .size({ width: '30%', height: 110 })
          .backgroundColor(0xFFEFD5)
          .textAlign(TextAlign.Center)
          .layoutWeight(this.layoutWeight1)
          .fontSize(20)
          .key('layoutWeight1')
        Text('layoutWeight(2)')
          .size({ width: '30%', height: 110 })
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .layoutWeight(this.layoutWeight2)
          .fontSize(20)
          .key('layoutWeight2')
        Text('no layoutWeight')
          .size({ width: '30%', height: 110 })
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .fontSize(20)
      }.size({ width: '90%', height: 140 })
      .backgroundColor(0xAFEEEE)

      Text('constraintSize')
        .fontSize(26)
        .fontColor(Color.Black)
        .width('90%')
      Row() {
        Row()
          .constraintSize({ minWidth: '10%', maxWidth: '50%', minHeight: 70 })
          .backgroundColor(0xFFA500)
        Row()
          .size({ width: '30%', height: 70 })
          .backgroundColor(0xAFEEEE)
      }.size({ width: '90%', height: 140 })
      .backgroundColor(0xAFEEEE)
    }.width('100%').height('100%').padding({ top: 5 } as Padding)
  }
}