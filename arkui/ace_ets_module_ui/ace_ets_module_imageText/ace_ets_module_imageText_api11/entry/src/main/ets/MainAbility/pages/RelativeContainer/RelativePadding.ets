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
@Entry
@Component
struct RelativePadding {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativePad: number = 0

  build() {
    Column() {
      RelativeContainer() {
        Row().width(50).height(50)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "guideLine1", align: HorizontalAlign.Start},
            right: {anchor: "RelativePaddingRow_2", align : HorizontalAlign.Start}
          })
          .id("RelativePaddingRow_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(50).height(50)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativePaddingRow_1", align: HorizontalAlign.End},
            right: {anchor: "RelativePaddingRow_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativePaddingRow_1", align: VerticalAlign.Top}
          })
          .id("RelativePaddingRow_2")

        Row().width(50).height(50)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativePaddingRow_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativePaddingRow_1", align: VerticalAlign.Top}
          })
          .id("RelativePaddingRow_3")
      }
      .id('RelativePadding')
      .width(400).height(400)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)
      .padding({ top: this.RelativePad })
      .guideLine([
        {id:"guideLine1", direction: Axis.Vertical, position: { start: 50 }}
      ])

      Button('padding 50').onClick((event: ClickEvent) => {
        this.RelativePad = 50
      }).key('addPad')

    }
    .height('100%')
  }
}
