/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LengthMetrics } from '@ohos.arkui.node'
import { MyDataSource } from '../MyDataSource'

@Entry
@Component
struct LazyVGridLayoutSample1 {
  private arr:MyDataSource<number> = new MyDataSource<number>();

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.pushData(i);
    }
  }

  build() {
    Column() {
      WaterFlow() {
        LazyVGridLayout() {
          LazyForEach(this.arr, (item:number)=>{
            Text('item' + item.toString())
              .width('100%')
              .height('25%')
              .borderRadius(5)
              .backgroundColor(Color.Pink)
              .textAlign(TextAlign.Center)
          })
        }
        .id('LazyVGridLayout_key')
        .columnsTemplate('1fr 1fr')
        .rowsGap(LengthMetrics.vp(10))
        .columnsGap(LengthMetrics.vp(10))
      }.padding(10)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#DCDCDC')
  }
}