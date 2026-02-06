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

@Entry
@Component
struct DataPanelCloseEffectDemo {
  @State closeEffectValue: boolean | null | undefined = false;
  public valueArr: number[] = [20, 20, 20, 20];

  build() {
    Column({ space: 20 }) {
      Text('DataPanel CloseEffect Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // 测试 closeEffect 属性
      DataPanel({ values: this.valueArr, max: 100, type: DataPanelType.Circle })
        .width(200)
        .height(200)
        .closeEffect(this.closeEffectValue)
        .key('dataPanelCloseEffectTest')

      Row({ space: 10 }) {
        Button('Set false')
          .onClick(() => {
            this.closeEffectValue = false;
          })
        Button('Set true')
          .onClick(() => {
            this.closeEffectValue = true;
          })
        Button('Set null')
          .onClick(() => {
            this.closeEffectValue = null;
          })
        Button('Set undefined')
          .onClick(() => {
            this.closeEffectValue = undefined;
          })
      }
      .margin({ top: 20 })

      Text(`Current closeEffect value: ${JSON.stringify(this.closeEffectValue)}`)
        .fontSize(16)
        .margin({ top: 20 })

      // 测试 null 值的 DataPanel
      Text('DataPanel with closeEffect(null)')
        .fontSize(16)
        .margin({ top: 20 })
      DataPanel({ values: [10, 20, 30], max: 100, type: DataPanelType.Circle })
        .width(150)
        .height(150)
        .closeEffect(null)
        .key('dataPanelCloseEffectNull')

      // 测试 undefined 值的 DataPanel
      Text('DataPanel with closeEffect(undefined)')
        .fontSize(16)
        .margin({ top: 20 })
      DataPanel({ values: [15, 25, 35], max: 100, type: DataPanelType.Circle })
        .width(150)
        .height(150)
        .closeEffect(undefined)
        .key('dataPanelCloseEffectUndefined')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
