'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,WordBreak,
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
struct RichEditorBreak002 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State wordBreak: string = 'str';

build() {
    Column() {
      Column() {

        Text('' + this.wordBreak).id('word_break_text');

        Button('getParagraphStyle').onClick((e: ClickEvent) => {
          this.wordBreak = JSON.stringify(this.controller!.getParagraphs({ start: -1, end: -1 }));
        }).id('getParagraphStyle')

        Button('updateParagraphStyle').onClick((e: ClickEvent) => {
          this.controller!.updateParagraphStyle({
            start: -1, end: -1,
            style: {
              textAlign: TextAlign.Start,
              wordBreak: WordBreak.BREAK_ALL
            }
          })
          this.wordBreak = JSON.stringify(this.controller!.getParagraphs({ start: -1, end: -1 }));
        }).id('updateParagraphStyle')

      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Column() {
        RichEditor(this.options)
          .onReady((): void => {
            this.controller!.addTextSpan('TestWord abc', { style: { fontColor: Color.Orange, fontSize: 30 } })
            this.controller!.updateParagraphStyle({
              start: -1, end: -1,
              style: {
                textAlign: TextAlign.Center,
                wordBreak: WordBreak.BREAK_WORD
              }
            })
          })
          .onWillChange((value: RichEditorChangeValue): boolean => {
            value.replacedSpans!.forEach((item: RichEditorTextSpanResult) => {
              console.log('RichEditorController ----------item.paragraphStyle:-- ' + JSON.stringify(item.paragraphStyle));
              this.wordBreak = JSON.stringify(item.paragraphStyle);
            })
            return true
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
          .id('rich_struct')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}