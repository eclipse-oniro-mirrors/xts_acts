'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {  Entry,  Text,  Column,  Component,  Button,  ClickEvent,  $r,  ImageRepeat,  BackgroundImageOptions,
  ColumnOptions,  BorderOptions,  ResizableOptions,  Color,  HoverEffect,  ImageSize,  HitTestMode,  Blank,
  List,  Position,  Row,  Divider,  TextAlign,  Alignment,  BorderStyle,  Padding,  PixelRoundPolicy,
  PixelRoundCalcPolicy } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct PositionExample2 {
  @State isOffsetUndefined: boolean = false;
  @State isPaddingUndefined: boolean = false;
  @State isPositionUndefined: boolean = false;
  @State isPixelRoundUndefined: boolean = false;
  @State curWidth: number = 300.8;

  build() {
    Column() {
      Button('isOffsetUndefined = ' + this.isOffsetUndefined)
        .onClick(() => {
          this.isOffsetUndefined = !this.isOffsetUndefined;
        })
        .height(20)
        .id('Common_Offset')
      Button('isPaddingUndefined = ' + this.isPaddingUndefined)
        .onClick(() => {
          this.isPaddingUndefined = !this.isPaddingUndefined;
        })
        .height(20)
        .id('Common_Padding')
      Button('isPositionUndefined = ' + this.isPositionUndefined)
        .onClick(() => {
          this.isPositionUndefined = !this.isPositionUndefined;
        })
        .height(20)
        .id('Common_Position')
      Button('isPixelRoundUndefined = ' + this.isPixelRoundUndefined)
        .onClick(() => {
          this.isPixelRoundUndefined = !this.isPixelRoundUndefined;
        })
        .height(20)
        .id('Common_PixelRound')


      List() {
         Text('offset-动态切换(undefined/offset(15,30))')
          .fontSize(20).margin(15).width('90%')
        Row() {
          Text('1')
            .size({ width: '15%', height: 50 })
            .backgroundColor('#ffdeb887')
            .border({ width: 1 })
            .fontSize(16)
            .textAlign(TextAlign.Center)

          Text('2 ' + (this.isOffsetUndefined ? '无offset' : 'offset(15,30)'))
            .size({ width: 120, height: 50 })
            .backgroundColor('#ffbbb2cb')
            .border({ width: 1 })
            .fontSize(16)
            .align(Alignment.Start)
            .id('MyText1')
            .offset(this.isOffsetUndefined ? undefined : { x: 15, y: 30 } as Position)

          Text('3')
            .size({ width: '15%', height: 50 })
            .backgroundColor('#ffdeb887')
            .border({ width: 1 })
            .fontSize(16)
            .textAlign(TextAlign.Center)
        }
        .width('90%')
        .height(100)
        .border({ width: 1, style: BorderStyle.Dashed })

      }

      List() {
        Text('padding-动态切换(undefined/padding(10))')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Row() {
          Row() {
            Row()
              .size({ width: '100%', height: '100%' })
              .backgroundColor(Color.Yellow)
          }
          .width(80)
          .height(80)
          .id('MyRow1')
          .padding(this.isPaddingUndefined ? undefined : ({ top: 5, left: 10, bottom: 15, right: 20 } as Padding))
          .margin(20)
          .backgroundColor(Color.White)
        }.backgroundColor(Color.Blue)
        .width('90%')

      }

      List() {
        Text('position-动态切换(undefined/position(30,10))')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Row() {
          Text('1').size({ width: '30%', height: '50' })
            .backgroundColor('#ffdeb887')
            .border({ width: 1 })
            .fontSize(16)
            .textAlign(TextAlign.Center)
          Text('2 ' + (this.isPositionUndefined ? '无position' : 'position(30,10)'))
            .size({ width: '60%', height: '30' })
            .backgroundColor('#ffbbb2cb')
            .border({ width: 1 })
            .fontSize(16)
            .align(Alignment.Start)
            .id('MyText2')
            .position(this.isPositionUndefined ? undefined : ({ x: 30, y: 10 } as Position))
        }.width('90%').height(100).border({ width: 1, style: BorderStyle.Dashed })
      }

      List() {
        Text(`pixelRound-动态切换(undefined/NO_FORCE_ROUND) 宽度:${this.curWidth.toFixed(1)}px`)
          .fontSize(20)
          .margin(15)
          .width('90%')
        Row() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('rgb(255, 255, 0)')
            .pixelRound(this.isPixelRoundUndefined ? undefined : ({
              start: PixelRoundCalcPolicy.FORCE_CEIL,
              end: PixelRoundCalcPolicy.FORCE_CEIL
            } as PixelRoundPolicy))
        }
        .id('MyRow2')
        .width(`${this.curWidth}px`)
        .height('300.6px')
        .backgroundColor('rgb(255, 0, 0)')
        .pixelRound(this.isPixelRoundUndefined ? undefined : ({
          start: PixelRoundCalcPolicy.FORCE_CEIL,
          end: PixelRoundCalcPolicy.FORCE_CEIL
        } as PixelRoundPolicy))
      }
    }
    .width('100%')
    .padding(10)
    .margin(25)
  }
}