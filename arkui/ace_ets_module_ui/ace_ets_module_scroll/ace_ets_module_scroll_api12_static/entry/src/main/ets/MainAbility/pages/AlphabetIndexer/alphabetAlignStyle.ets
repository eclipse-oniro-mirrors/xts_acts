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
  Row,
  List,
  ListItem,
  Text,
  Direction,
  IndexerAlign,
  Column,
  Button,
  Stack,
  Margin,
  Alignment,
  ForEach,
  AlphabetIndexer,
  ClickEvent,
  Color,
  TextAlign,
  FontWeight,
  BlurStyle,
  FontStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AlphabetAlignStyle {
  private arrayA: string[] = ['安']
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙']
  private arrayC: string[] = ['曹', '成', '陈', '催']
  private arrayL: string[] = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢']
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z']
  @State currentDirection?: Direction = Direction.Ltr
  @State indexerAlign: IndexerAlign = IndexerAlign.Left

  build() {
    Column() {
      Row() {
        Button('Auto').id('Auto')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.currentDirection = Direction.Auto
          }).backgroundColor(this.currentDirection == Direction.Auto ? Color.Red : Color.Blue)
        Button('Rtl').id('Rtl')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.currentDirection = Direction.Rtl
          }).backgroundColor(this.currentDirection == Direction.Rtl ? Color.Red : Color.Blue)
        Button('Ltr').id('Ltr')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.currentDirection = Direction.Ltr
          }).backgroundColor(this.currentDirection == Direction.Ltr ? Color.Red : Color.Blue)
      }.margin({
        top: 8
      } as Margin)

      Row() {
        Button('START').id('START')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.indexerAlign = IndexerAlign.START
          }).backgroundColor(this.indexerAlign == IndexerAlign.START ? Color.Red : Color.Blue)
        Button('END').id('END')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.indexerAlign = IndexerAlign.END
          }).backgroundColor(this.indexerAlign == IndexerAlign.END ? Color.Red : Color.Blue)
      }
      .margin({
        top: 8,
        bottom: 8
      } as Margin)

      Stack({ alignContent: Alignment.Start }) {
        Row() {
          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arrayA, (item: string) => {
              ListItem() {
                Text(item)
                  .width('80%')
                  .height('5%')
                  .fontSize(30)
                  .textAlign(TextAlign.Center)
              }
            }, (item: string) => item)

            ForEach(this.arrayB, (item: string) => {
              ListItem() {
                Text(item)
                  .width('80%')
                  .height('5%')
                  .fontSize(30)
                  .textAlign(TextAlign.Center)
              }
            }, (item: string) => item)

            ForEach(this.arrayC, (item: string) => {
              ListItem() {
                Text(item)
                  .width('80%')
                  .height('5%')
                  .fontSize(30)
                  .textAlign(TextAlign.Center)
              }
            }, (item: string) => item)

            ForEach(this.arrayL, (item: string) => {
              ListItem() {
                Text(item)
                  .width('80%')
                  .height('5%')
                  .fontSize(30)
                  .textAlign(TextAlign.Center)
              }
            }, (item: string) => item)
          }
          .width('50%')
          .height('100%')

          AlphabetIndexer({ arrayValue: this.value, selected: 0 })
            .direction(this.currentDirection)
            .id('alphabet_alignStyle')
            .autoCollapse(false)
            .selectedColor(0xFFFFFF)
            .popupColor(0xFFFAF0)
            .selectedBackgroundColor(0xCCCCCC)
            .popupBackground(0xD2B48C)
            .usingPopup(true)
            .selectedFont({ size: 16, weight: FontWeight.Bolder })
            .popupFont({ size: 30, weight: FontWeight.Bolder })
            .itemSize(28)
            .alignStyle(this.indexerAlign, 0)
            .popupItemBorderRadius(24)
            .itemBorderRadius(14)
            .popupPosition({ x: '30%', y: '10%' })
            .popupBackgroundBlurStyle(BlurStyle.NONE)
            .popupTitleBackground(0xCCCCCC)
            .popupSelectedColor(0x00FF00)
            .popupUnselectedColor(0x0000FF)
            .popupItemFont({ size: 30, style: FontStyle.Normal })
            .popupItemBackgroundColor(0xCCCCCC)
            .onSelect((index: int): void => {
              console.info(this.value[index.toInt()] + ' Selected!')
            })
            .onRequestPopupData((index: int): string[] => {
              if (this.value[index.toInt()] == 'A') {
                return this.arrayA
              } else if (this.value[index.toInt()] == 'B') {
                return this.arrayB
              } else if (this.value[index.toInt()] == 'C') {
                return this.arrayC
              } else if (this.value[index.toInt()] == 'L') {
                return this.arrayL
              } else {
                return ['']
              }
            })
            .onPopupSelect((index: int): void => {
              console.info('onPopupSelected:' + index)
            })
        }
        .width('100%')
      }
      .flexShrink(1)
    }
    .width('100%')
    .height('100%')
  }
}