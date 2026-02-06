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
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  PickerTextStyle,
  CalendarAlign,
  CalendarPicker,
  ArrowPosition,
  Select,
  BlurStyle,
  MenuAlignType,
  TextInputController,
  FlexAlign,
  Rating,
  Position,
  Image,
  HorizontalAlign
} from '@ohos.arkui.component';
import { State, AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct RatingPage {
  @StoragePropRef('rating') rating: number = 3.5
  @State rating1: number = 3.5

  @StoragePropRef('indicator') indicator: boolean = true
  @StoragePropRef('indicator1') indicator1: boolean = true
  @StoragePropRef('stars') stars: int = 5
  @StoragePropRef('stepSize') stepSize: number = 0.5
  @State stars1: int = 5
  @State stepSize1: number = 0.5
  @State text: string = 'no change'
  @State backgroundUri: string = 'resources/base/media/star_1.png'
  @State foregroundUri: string = 'resources/base/media/star_2.png'
  @State secondaryUri: string = 'resources/base/media/star_3.png'

  build() {
    Column() {
      Column() {
        Rating({ rating: 0 }).margin({ top: 1, right: 8 } as Margin).key('rating').id('rating')
          .starStyle({ backgroundUri: 'resources/base/media/star_1.png', foregroundUri: 'resources/base/media/star_2.png', secondaryUri: 'resources/base/media/star_3.png' })
        Text('default rating')
          .fontSize(16)
          .fontColor('rgba(24,36,49,0.60)')
        Rating({ rating: this.rating, indicator: this.indicator })
          .stars(this.stars)
          .stepSize(this.stepSize)
          .key('rating1')
          .id('rating1')
          .starStyle({ backgroundUri: this.backgroundUri,foregroundUri: this.foregroundUri,secondaryUri: this.secondaryUri })
          .margin({ top: 24 } as Margin)
          .onChange((value: number):void => {
            this.text = 'change succ'
            this.rating = value
          })
        Text('current score is ' + this.rating)
          .fontSize(16)
          .fontColor('rgba(24,36,49,0.60)')
          .margin({ top: 16 } as Margin)
        Rating({ rating: this.rating1, indicator: this.indicator1 })
          .stars(this.stars1)
          .stepSize(this.stepSize1)
          .id('ratingBtn')
          .starStyle({ backgroundUri: this.backgroundUri,foregroundUri: this.foregroundUri,secondaryUri: this.secondaryUri })
          .margin({ top: 24 } as Margin)
          .onChange((value: number):void => {
            this.text = 'change succ'
            this.rating1 = value
          })
        Text('current score is ' + this.rating1)
          .fontSize(16)
          .fontColor('rgba(24,36,49,0.60)')
          .margin({ top: 16 } as Margin)
        Text(this.text).fontSize(20).margin(10).key('text').id('text')
      }
      .width('80%')
      .height('80%')
      .backgroundColor('#FFFFFF')


      Row() {
        Image('resources/base/media/image.png')
          .width(40)
          .height(40)
          .borderRadius(20)
          .margin({ left: 24 } as Margin)
        Column() {
          Text('Yue')
            .fontSize(16)
            .fontColor('#182431')
            .fontWeight(500)
          Row() {
            Rating({ rating: 3.5, indicator: true }).margin({ top: 1, right: 8 } as Margin)
            Text('2021/06/02')
              .fontSize(10)
              .fontColor('#182431')
          }
        }.margin({ left: 12 } as Margin).alignItems(HorizontalAlign.Start)

        Text('1st Floor')
          .fontSize(10)
          .fontColor('#182431')
          .position({ x: 295, y: 8 } as Position)
      }.width(360).height(56).backgroundColor('#FFFFFF').margin({ top: 64 } as Margin)
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}