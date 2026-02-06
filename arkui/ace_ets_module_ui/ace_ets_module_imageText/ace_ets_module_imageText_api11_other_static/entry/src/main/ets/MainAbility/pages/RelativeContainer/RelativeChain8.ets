'use static';
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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  RelativeContainer,
  VerticalAlign,
  HorizontalAlign,
  BarrierDirection,
  ChainStyle,
  Axis,
  BarrierStyle,
  AlignRuleOption
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RelativeChain8 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD_INSIDE
  @State RelativeWidth: string = '30%'
  @State RelativeHeight: string = '30%'
  @State text: string = ''

  build() {
    Column() {
      // no set width and height
      RelativeContainer() {
        Row()
          .width(this.RelativeWidth)
          .backgroundColor("#FF3333")
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow8_2", align: HorizontalAlign.Start },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          } as AlignRuleOption)
          .id("RelativeChainRow8_1")
          .chainMode(Axis.Vertical, this.RelativeChain)
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .width(this.RelativeWidth)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: { anchor: "RelativeChainRow8_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow8_3", align: HorizontalAlign.Start },
            top: { anchor: "RelativeChainRow8_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow8_2")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .width(this.RelativeWidth)
          .backgroundColor("#FF6633")
          .alignRules({
            left: { anchor: "RelativeChainRow8_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End },
            top: { anchor: "RelativeChainRow8_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow8_3")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })
      }
      .id('RelativeChain8')
      .width('70%')
      .height('40%')
      .margin({ left: 5, top: 5 } as Margin)
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row()
          .height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow82_2", align: HorizontalAlign.Start },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          } as AlignRuleOption)
          .id("RelativeChainRow82_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD)
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: { anchor: "RelativeChainRow82_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow82_3", align: HorizontalAlign.Start },
            top: { anchor: "RelativeChainRow82_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow82_2")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: { anchor: "RelativeChainRow82_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End },
            top: { anchor: "RelativeChainRow82_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow82_3")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })
      }
      .id('RelativeChain82')
      .width('70%')
      .height('40%')
      .margin({ left: 5, top: 5 } as Margin)
      .backgroundColor(Color.Grey)

      Text(this.text).key('RelativeChain8Text').width('100%')

    }
    .height('100%')
  }
}