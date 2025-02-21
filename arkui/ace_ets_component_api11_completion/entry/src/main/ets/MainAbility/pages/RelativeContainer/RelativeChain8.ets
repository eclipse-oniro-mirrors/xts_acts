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
struct RelativeChain8 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD_INSIDE
  @State RelativeWidth: number = 100
  @State RelativeHeight: number = 100
  @State text: string = ''

  build() {
    Column() {
      // no set width and height
      RelativeContainer() {
        Row().width(this.RelativeWidth)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow8_2", align : HorizontalAlign.Start},
            center: {anchor: "__container__", align: VerticalAlign.Center}
          })
          .id("RelativeChainRow8_1")
          .chainMode(Axis.Vertical, this.RelativeChain)
          .onClick(() => {
            this.text = 'show'
          })

        Row().width(this.RelativeWidth)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeChainRow8_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow8_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeChainRow8_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow8_2")
          .onClick(() => {
            this.text = 'show'
          })

        Row().width(this.RelativeWidth)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeChainRow8_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeChainRow8_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow8_3")
          .onClick(() => {
            this.text = 'show'
          })
      }
      .id('RelativeChain8')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row().height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow82_2", align : HorizontalAlign.Start},
            center: {anchor: "__container__", align: VerticalAlign.Center}
          })
          .id("RelativeChainRow82_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD)
          .onClick(() => {
            this.text = 'show'
          })

        Row().height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeChainRow82_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow82_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeChainRow82_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow82_2")
          .onClick(() => {
            this.text = 'show'
          })

        Row().height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeChainRow82_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeChainRow82_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow82_3")
          .onClick(() => {
            this.text = 'show'
          })
      }
      .id('RelativeChain82')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      Text(this.text).key('RelativeChain8Text').height(50).width('100%')

    }
    .height('100%')
  }
}