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
  IDataSource,
  DataChangeListener,
  SwiperController,
  Column,
  Grid,
  ForEach,
  Margin,
  GridItem,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MyDataSourceGrid implements IDataSource<string> {
  private list: string[] = [];
  private listener?: DataChangeListener = undefined;

  constructor(list: string[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): string {
    return this.list[index.toInt()]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct GridJC {
  private swiperController: SwiperController = new SwiperController();
  private data: MyDataSourceGrid = new MyDataSourceGrid([]);
  @State mywidth: number = 400;
  @State myheight: number = 400;
  @State displaycount: number = 1;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6] as number[]
  @State Number1: String[] = [
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15',
    '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30'
  ];

  aboutToAppear(): void {
    let list: string[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSourceGrid(list)
  }

  build() {
    Column() {
      Grid() {

        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (day: string) => day)

      }
      .key("ArkUX_Grid_List_Swiper_0200")
      .columnsTemplate("repeat(auto-fill, 88px)")
      .rowsTemplate("repeat(auto-fill, 88px)")
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)

      Grid() {

        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (day: string) => day)

      }
      .key("ArkUX_Grid_List_Swiper_0210")
      .columnsTemplate("repeat(auto-fill, 300vp)")
      .rowsTemplate("repeat(auto-fill, 50vp)")
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)

      Grid() {

        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (day: string) => day)

      }
      .key("ArkUX_Grid_List_Swiper_0220")
      .columnsTemplate(undefined)
      .rowsTemplate(undefined)
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)

      Grid() {

        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (day: string) => day)

      }
      .key("ArkUX_Grid_List_Swiper_0230")
      .columnsTemplate("repeat(auto-fill, 0)")
      .rowsTemplate("repeat(auto-fill, 0)")
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)

      Grid() {

        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (day: string) => day)

      }
      .key("ArkUX_Grid_List_Swiper_0240")
      .columnsTemplate("repeat(auto-fill, 20px)")
      .rowsTemplate("repeat(auto-fill, 600vp)")
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)

      Grid() {

        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (day: string) => day)

      }
      .key("ArkUX_Grid_List_Swiper_0350")
      .columnsTemplate("repeat(auto-fit, 88px)")
      .rowsTemplate("repeat(auto-fit, 88px)")
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)

      Grid() {

        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (day: string) => day)

      }
      .key("ArkUX_Grid_List_Swiper_0360")
      .columnsTemplate("repeat(auto-fit, 300vp)")
      .rowsTemplate("repeat(auto-fit, 50vp)")
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)
    }
    .width(this.mywidth)
    .backgroundColor(0xEEEEEE)
    .margin({ top: 5 } as Margin)
    .height(this.myheight)
  }
}