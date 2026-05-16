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
struct RichEditorChangeValueTest1 {
  controller: RichEditorController = new RichEditorController()
  @State text1:string = '6'

build() {
    Column({space:10} as ColumnOptions) {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(150)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width("90%")
        .onReady((): void => {
          this.controller!.addImageSpan($r("app.media.icon"),
            {
              imageStyle:
              {
                size: ["50px", "50px"]
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue): boolean => {
          console.log('测试log1：onWillChange'+JSON.stringify(value))
          value.replacedImageSpans!.forEach((item: RichEditorImageSpanResult) => {
            console.log("testTag testTag spanPosition:" + JSON.stringify((item as RichEditorImageSpanResult).spanPosition))
            console.log("testTag valuePixelMap:" + JSON.stringify((item as RichEditorImageSpanResult).valuePixelMap))
            console.log("testTag valueResourceStr:" + (item as RichEditorImageSpanResult).valueResourceStr)
            console.log("testTag imageStyle:" +JSON.stringify( (item as RichEditorImageSpanResult).imageStyle))
            console.log("testTag offsetInSpan:" + JSON.stringify((item as RichEditorImageSpanResult).offsetInSpan))
            this.text1 = (item as RichEditorImageSpanResult).spanPosition.spanIndex + ''
          })

          value.replacedSymbolSpans!.forEach((item: RichEditorTextSpanResult) => {
            console.log("spanPosition:" + JSON.stringify((item as RichEditorTextSpanResult).spanPosition))
            console.log("value:" + (item as RichEditorTextSpanResult).value)
            console.log("textStyle:" + JSON.stringify((item as RichEditorTextSpanResult).textStyle))
            console.log("offsetInSpan:" + JSON.stringify((item as RichEditorTextSpanResult).offsetInSpan))
            console.log("valueResource:" + (item as RichEditorTextSpanResult).valueResource)
            console.log("symbolSpanStyle:" +JSON.stringify( (item as RichEditorTextSpanResult).symbolSpanStyle))
            console.log("paragraphStyle:" + JSON.stringify((item as RichEditorTextSpanResult).paragraphStyle))
          })

          return true
        })

      Text(this.text1).id('RichEditorChangeValueTest1_text1')


    }.width('100%')
  }
}