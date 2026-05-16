'use static';
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Row,
  Text,
  Button,
  WaterFlow,
  FlowItem,
  LazyForEach,
  FontWeight,
  ClickEvent,
  $r,
  Margin,
  Color,
  TextAlign
} from '@ohos.arkui.component'
import { State, AppStorage, Consume, Provide } from '@ohos.arkui.stateManagement';
import { LengthMetrics } from '@kit.ArkUI'
import { MyDataSource } from '../data/LazyData'

@Entry
@Component
struct WaterFlowEmptyLazyComponent {
  private dataSource: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 50; i++) {
      list.push(i);
    }
    this.dataSource = new MyDataSource(list)
  }

  build() {
    Column() {
      WaterFlow() {
        LazyForEach(this.dataSource, (data: number, index: int) => {
          if (index == 7) {

          } else {
            FlowItem() {
              Text(`Item: ${data}`)
            }
            .id('waterFlow_emptyLazy_true_' + data)
            .width('100%')
            .height('20%')
            .backgroundColor(0xF5CF53)
          }
        }, (item: number) => item.toString())
      }
      .id('waterFlow_emptyLazy_true')
      .supportEmptyBranchInLazyLoading(true)
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(5)
      .width('80%')
      .height('30%')
      .backgroundColor(0xDCDCDC)
      .borderWidth(1)
      .margin(5)

      WaterFlow() {
        LazyForEach(this.dataSource, (data: number, index: int) => {
          if (index == 7) {

          } else {
            FlowItem() {
              Text(`Item: ${data}`)
            }
            .id('waterFlow_emptyLazy_false_' + data)
            .width('100%')
            .height('20%')
            .backgroundColor(0xF5CF53)
          }
        }, (item: number) => item.toString())
      }
      .id('waterFlow_emptyLazy_false')
      .supportEmptyBranchInLazyLoading(false)
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(5)
      .width('80%')
      .height('30%')
      .backgroundColor(0xDCDCDC)
      .borderWidth(1)
      .margin(5)

      WaterFlow() {
        LazyForEach(this.dataSource, (data: number, index: int) => {
          if (index == 7) {

          } else {
            FlowItem() {
              Text(`Item: ${data}`)
            }
            .id('waterFlow_emptyLazy_undefined_' + data)
            .width('100%')
            .height('20%')
            .backgroundColor(0xF5CF53)
          }
        }, (item: number) => item.toString())
      }
      .id('waterFlow_emptyLazy_undefined')
      .supportEmptyBranchInLazyLoading(undefined)
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(5)
      .width('80%')
      .height('30%')
      .backgroundColor(0xDCDCDC)
      .borderWidth(1)
      .margin(5)
    }
    .height('80%')
    .width('100%')
  }
}