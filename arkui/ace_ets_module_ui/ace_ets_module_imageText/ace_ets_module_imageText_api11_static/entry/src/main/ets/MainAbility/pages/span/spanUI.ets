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
  Column,
  Text,
  Flex,
  Color,
  Span,
  TextCase,
  TextDecorationType,
  FlexOptions,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  ClickEvent,
  Padding,
  Margin
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

export class SpanExampleManager {
  name: string = ''
  message: MessageManager = new MessageManager()
}

@Entry
@Component
struct SpanExample {
  @State message1: string = "test";
  @State content: string = "I am Underline-span";
  @State fontSize: number = 12;
  @State textCase: TextCase = TextCase.Normal;
  @State letterSpacing: number = 10;
  @State type: TextDecorationType = TextDecorationType.Underline;
  @State color: string = '#FFCCEE';
  messageManager: MessageManager = new MessageManager();

  onPageShow() {
    console.info('span onPageShow')
    const spanExampleManager = new SpanExampleManager();
    spanExampleManager.message = this.messageManager;
    spanExampleManager.name = 'messageManager'
    AppStorage.setOrCreate<SpanExampleManager>('spanExampleManager', spanExampleManager);

    let callback: Callback = (message: Message) => {
      const spanExampleMessage: Message = message
      console.error('message = ' + spanExampleMessage.name + "--" + spanExampleMessage.value)
      if (spanExampleMessage.name == 'click') {
        this.message1 = spanExampleMessage.value as string
      }
      if (spanExampleMessage.name == 'content') {
        this.content = spanExampleMessage.value as string
      }
      if (spanExampleMessage.name == 'fontSize') {
        this.fontSize = spanExampleMessage.value as number
      }
      if (spanExampleMessage.name == 'textCase') {
        this.textCase = spanExampleMessage.value as TextCase
      }
      if (spanExampleMessage.name == 'letterSpacing') {
        this.letterSpacing = spanExampleMessage.value as number
      }
      if (spanExampleMessage.name == 'type') {
        this.type = spanExampleMessage.value as TextDecorationType
      }
      if (spanExampleMessage.name == 'color') {
        this.color = spanExampleMessage.value as string
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Start,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Text('Basic Usage').fontSize(9).fontColor(0xCCCCCC)
      Text() {
        Span('This is the Span component').fontSize(12).textCase(TextCase.Normal)
          .decoration({ type: TextDecorationType.None, color: Color.Red })
      }

      // 文本横线添加
      Text('Text Decoration').fontSize(9).fontColor(0xCCCCCC)
      Text() {
        Span(this.content)
          .decoration({ type: this.type, color: this.color })
          .fontSize(this.fontSize)
          .textCase(this.textCase)
          .letterSpacing(this.letterSpacing)
          .onClick((e: ClickEvent) => {
            this.message1 = "clickDone"
          })
          .key('testSpan')
          .id('testSpan')
      }

      Text() {
        Span('I am LineThrough-span')
          .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
          .fontSize(12)
      }

      Text() {
        Span('I am Overline-span')
          .decoration({ type: TextDecorationType.Overline, color: Color.Red })
          .fontSize(12)
          .key("testspan")
      }

      // 文本字符间距
      Text('LetterSpacing').fontSize(9).fontColor(0xCCCCCC)
      Text() {
        Span('span letter spacing')
          .letterSpacing(0)
          .fontSize(12)
      }

      Text() {
        Span('span letter spacing')
          .letterSpacing(-2)
          .fontSize(12)
      }

      Text() {
        Span('span letter spacing')
          .letterSpacing(3)
          .fontSize(12)
      }


      // 文本大小写展示设置
      Text('Text Case').fontSize(9).fontColor(0xCCCCCC)
      Text() {
        Span('I am Lower-span').fontSize(12)
          .textCase(TextCase.LowerCase)
          .decoration({ type: TextDecorationType.None })
      }

      Text() {
        Span('I am Upper-span')
          .fontSize(12)
          .key('sn')
          .textCase(TextCase.UpperCase)
          .decoration({ type: TextDecorationType.None })
          .onClick((e: ClickEvent) => {
            this.message1 = "clickDone"
          })
      }

      Text(this.message1)
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)
        .margin({ top: 20 } as Margin)
        .key('clickT')
    }.width('100%').height(250).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}