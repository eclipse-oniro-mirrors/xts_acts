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
struct RelativeChain4 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State text: string = ''

  build() {
    Column() {
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow4_2", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow4_1")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })


        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow4_1", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow4_3", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow4_2")
          .chainMode(Axis.Horizontal, this.RelativeChain)
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow4_2", align: HorizontalAlign.Start },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          } as AlignRuleOption)
          .id("RelativeChainRow4_3")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })
      }
      .id('RelativeChain4')
      .width(300)
      .height(200)
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow42_2", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow42_1")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })


        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow42_1", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow42_3", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow42_2")
          .chainMode(Axis.Horizontal, this.RelativeChain)
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow42_2", align: HorizontalAlign.Start },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          } as AlignRuleOption)
          .id("RelativeChainRow42_3")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })
      }
      .id('RelativeChain42')
      .width(300)
      .height(200)
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)

      Text(this.text).key('RelativeChainText').height(50).width('100%')

    }
    .height('100%')
  }
}