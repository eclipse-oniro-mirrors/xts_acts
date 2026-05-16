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
  Component,
  Flex,
  Text,
  Padding,
  $rawfile,
  TextAlign,
  TextOverflow,
  TextDecorationType,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Color,
  Image
} from '@ohos.arkui.component'
import {
  State,AppStorage
} from '@ohos.arkui.stateManagement'
import emitter from '@ohos.events.emitter'
import { MessageManagerBase, CallbackBase, MessageBase } from '../../common/MessageManager2';

@Entry
@Component
struct Text3Example {
  @State fontSize: number = 9;
  @State fontColor: string = "#330A59F8";
  @State textAlign: TextAlign = TextAlign.Start;
  @State textOverflow: TextOverflow = TextOverflow.Clip;
  @State decoration: TextDecorationType = TextDecorationType.None;
  messageManagerTextAlign: MessageManagerBase<TextAlign> = new MessageManagerBase<TextAlign>()
  messageManagerTextOverflow: MessageManagerBase<TextOverflow> = new MessageManagerBase<TextOverflow>()
  messageManagerString: MessageManagerBase<string> = new MessageManagerBase<string>()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('lineHeightt')
        .fontSize(this.fontSize)
        .fontColor(this.fontColor)
        .textAlign(this.textAlign)
        .textOverflow({ overflow: this.textOverflow })
        .decoration({ type: this.decoration, color: Color.Red })
        .key('text')
      Image($rawfile('test.png'))
        .key('image')
    }
    .height(600)
    .width(350)
    .padding({ left: 35, right: 35, top: 35 } as Padding)
  }

  onPageShow() {
    console.info('text page show called');
    AppStorage.setOrCreate<MessageManagerBase<TextAlign>>('messageManagerTextAlign', this.messageManagerTextAlign)
    AppStorage.setOrCreate<MessageManagerBase<TextOverflow>>('messageManagerTextOverflow', this.messageManagerTextOverflow)
    AppStorage.setOrCreate<MessageManagerBase<string>>('messageManagerString', this.messageManagerString)
    let callbackTextAlign: CallbackBase<TextAlign> = (message: MessageBase<TextAlign>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'textAlign') {
        this.textAlign = message.value
        console.log("============================= this.textAlign " + this.textAlign)
      }
    }
    let callbackTextOverflow: CallbackBase<TextOverflow> = (message: MessageBase<TextOverflow>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'textOverflow') {
        this.textOverflow = message.value
        console.log("============================= this.textOverflow " + this.textAlign)
      }
    }
    let callbackTextString: CallbackBase<string> = (message: MessageBase<string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'fontSize') {
        this.fontSize = Number.parseInt(message.value)
        console.log("============================= this.fontSize " + this.fontSize)
      }
      if (message.name == 'fontColor') {
        this.fontColor = message.value
        console.log("============================= this.fontColor " + this.fontColor)
      }
    }
    this.messageManagerTextAlign.registerCallback(callbackTextAlign)
    this.messageManagerTextOverflow.registerCallback(callbackTextOverflow)
    this.messageManagerString.registerCallback(callbackTextString)
  }
}
