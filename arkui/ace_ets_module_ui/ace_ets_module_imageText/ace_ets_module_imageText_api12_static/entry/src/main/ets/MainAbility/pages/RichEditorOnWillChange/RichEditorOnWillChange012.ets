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
,CutEvent,CopyEvent} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorOnWillChange012 {
  @State text: string = 'abcd'
  controller: RichEditorController = new RichEditorController();
  @State onWillChangeCallback: boolean = false;
  @State replacedSpansCallback: boolean = false;
  @State onDidChangeCallback: boolean = false;
  @State replaceText: string = '';
  @State onWillChangeRangeBefore: string = '';
  @State onDidChangeRangeBefore: string = '';
  @State onDidRangeAfter: string = '';

build() {

    Column() {

      Text('onWillChange_callback:' + this.onWillChangeCallback).id('onWillChange_callback')
      Text('replacedSpans_callback:' + this.replacedSpansCallback).id('replacedSpans_callback')
      Text('onDidChange_callback:' + this.onDidChangeCallback).id('onDidChange_callback')
      Text('replace_text:' + this.replaceText).id('replace_text')
      Text('onDidChange rangeBefore:' + this.onDidChangeRangeBefore).id('onDidChange_rangeBefore')
      Text('onWillChange_rangeBefore:' + this.onWillChangeRangeBefore).id('onWillChange_rangeBefore')
      Text('ondid rangeAfter:' + this.onDidRangeAfter).id('ondid_rangeAfter')


      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('abc',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue): boolean => {
          console.log('RichEditorController：onWillChange')
          this.onWillChangeCallback = true;
          this.onWillChangeRangeBefore = JSON.stringify(value.rangeBefore);
          value.replacedSpans!.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController：replacedSpans');
            console.log('RichEditorController item:' + JSON.stringify(item));
            console.log('RichEditorController spanPosition spanIndex:' + JSON.stringify(item.spanPosition.spanIndex));
            this.replacedSpansCallback = true;
            this.replaceText = item.value;
            console.log('RichEditorController replacedSpans value:' + item.value);
            console.log('RichEditorController replacedSpans value length:' + item.value.length);
          })
          return true;
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange): void => {
          this.onDidChangeCallback = true;
          console.log('RichEditorController onDidChange rangeBefore:' + JSON.stringify(rangeBefore));
          this.onDidChangeRangeBefore = JSON.stringify(rangeBefore);
          console.log('RichEditorController onDidChange rangeAfter:' + JSON.stringify(rangeAfter));
          this.onDidRangeAfter = JSON.stringify(rangeAfter);
        })
        .onCopy((): void => {
          console.log('RichEditorController：onCopy');
        })
        .onPaste((): void => {
          console.log('RichEditorController：onPaste');
        })
        .id('rich_struct')
    }
  }
}