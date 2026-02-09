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
import { GlobalContext } from './../../common/GlobalContext';
import { ValueT } from './../../common/Value';
import { MessageManager, Callback, Message } from './../../common/MessageManager';
import { Entry, Component, LineCapStyle, Color,Length, Flex,Resource,ResourceColor, Row, Column, ClickEvent, FlexDirection, ItemAlign, FlexAlign, Text, Divider, Button, Margin } from '@ohos.arkui.component'
import { State,AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct DividerExample {
  @StoragePropRef('vertical') vertical:boolean = false
  @StoragePropRef('color') color:ResourceColor|undefined = Color.Red
  @StoragePropRef('strokeWidth') strokeWidth:number|string|undefined = 20 as number
  @StoragePropRef('lineCapStyle') lineCapStyle: LineCapStyle = LineCapStyle.Butt
  @StoragePropRef('widthK') widthK: undefined|string|number|Resource = 0 as number

  build() {
    Column() {
      
      Text('Vertical divider').fontSize(9).fontColor(0xCCCCCC)
      Column() {
        Column() {
          Row().width(288).height(64).backgroundColor('#30C9F0').opacity(0.3)
          Row() {
            Button('Button')
              .width(136)
              .height(22)
              .fontSize(16)
              .fontColor('#007DFF')
              .fontWeight(500)
              .backgroundColor(Color.Transparent)
            Divider().vertical(this.vertical).height(22).color(this.color)
              .width(this.widthK)
              .margin({ left: 8, right: 8 } as Margin)
              .strokeWidth(this.strokeWidth)
              .lineCap(this.lineCapStyle).key("divider")
            Button('Button')
              .width(136)
              .height(22)
              .fontSize(16)
              .fontColor('#007DFF')
              .fontWeight(500)
              .backgroundColor(Color.Transparent)
          }.margin({ top: 17 } as Margin)
        }
        .width(336)
        .height(152)
        .backgroundColor('#FFFFFF')
        .borderRadius(24)
        .padding(24)
      }
      .width('100%')
      .height(168)
      .backgroundColor('#F1F3F5')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 8 } as Margin)
    }.width('100%').padding({ top: 24 } as Margin)
  }
}