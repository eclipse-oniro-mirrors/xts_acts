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
  Entry,RichEditorImageSpanResult,
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
struct RichEditorLineLetter001 {
  controller: RichEditorController = new RichEditorController();
  @State textStyle: string = '';
build() {

    Column() {
      Text('textStyle:' + this.textStyle).id('textStyle')

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('012345',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30,
                lineHeight: 30,
                letterSpacing: 30
              }
            })
          this.controller!.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['57px', '57px']
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue): boolean => {
          value.replacedSpans!.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController item.textStyle:' + JSON.stringify(item.textStyle));
            this.textStyle = JSON.stringify(item.textStyle);
          })
          console.log('print replacedImageSpans')
          value.replacedImageSpans!.forEach((item: RichEditorImageSpanResult) => {
            console.log('RichEditorController imageStyle:' + JSON.stringify(item.imageStyle))
            console.log('RichEditorController offsetInSpan:' + item.offsetInSpan)
          })
          value.replacedSymbolSpans!.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController symbolSpanStyle:' + JSON.stringify(item.symbolSpanStyle))
            console.log('RichEditorController paragraphStyle:' + JSON.stringify(item.paragraphStyle))
          })
          return true
        })
        .onSelectionChange((value: RichEditorRange): void => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineLetter001')

    }
  }
}