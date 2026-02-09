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
struct RelativeChain9 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: string = '25%'
  @State RelativeHeight: string = '25%'

  build() {
    Column() {
      // RelativeContainer 组件宽高自适应
      RelativeContainer() {
        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow9_2", align : HorizontalAlign.Start},
            center: {anchor: "__container__", align: VerticalAlign.Center}
          })
          .id("RelativeChainRow9_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeChainRow9_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow9_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeChainRow9_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow9_2")

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeChainRow9_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeChainRow9_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow9_3")
      }
      .id('RelativeChain9')
      .width('auto').height('45%')
      .backgroundColor(Color.Grey)

      Column() {
        RelativeContainer() {
          Row().width(this.RelativeWidth).height(this.RelativeHeight)
            .backgroundColor("#FF3333")
            .alignRules({
              left: {anchor: "__container__", align: HorizontalAlign.Start},
              right: {anchor: "RelativeChainRow92_2", align : HorizontalAlign.Start},
              center: {anchor: "__container__", align: VerticalAlign.Center}
            })
            .id("RelativeChainRow92_1")
            .chainMode(Axis.Horizontal, this.RelativeChain)

          Row().width(this.RelativeWidth).height(this.RelativeHeight)
            .backgroundColor("#FFCC00")
            .alignRules({
              left: {anchor: "RelativeChainRow92_1", align: HorizontalAlign.End},
              right: {anchor: "RelativeChainRow92_3", align : HorizontalAlign.Start},
              top: {anchor: "RelativeChainRow92_1", align: VerticalAlign.Top}
            })
            .id("RelativeChainRow92_2")

          Row().width(this.RelativeWidth).height(this.RelativeHeight)
            .backgroundColor("#FF6633")
            .alignRules({
              left: {anchor: "RelativeChainRow92_2", align: HorizontalAlign.End},
              right: {anchor: "__container__", align : HorizontalAlign.End},
              top: {anchor: "RelativeChainRow92_1", align: VerticalAlign.Top}
            })
            .id("RelativeChainRow92_3")
        }
        .id('RelativeChain92')
        .width('90%').height('auto')
        .backgroundColor(Color.Pink)
      }.height('45%')
    }
    .height('100%')
  }
}