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
import { LengthMetrics } from '@kit.ArkUI'
import { MyDataSource } from './MyDataSource'

@Entry
@Component
struct LazyVGridLayoutGapNullUndefinedExample {
  private arr1: MyDataSource<number> = new MyDataSource<number>();
  private arr2: MyDataSource<number> = new MyDataSource<number>();
  private arr3: MyDataSource<number> = new MyDataSource<number>();

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr1.pushData(i);
      this.arr2.pushData(i);
      this.arr3.pushData(i);
    }
  }

  build() {
    Column() {
      // ========== columnsGap tests (LengthMetrics) ==========
      Text('columnsGap')
      WaterFlow() {
        LazyVGridLayout() {
          LazyForEach(this.arr1, (item: number) => {
            Text('item_' + item.toString())
              .width('100%')
              .height('30%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate('1fr 1fr')
        .id('lazyVGrid_columnsGap_default')
        .backgroundColor(0xF0F0F0)
        .height('30%')

        LazyVGridLayout() {
          LazyForEach(this.arr2, (item: number) => {
            Text('item1_' + item.toString())
              .width('100%')
              .height('30%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(null)
        .id('lazyVGrid_columnsGap_null')
        .backgroundColor('#FFF000')
        .height('30%')

        LazyVGridLayout() {
          LazyForEach(this.arr3, (item: number) => {
            Text('item2_' + item.toString())
              .width('100%')
              .height('30%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(undefined)
        .id('lazyVGrid_columnsGap_undefined')
        .backgroundColor(0xF0F0F0)
        .height('30%')
      }
      .padding(10)
      .rowsGap(10)
      .height('40%')

      // ========== rowsGap tests (LengthMetrics) ==========
      Text('rowsGap')
      WaterFlow() {
        LazyVGridLayout() {
          LazyForEach(this.arr1, (item: number) => {
            Text('item_' + item.toString())
              .width('100%')
              .height('30%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate('1fr 1fr')
        .id('lazyVGrid_rowsGap_default')
        .backgroundColor(0xF0F0F0)
        .height('30%')

        LazyVGridLayout() {
          LazyForEach(this.arr2, (item: number) => {
            Text('item1_' + item.toString())
              .width('100%')
              .height('30%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap(null)
        .id('lazyVGrid_rowsGap_null')
        .backgroundColor('#FFF000')
        .height('30%')

        LazyVGridLayout() {
          LazyForEach(this.arr3, (item: number) => {
            Text('item2_' + item.toString())
              .width('100%')
              .height('30%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap(undefined)
        .id('lazyVGrid_rowsGap_undefined')
        .backgroundColor(0xF0F0F0)
        .height('30%')
      }
      .padding(10)
      .rowsGap(10)
      .height('40%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#DCDCDC')
    .padding({ top: 5 })
  }
}