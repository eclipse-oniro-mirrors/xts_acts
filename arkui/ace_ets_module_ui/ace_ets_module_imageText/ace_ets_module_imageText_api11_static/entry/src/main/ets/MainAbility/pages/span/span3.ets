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

import emitter from '@ohos.events.emitter'
import {
  Entry,
  Component,
  Column,
  Text,
  Flex,
  Color,
  Span,
  Padding,
  DecorationStyleInterface,
  TextCase,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  TextDecorationType
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManagerBase, CallbackBase, MessageBase } from '../../common/MessageManager2';

class CustomEventData {
  fontColorValue?: Color
  textCaseValue?: TextCase
}


@Entry
@Component
struct Span3Example {
  @State decorationValue: DecorationStyleInterface =
    { type: TextDecorationType.None, color: Color.Red } as DecorationStyleInterface
  @State textCaseValue: TextCase|undefined = TextCase.Normal
  @State fontSizeValue: number = 40
  @State fontColorValue: Color|string|int = 0xCCCCCC

  messageManagerTextCase: MessageManagerBase<TextCase|undefined> = new MessageManagerBase<TextCase|undefined>()
  messageManagerColor: MessageManagerBase<string> = new MessageManagerBase<string>()

  onPageShow() {
    console.info('span page show called');
    AppStorage.setOrCreate<MessageManagerBase<TextCase|undefined>>('messageManagerTextCase', this.messageManagerTextCase)
    AppStorage.setOrCreate<MessageManagerBase<string>>('messageManagerColor', this.messageManagerColor)
    let callbackTextCase: CallbackBase<TextCase|undefined> = (message: MessageBase<TextCase|undefined>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'textCaseValue') {
        this.textCaseValue = message.value
        console.log("============================= this.textCaseValue " + this.textCaseValue)
      }
    }
    let callbackColor: CallbackBase<string> = (message: MessageBase<string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'fontColorValue') {
        this.fontColorValue = message.value
        console.log("============================= this.fontColorValue " + this.fontColorValue)
      }
    }
    this.messageManagerTextCase.registerCallback(callbackTextCase)
    this.messageManagerColor.registerCallback(callbackColor)

  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('Basic Usage').fontSize(9).fontColor(this.fontColorValue).key('fontColor')
      Text() {
        Span('This is the Span component').fontSize(this.fontSizeValue).textCase(this.textCaseValue)
          .decoration(this.decorationValue).key('decoration')
      }
    }.width('100%').height(250).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}