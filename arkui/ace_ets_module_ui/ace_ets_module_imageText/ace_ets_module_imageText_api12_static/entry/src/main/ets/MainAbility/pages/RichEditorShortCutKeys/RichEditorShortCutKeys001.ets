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
struct RichEditorShortCutKeys001 {
  controller1: RichEditorController = new RichEditorController();
  controller: RichEditorController = new RichEditorController();
  @State finalText: string = '';
build() {

    Column() {
      Text('finalText:' + this.finalText).id('finalText')

      RichEditor({ controller: this.controller1 } as RichEditorOptions)
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller1.addTextSpan('1234567',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20
              }
            })
        })
        .id('RichEditor')

      Button('select')
        .id('select')
        .margin(15)
        .backgroundColor(Color.Transparent)
        .onClick((e: ClickEvent) => {
          let options: SelectionOptions = {
            menuPolicy: MenuPolicy.SHOW
          };
          this.controller1.setSelection(1, 3, options);
        })

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('abcd',
            {
              style:
              {
                fontColor: Color.Red,
                fontSize: 20
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue): boolean => {
          value.replacedSpans!.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController item:' + JSON.stringify(item.value));
            this.finalText = JSON.stringify(item.value);
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
        .id('RichEditorShortCutKeys001')

    }
  }
}