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
struct LazyVGridLayoutColumnsTemplateNullUn {
  private arr1: MyDataSource<number> = new MyDataSource<number>();
  private arr2: MyDataSource<number> = new MyDataSource<number>();
  private arr3: MyDataSource<number> = new MyDataSource<number>();
  private arr4: MyDataSource<number> = new MyDataSource<number>();

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr1.pushData(i);
      this.arr2.pushData(i);
      this.arr3.pushData(i);
      this.arr4.pushData(i);
    }
  }

  build() {
    Column() {
      // ========== columnsTemplate tests (string) ==========
      Text('columnsTemplate')
      WaterFlow() {
        LazyVGridLayout() {
          LazyForEach(this.arr1, (item: number) => {
            Text('item_' + item.toString())
              .width('100%')
              .height('20%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .id('lazyVGrid_columnsTemplate_default')
        .backgroundColor(0xF0F0F0)
        .height('20%')
        .margin(5)

        LazyVGridLayout() {
          LazyForEach(this.arr2, (item: number) => {
            Text('item1_' + item.toString())
              .width('100%')
              .height('20%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate('')
        .id('lazyVGrid_columnsTemplate_emptyString')
        .backgroundColor('#FFF000')
        .height('20%')
        .margin(5)

        LazyVGridLayout() {
          LazyForEach(this.arr3, (item: number) => {
            Text('item2_' + item.toString())
              .width('100%')
              .height('20%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate(null)
        .id('lazyVGrid_columnsTemplate_null')
        .backgroundColor(0xF0F0F0)
        .height('20%')
        .margin(5)

        LazyVGridLayout() {
          LazyForEach(this.arr4, (item: number) => {
            Text('item3_' + item.toString())
              .width('100%')
              .height('20%')
              .borderRadius(5)
              .textAlign(TextAlign.Center)
          })
        }
        .columnsTemplate(undefined)
        .id('lazyVGrid_columnsTemplate_undefined')
        .backgroundColor('#FFF000')
        .height('20%')
        .margin(5)
      }
      .padding(10)
      .rowsGap(10)
      .height('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#DCDCDC')
    .padding({ top: 5 })
  }
}