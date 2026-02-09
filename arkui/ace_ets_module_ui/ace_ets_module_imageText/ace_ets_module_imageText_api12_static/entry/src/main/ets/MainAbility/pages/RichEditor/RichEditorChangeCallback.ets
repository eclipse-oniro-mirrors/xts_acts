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
struct RichEditorChangeCallback {
  controller: RichEditorController = new RichEditorController()
  @State text: string = ''
  @State text2: string = ''


build() {
    Column({space:10} as ColumnOptions) {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height('100vp')
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('300vp')
        .onReady((): void => {
          this.controller!.addTextSpan('test')
        })
        .onWillChange((value: RichEditorChangeValue): boolean=>{
          console.log('onWillChange: '+JSON.stringify(value))
          this.text = 'onWillChange'
          this.text2 = value.replacedSpans[0].value

          value.replacedSpans!.forEach((item: RichEditorTextSpanResult) => {
            console.log("spanPosition:" + JSON.stringify(item.spanPosition))
            console.log("value:" + item.value)
            console.log("textStyle:" + JSON.stringify(item.textStyle))
            console.log("offsetInSpan:" + item.offsetInSpan)
            console.log("valueResource:" + item.valueResource)
            console.log("symbolSpanStyle:" +JSON.stringify( item.symbolSpanStyle))
            console.log("paragraphStyle:" + JSON.stringify(item.paragraphStyle))
          })
          return true
        })
        .onDidChange((): void => {
          this.text = this.text + 'onDidChange'
        })

      Text(this.text).id('RichEditorChangeCallback_text')
      Text(this.text2).id('RichEditorChangeCallback_text2')

    }
  }
}