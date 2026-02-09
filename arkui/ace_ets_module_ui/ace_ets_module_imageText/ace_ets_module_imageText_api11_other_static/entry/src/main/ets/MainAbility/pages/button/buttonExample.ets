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
  ButtonType,
  FontStyle,
  FontWeight,
  ButtonOptions,
  FlexWrap,
  LoadingProgress,
  VerticalAlign
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { MessageManager, Callback, Message } from '../../common/MessageManager';

@Entry
@Component
struct ButtonExample {
  @State bttype: ButtonType = ButtonType.Normal
  @State stateEffect: boolean = true
  @State str: string = "Disable1"
  @State fontColor: Color | string = Color.Red
  @State fontFamily: string = "123"
  @State fontStyle: FontStyle = FontStyle.Italic
  @State fontWeight: FontWeight = FontWeight.Lighter
  @State fontSize: string = '12'
  messageManager: MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight> = new MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>()

  onPageShow() {
    console.info('ButtonExample onPageShow')
    AppStorage.setOrCreate<MessageManager<ButtonType | boolean | string | Color | FontStyle | FontWeight>>("messageManager", this.messageManager);
    let callback: Callback<ButtonType | boolean | string | Color | FontStyle | FontWeight> = (message: Message<ButtonType | boolean | string | Color | FontStyle | FontWeight>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'bttype') {
        if (!(message.value instanceof string)) {
          this.bttype = message.value as ButtonType
        } else {
          // 异常值
          this.bttype = ButtonType.ROUNDED_RECTANGLE
        }
      }
      if (message.name == 'stateEffect') {
        this.stateEffect = message.value as Boolean
      }

      if (message.name == 'fontSize') {
        this.fontSize = message.value as String
      }
      if (message.name == 'fontColor') {
        if (message.value instanceof string) {
          this.fontColor = message.value as string
        } else {
          this.fontColor = message.value as Color
        }
      }
      if (message.name == 'fontFamily') {
        this.fontFamily = message.value as String
      }
      if (message.name == 'fontStyle') {
        if (!(message.value instanceof string)) {
          this.fontStyle = message.value as FontStyle
        }
      }
      if (message.name == 'fontWeight') {
        if (!(message.value instanceof string)) {
          this.fontWeight = message.value as FontWeight
        } else {
          // 异常值
          this.fontWeight =  FontWeight.Normal
        }
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('Normal button').fontSize(9).fontColor('0xCCCCCC')
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('OK', { type: this.bttype, stateEffect: this.stateEffect })
          .borderRadius(8)
          .backgroundColor('0x317aff')
          .width(90)
          .fontSize(this.fontSize)
          .key('btok')
          .fontColor(this.fontColor)
          .fontFamily(this.fontFamily)
          .fontStyle(this.fontStyle)
          .fontWeight(this.fontWeight)
        Button({ type: ButtonType.Normal, stateEffect: true } as ButtonOptions) {
          Row() {
            LoadingProgress().width(20).height(20).margin({ left: 12 } as Margin).color('0xFFFFFF')
            Text('loading').fontSize(12).fontColor('0xffffff').margin({ left: 5, right: 12 } as Margin)
          }.alignItems(VerticalAlign.Center)
        }.borderRadius(8).backgroundColor('0x317aff').width(90).height(40)

        Button('Disable', { type: ButtonType.Normal, stateEffect: false })
          .opacity(0.4)
          .borderRadius(8)
          .backgroundColor('0x317aff')
          .width(90)
          .key('btdisable')
          .id('btdisable')
      }

      Text('Capsule button').fontSize(9).fontColor('0xCCCCCC')
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('OK1', { type: ButtonType.Capsule, stateEffect: true }).backgroundColor('0x317aff').width(90)
        Button({ type: ButtonType.Capsule, stateEffect: true } as ButtonOptions) {
          Row() {
            LoadingProgress().width(20).height(20).margin({ left: 12 } as Margin).color('0xFFFFFF')
            Text('loading1').fontSize(12).fontColor('0xffffff').margin({ left: 5, right: 12 } as Margin)
          }.alignItems(VerticalAlign.Center).width(90).height(40)
        }.backgroundColor('0x317aff')

        Button(this.str, { type: ButtonType.Capsule, stateEffect: true })
          .opacity(0.4)
          .backgroundColor('0x317aff')
          .width(90)
          .key('btdisable1')
          .id('btdisable1')
          .onClick((e: ClickEvent) => {
            this.str = "click"
          })
      }

      Text('Circle button').fontSize(9).fontColor('0xCCCCCC')
      Flex({ alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
        Button({ type: ButtonType.Circle, stateEffect: true } as ButtonOptions) {
          LoadingProgress().width(20).height(20).color('0xFFFFFF')
        }.width(55).height(55).backgroundColor('0x317aff')

        Button({ type: ButtonType.Circle, stateEffect: true } as ButtonOptions) {
          LoadingProgress().width(20).height(20).color('0xFFFFFF')
        }.width(55).height(55).margin({ left: 20 } as Margin).backgroundColor('0xF55A42')
      }
    }.height(400).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}