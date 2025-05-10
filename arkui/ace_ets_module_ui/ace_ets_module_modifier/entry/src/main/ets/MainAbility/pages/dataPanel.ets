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
import { DataPanelModifier } from "@ohos.arkui.modifier";

class CustomModifier extends DataPanelModifier {
  applyNormalAttribute(instance: DataPanelAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.strokeWidth(5)
  }
}

@Entry
@Component
struct dataPanel_testcase {
  @State myWidth: string = "200"
  @State myHeight: string = "100"
  @State active: boolean = false
  private content: string = "DataPanel Page"
  @State customModifier: DataPanelModifier = new CustomModifier()
        .trackShadow({ radius: 6, offsetX: 2, offsetY: 1 })
        .strokeWidth(25)
        .trackBackgroundColor('#08182431')
        .valueColors(['#FF123456', '#FF654321'])
        .closeEffect(true)


  onPageShow() {
    console.info('Blank page show called');
  }

  onBuildDone() {
    console.info('Blank page build done called');
  }

  build() {
    Column({ space: 5 }) {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text(`${this.content}`)
          .fontSize(50)
        Button("change value").onClick(() => {
          (this.customModifier as CustomModifier).onChange1();
        }).key("changeButton")
        DataPanel({ values: [20, 40, 20], max: 100, type: DataPanelType.Line })
          .width(this.myWidth)
          .height(this.myHeight)
          .key('DataPanelKey1')
          .attributeModifier(this.customModifier as CustomModifier)


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
}
