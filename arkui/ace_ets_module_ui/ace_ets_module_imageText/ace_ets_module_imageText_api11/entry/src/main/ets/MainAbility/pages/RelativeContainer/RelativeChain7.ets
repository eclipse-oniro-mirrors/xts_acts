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
struct RelativeChain7 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: number = 100
  @State RelativeHeight: number = 100

  build() {
    Column() {
      RelativeContainer() {
        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow7_2", align : HorizontalAlign.Start},
            center: {anchor: "__container__", align: VerticalAlign.Center}
          })
          .id("RelativeChainRow7_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeChainRow7_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow7_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeChainRow7_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow7_2")

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeChainRow7_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeChainRow7_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow7_3")
      }
      .id('RelativeChain7')
      .width(400).height(400)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      Row() {
        Button('SPREAD_INSIDE')
          .key('RelativeChainBt_1')
          .onClick(() => {
            this.RelativeChain = ChainStyle.SPREAD_INSIDE
          })
        Button('PACKED')
          .key('RelativeChainBt_2')
          .onClick(() => {
            this.RelativeChain = ChainStyle.PACKED
          })
        Button('改变宽度')
          .key('RelativeWidth')
          .onClick(() => {
            this.RelativeWidth = 70
          })
      }

      Row() {
        Button('改变高度')
          .key('RelativeHeight')
          .onClick(() => {
            this.RelativeHeight = 70
          })
      }


    }
    .height('100%')
  }
}