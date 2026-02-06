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
struct RelativeChain2 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeHeight: string = '20%'

  build() {
    Column() {
      RelativeContainer() {
        Row().width('50%').height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            bottom: {anchor: "RelativeChainRow2_2", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow2_1")
          .chainMode(Axis.Vertical, this.RelativeChain)

        Row().width('50%').height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "RelativeChainRow2_1", align: VerticalAlign.Bottom},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            bottom: {anchor: "RelativeChainRow2_3", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow2_2")

        Row().width('50%').height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "RelativeChainRow2_2", align: VerticalAlign.Bottom},
            left: {anchor: "__container__", align : HorizontalAlign.Start},
            bottom: {anchor: "__container__", align: VerticalAlign.Bottom}
          })
          .id("RelativeChainRow2_3")
      }
      .id('RelativeChain2')
      .width('80%').height('80%')
      .backgroundColor(Color.Grey)

      Row() {
        Button('SPREAD_INSIDE')
          .key('RelativeChain2Bt_1')
          .onClick(() => {
            this.RelativeChain = ChainStyle.SPREAD_INSIDE
          })
        Button('PACKED')
          .key('RelativeChain2Bt_2')
          .onClick(() => {
            this.RelativeChain = ChainStyle.PACKED
          })
      }
      Row() {
        Button('改变高度')
          .key('Relative2Height')
          .onClick(() => {
            this.RelativeChain = ChainStyle.SPREAD
            this.RelativeHeight = '30%'
          })
      }

    }
    .height('100%')
  }
}