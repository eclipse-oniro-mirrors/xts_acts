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
  Dimension,
  GuideLinePosition
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

interface linePosition1 {
  start?: Dimension,
  end?: Dimension
}

@Entry
@Component
struct RelativeGuideLine {
  @State RelWidth: string = '70%'
  @State guideLineDir1: Axis = Axis.Horizontal
  @State guideLineDir2: Axis = Axis.Vertical
  @State buttonAlign: VerticalAlign = VerticalAlign.Top
  @State buttonPosition: Axis = Axis.Horizontal
  @State anchor1: string = 'guideLine1'
  @State anchor2: string = 'guideLine1'
  @State linePosition: GuideLinePosition = { start: 50 } as GuideLinePosition

  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .width(50)
          .height(50)
          .alignRules({
            top: { anchor: this.anchor1, align: this.buttonAlign },
            left: { anchor: this.anchor2, align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton')
      }
      .key('RelativeGuideLine1')
      .width(this.RelWidth)
      .height('60%')
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)
      .guideLine([
        { id: "guideLine1", direction: this.guideLineDir1, position: this.linePosition },
        { id: "guideLine2", direction: this.guideLineDir2, position: this.linePosition }
      ])


      Column() {
        Row() {
          // start
          Button('changeDir').onClick((e: ClickEvent) => {
            this.guideLineDir1 = Axis.Vertical
          }).id('changeDir')

          Button('changeId').onClick((e: ClickEvent) => {
            this.guideLineDir1 = Axis.Horizontal
            this.guideLineDir2 = Axis.Vertical
            this.anchor2 = 'guideLine2'
          }).key('changeId').id('changeId')
        }.height('20%')

        Row() {
          Button('allNoSet').onClick((e: ClickEvent) => {
            this.anchor2 = 'guideLine1'
            this.linePosition = {}
          }).key('allNoSet').id('allNoSet')

          Button('setStartVp').onClick((e: ClickEvent) => {
            this.anchor2 = 'guideLine1'
            this.guideLineDir1 = Axis.Horizontal
            this.linePosition = { start: 50 }
          }).key('setStartVp').id('setStartVp')
        }.height('20%')

        Row() {
          Button('setStartPx').onClick((e: ClickEvent) => {
            this.anchor2 = 'guideLine1'
            this.guideLineDir1 = Axis.Horizontal
            this.linePosition = { start: '50px' }
          }).key('setStartPx').id('setStartPx')


          Button('setStartLpx').onClick((e: ClickEvent) => {
            this.anchor2 = 'guideLine1'
            this.guideLineDir1 = Axis.Horizontal
            this.linePosition = { start: '50lpx' }
          }).key('setStartLpx').id('setStartLpx')

          Button('setStartPer').onClick((e: ClickEvent) => {
            this.anchor2 = 'guideLine1'
            this.guideLineDir1 = Axis.Horizontal
            this.linePosition = { start: '50%' }
          }).key('setStartPer').id('setStartPer')
        }.height('20%')

        Row() {
          Button('setStartRes').onClick((e: ClickEvent) => {
            this.anchor2 = 'guideLine1'
            this.guideLineDir1 = Axis.Horizontal
            this.linePosition = { start: $r('app.string.start_50') }
          }).key('setStartRes').id('setStartRes')

          Button('changeWidth').onClick((e: ClickEvent) => {
            this.RelWidth = 'auto'
            this.guideLineDir1 = Axis.Vertical
            this.linePosition = { start: 50 }
          }).key('changeWidth').id('changeWidth')

          Button('start 50%').onClick((e: ClickEvent) => {
            this.RelWidth = 'auto'
            this.guideLineDir1 = Axis.Vertical
            this.linePosition = { start: '50%' }
          }).key('changeWidth2').id('changeWidth2')
        }.height('20%')

        Row() {
          Button('end 50').onClick((e: ClickEvent) => {
            this.RelWidth = 'auto'
            this.guideLineDir1 = Axis.Vertical
            this.linePosition = { end: 50 }
          }).key('changeWidth3').id('changeWidth3')

          Button('start 80').onClick((e: ClickEvent) => {
            this.RelWidth = '300'
            this.guideLineDir1 = Axis.Horizontal
            this.linePosition = { start: 80 }
          }).key('changeStart4').id('changeStart4')
        }.height('20%')
      }.height('10%')
    }
    .height('100%')
  }
}