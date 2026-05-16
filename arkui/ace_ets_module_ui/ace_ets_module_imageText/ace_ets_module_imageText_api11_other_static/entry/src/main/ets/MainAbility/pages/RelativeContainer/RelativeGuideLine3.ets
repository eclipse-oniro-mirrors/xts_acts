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
  AlignRuleOption,
  GuideLinePosition,
  Dimension
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

interface linePosition {
  start?: Dimension,
  end?: Dimension
}

@Entry
@Component
struct RelativeGuideLine3 {
  @State RelWidth: string = '70%'
  @State guideLineDir1: Axis = Axis.Horizontal
  @State buttonAlign: VerticalAlign = VerticalAlign.Top
  @State buttonPosition: Axis = Axis.Horizontal
  @State anchor1: string = 'guideLine1'
  @State linePosition: GuideLinePosition = { start: 50, end: 50 } as GuideLinePosition

  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .width(50)
          .height(50)
          .alignRules({
            top: { anchor: "guideLine1", align: this.buttonAlign },
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton3')
          .id('RelButton3')

      }
      .key('RelativeGuideLine3')
      .width('70%')
      .height('60%')
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)
      .guideLine([
        { id: "guideLine1", direction: this.guideLineDir1, position: this.linePosition }
      ])

      Row() {

        Button('delPos').onClick((e: ClickEvent) => {
          this.linePosition = {}
        }).key('delPos').id('delPos')

        Button('changeVer').onClick((e: ClickEvent) => {
          this.guideLineDir1 = Axis.Vertical
        }).key('changeVer').id('changeVer')

        Button('changeHor').onClick((e: ClickEvent) => {
          this.guideLineDir1 = Axis.Horizontal
        }).key('changeHor').id('changeHor')

      }.height('10%')
    }
    .height('100%')
  }
}