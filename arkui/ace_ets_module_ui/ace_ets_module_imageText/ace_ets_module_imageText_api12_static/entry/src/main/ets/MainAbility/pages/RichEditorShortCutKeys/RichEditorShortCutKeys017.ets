'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import CommonFunc from '../../common/Common'

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
,SelectionOptions,MenuPolicy,RichEditorImageSpanResult,Image,RowOptions,TextDecorationType,TextDecorationStyle} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorShortCutKeys017 {
  controller: RichEditorController = new RichEditorController();
  @State style: string = '';
build() {

    Column() {

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .padding('10px')
        .height(200)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady((): void => {
        })
        .placeholder('input...', {
          fontColor: Color.Gray,
          font: {
            size: 16,
            weight: FontWeight.Normal,
            style: FontStyle.Normal
          }
        })
        .id('RichEditorShortCutKeys017')

      Button('add text').onClick((e: ClickEvent) => {
        this.controller!.addTextSpan('    ', {
          style: {
            fontSize: 35,
            fontWeight: FontWeight.Bolder,
            fontColor: Color.Red,
            fontFamily: CommonFunc.FONT_FAMILY,
            fontStyle: FontStyle.Italic,
            decoration: { type: TextDecorationType.LineThrough, color: Color.Black, style: TextDecorationStyle.SOLID }
          }
        });
      }).id('addText')

      Button('get spans').onClick((e: ClickEvent) => {
        this.style = '';
        this.controller!.getSpans({
          start: 0,
          end: 4
        })!.forEach(item => {
          this.style = JSON.stringify((item));
          console.log('RichEditorController  this.style:' +  JSON.stringify(this.style));
        })
      }).id('getSpans')

      Text('style:' + this.style).id('style')
    }
  }
}