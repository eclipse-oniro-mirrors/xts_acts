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
  SwiperController,
  Column,
  Text,
  LazyForEach,
  Margin,
  IDataSource,
  DataChangeListener,
  DotIndicator,
  ColumnOptions,
  Swiper,
  TextAlign,
  Color,
  EdgeEffect,
  Visibility,
  ClickEvent,
  SwiperDisplayMode,
  SwiperAnimationEvent,
  Row,
  RowOptions,
  Button,
  Curve,
  SwiperAnimationEvent,
  HorizontalAlign,
  ArrowStyle,
  SwiperAutoFill,
  Padding,
  Indicator,
  FontWeight,
  Flex,
  FlexAlign,
  List,
  ListItem,
  $r,
  Alignment,
  TextOverflow,
  SwiperAutoFill
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MyDataSourceSwiper07 implements IDataSource<string> {
  private list: string[] = []
  private listener?: DataChangeListener = undefined

  constructor(list: string[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): string {
    return this.list[index as int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

@Entry
@Component
struct Swiper07 {
  private swiperController: SwiperController = new SwiperController();
  private data: MyDataSourceSwiper07 = new MyDataSourceSwiper07([]);
  @State mywidth: number = 400;
  @State myheight: number = 400;
  @State displaycount: number = 1;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6] as number[];
  @State numberStr: String[] = [
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15',
    '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30'
  ];

  aboutToAppear(): void {
    let list: string[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSourceSwiper07(list)
  }

  build() {
    Column() {
      Swiper(this.swiperController) {
        Text('1')
          .width(150)
          .height(80)
          .backgroundColor(0xAAAAAA)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('2')
          .width(150)
          .height(80)
          .backgroundColor(0xEEEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('3')
          .width(150)
          .height(80)
          .backgroundColor(0xCCCCCC)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('4')
          .width(150)
          .height(80)
          .backgroundColor(0xA11111)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('5')
          .width(150)
          .height(80)
          .backgroundColor(0xBBBBBB)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('6')
          .width(150)
          .height(80)
          .backgroundColor(0x233456)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true, undefined)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .key("ArkUX_Grid_List_Swiper_0300")
      .displayCount({ minSize: '200vp' } as SwiperAutoFill)
      .border({ color: Color.White, width: 10 })

      //      .arrowSize(200)

      Swiper(this.swiperController) {

        Text('1')
          .width(150)
          .height(80)
          .backgroundColor(0xAAAAAA)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('2')
          .width(150)
          .height(80)
          .backgroundColor(0xEEEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('3')
          .width(150)
          .height(80)
          .backgroundColor(0xCCCCCC)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('4')
          .width(150)
          .height(80)
          .backgroundColor(0xA11111)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('5')
          .width(150)
          .height(80)
          .backgroundColor(0xBBBBBB)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('6')
          .width(150)
          .height(80)
          .backgroundColor(0x233456)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true, undefined)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .key("ArkUX_Grid_List_Swiper_0310")
      .displayCount({ minSize: '100vp' } as SwiperAutoFill)

      Swiper(this.swiperController) {

        Text('1')
          .width(150)
          .height(80)
          .backgroundColor(0xAAAAAA)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('2')
          .width(150)
          .height(80)
          .backgroundColor(0xEEEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('3')
          .width(150)
          .height(80)
          .backgroundColor(0xCCCCCC)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('4')
          .width(150)
          .height(80)
          .backgroundColor(0xA11111)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('5')
          .width(150)
          .height(80)
          .backgroundColor(0xBBBBBB)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('6')
          .width(150)
          .height(80)
          .backgroundColor(0x233456)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true, undefined)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .key("ArkUX_Grid_List_Swiper_0320")

      .displayCount(undefined)

      Swiper(this.swiperController) {

        Text('1')
          .width(150)
          .height(80)
          .backgroundColor(0xAAAAAA)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('2')
          .width(150)
          .height(80)
          .backgroundColor(0xEEEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('3')
          .width(150)
          .height(80)
          .backgroundColor(0xCCCCCC)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('4')
          .width(150)
          .height(80)
          .backgroundColor(0xA11111)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('5')
          .width(150)
          .height(80)
          .backgroundColor(0xBBBBBB)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('6')
          .width(150)
          .height(80)
          .backgroundColor(0x233456)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true, undefined)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .key("ArkUX_Grid_List_Swiper_0330")
      .displayCount({ minSize: '500vp' } as SwiperAutoFill)

      Swiper(this.swiperController) {

        Text('1')
          .width(150)
          .height(80)
          .backgroundColor(0xAAAAAA)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('2')
          .width(150)
          .height(80)
          .backgroundColor(0xEEEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('3')
          .width(150)
          .height(80)
          .backgroundColor(0xCCCCCC)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('4')
          .width(150)
          .height(80)
          .backgroundColor(0xA11111)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('5')
          .width(150)
          .height(80)
          .backgroundColor(0xBBBBBB)
          .textAlign(TextAlign.Center)
          .fontSize(30)
        Text('6')
          .width(150)
          .height(80)
          .backgroundColor(0x233456)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true, undefined)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .key("ArkUX_Grid_List_Swiper_0340")
      .displayCount({ minSize: '0vp' } as SwiperAutoFill)
    }.width(this.mywidth).backgroundColor(0xEEEEEE).margin({ top: 5 } as Margin)
    .height(this.myheight)
  }
}