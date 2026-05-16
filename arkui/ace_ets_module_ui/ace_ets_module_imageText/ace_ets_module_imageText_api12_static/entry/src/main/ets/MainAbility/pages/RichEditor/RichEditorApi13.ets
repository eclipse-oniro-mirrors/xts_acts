'use static';
/*
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
import { BuilderNode, FrameNode, NodeController } from '@ohos.arkui.node'
import {
  Entry,Builder,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroller,
  GestureRecognizer,
  PanRecognizer,
  GestureEvent,
  ScrollableTargetInfo,TextDataDetectorType,FontWeight,
  Stack,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  ScrollDirection,RichEditorSpanType,ResponseType,
  BarState,
  EdgeEffect,
  GestureControl,XComponentController,XComponent,
  PanGesture,
  GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
class Params {
  text: string = ''
  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({bottom: 36} as Margin)
  }
}

@Entry
@Component
struct RichEditorApi13 {
  @State message: string = 'Hello World'
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions

  @State a:TextDataDetectorType=TextDataDetectorType.DATE_TIME

  @Builder panel(){
    Text('aaaaaa')
  }


build() {
    Column() {
      Column() {
        RichEditor(this.options)
          .onReady((): void => {
            this.controller!.addTextSpan(this.message, { style: { fontColor: Color.Orange, fontSize: 30 } })
          })
          .bindSelectionMenu(RichEditorSpanType.BUILDER, this.panel, ResponseType.LongPress, {
          })
          .borderWidth(1)
          .borderColor(Color.Red)
          .width(200)
          .height(200)
          .id('RichEditorApi13')

      }.width('100%').backgroundColor(Color.White)
    }.height('100%')
  }
}