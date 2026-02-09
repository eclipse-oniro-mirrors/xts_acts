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

import {
  Entry,
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
  ScrollableTargetInfo,
  Stack,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  GestureControl,
  PanGesture,
GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId,CopyOptions,RichEditorInsertValue,Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorAttributeStrings001 {

  @State spans: string = '';
  @State finalSpans: string = '';
  fontStyle1: TextStyle = { fontColor: Color.Blue } as TextStyle;
  mutableStyledString: MutableStyledString = new MutableStyledString('abcd',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller } as RichEditorStyledStringOptions;

  controller1: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 } as RichEditorOptions;



build() {
    Column() {

      Button('get spans').onClick((e: ClickEvent) => {
        this.controller1!.getSpans({
          start: 0,
          end: 8
        })!!.forEach((item): void => {
          this.spans += (item as RichEditorTextSpanResult).value + '\n';
        })
      }).id('getSpans')

      Button('get final Spans').onClick((e: ClickEvent) => {
        this.finalSpans = '';
        this.controller1!.getSpans({
          start: 0,
          end: 16
        })!!.forEach((item): void => {
          this.finalSpans += (item as RichEditorTextSpanResult).value;
        })
      }).id('getFinalSpans')

      Button('set center').onClick((e: ClickEvent) => {
        this.controller1.setCaretOffset(1);
      }).id('setCenter')

      Button('set start').onClick((e: ClickEvent) => {
        this.controller1.setCaretOffset(0);
      }).id('setStart')


      Text('Spans:' + this.spans).id('Spans')
      Text('finalSpans:' + this.finalSpans).id('finalSpans')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.mutableStyledString);
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings001')

      RichEditor(this.options1)
        .onReady((): void => {
          this.controller1.addTextSpan('0123',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings001_1')
    }
  }
}