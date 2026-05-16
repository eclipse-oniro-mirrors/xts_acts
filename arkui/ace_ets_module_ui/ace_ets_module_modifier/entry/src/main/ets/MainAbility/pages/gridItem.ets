/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { GridItemModifier } from "@ohos.arkui.modifier";

class CustomModifier extends GridItemModifier {
  applyGridItemAttribute(instance: GridItemAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.rowStart(2)
  }
}

@Entry
@Component
struct GridItemOnSelect {
  @State customModifier: GridItemModifier = new CustomModifier()
    .selected(true)
    .rowStart(1)
    .rowEnd(12)
    .columnStart(1)
    .columnEnd(12)
    .selectable(true)

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

        Text("gridItem-OnSelect")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("onSelectText")

        Column({ space: 5 }) {
          Grid() {
            GridItem() {
              Text('Grid Item Test')
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
                .key("onSelected")
            }
            .key("GridItemKey1")
            .attributeModifier(this.customModifier as CustomModifier)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .height(300)
        }
      }
      .width("100%")
      .height("100%")
    }
    .width('100%')
  }
}

