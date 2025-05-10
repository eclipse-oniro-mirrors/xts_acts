/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

class DataPanelModifier1 implements AttributeModifier<DataPanelAttribute> {
  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance
      .trackShadow({ radius: 6, offsetX: 2, offsetY: 1 })
      .strokeWidth(25)
      .trackBackgroundColor('#08182431')
      .valueColors(['#FF123456', '#FF654321'])
      .closeEffect(true)
  }
}

@Entry
@Component
struct dataPanel_testcase {
  @State dataPanelModifier: DataPanelModifier1 = new DataPanelModifier1()
  @State myWidth: string = "200"
  @State myHeight: string = "100"
  @State active: boolean = false
  private content: string = "DataPanel Page"

  onPageShow() {
    console.info('Blank page show called');
  }

  onBuildDone() {
    console.info('Blank page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
      DataPanel({ values: [20, 40, 20], max: 100, type: DataPanelType.Line })
        .width(this.myWidth)
        .height(this.myHeight)
        .key('DataPanelKey1')
        .attributeModifier(this.dataPanelModifier)


      DataPanel({ values: [20, 40, 20], max: 100, type: DataPanelType.Circle })
        .width(this.myWidth)
        .height(this.myHeight)
        .key('DataPanel2')
        .closeEffect(true)

      DataPanel({ values: [20, 40, 20], max: 100 })
        .width(this.myWidth)
        .height(this.myHeight)
        .key('DataPanel3')
        .closeEffect(false)
    }
    .key('flex')
    .width('100%')
    .height('100%')

  }
}
