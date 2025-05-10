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
struct RelativeChain10 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: number = 50
  @State RelativeHeight: string = '50%'

  build() {
    Column() {
      // 子组件总宽度超过容器宽度
      RelativeContainer() {
        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow10_2", align : HorizontalAlign.Start},
            center: {anchor: "__container__", align: VerticalAlign.Center},
            bias: {horizontal: 0.3}
          })
          .id("RelativeChainRow10_1")
          .chainMode(Axis.Horizontal, ChainStyle.PACKED)

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeChainRow10_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow10_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeChainRow10_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow10_2")

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeChainRow10_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeChainRow10_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow10_3")
      }
      .id('RelativeChain10')
      .width(100).height('40%')
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow102_2", align : HorizontalAlign.Start},
            center: {anchor: "__container__", align: VerticalAlign.Center}
          })
          .id("RelativeChainRow102_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeChainRow102_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow102_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeChainRow102_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow102_2")

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeChainRow102_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeChainRow102_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow102_3")
      }
      .id('RelativeChain102')
      .width(100).height('40%')
      .backgroundColor(Color.Grey)

      Button('SPREAD_INSIDE')
        .key('RelativeChain10Bt_1')
        .onClick(() => {
          this.RelativeChain = ChainStyle.SPREAD_INSIDE
        })


    }
    .height('100%')
  }
}