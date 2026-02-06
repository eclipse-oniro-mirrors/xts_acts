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
  Entry,RichEditorParagraphResult,
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
  GestureRecognizer,LineBreakStrategy,
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
struct RichEditorApi3 {
  controller: RichEditorController = new RichEditorController();
  @State testStr: string = "0123456789,0123456789,0123456789,0123456789,0123456789."
  private spanParagraphs: RichEditorParagraphResult[] = new Array<RichEditorParagraphResult>();
  @State attributeValue: string = ""


build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady((): void => {
          this.controller!.addTextSpan(this.testStr, {
            style: {
              fontColor: Color.Black,
              fontSize: "32",
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              lineBreakStrategy: LineBreakStrategy.GREEDY
            }
          })
        })
        .width(400)
        .height(300)
        .margin({bottom:20} as Margin)
        .draggable(false)

      Text(this.attributeValue == '0' ? 'LineBreakStrategy.GREEDY' : '').id('RichEditorApi3_text1')
      Button('获取linebreak属性值').onClick((e: ClickEvent) => {
        this.spanParagraphs = this.controller!.getParagraphs({ start: -1, end: -1 }) as RichEditorParagraphResult[]
        this.spanParagraphs!.forEach((item: RichEditorParagraphResult) => {
          if((item as RichEditorParagraphResult)?.style ){
            console.info('lineBreakStrategy:'+ `${item?.style?.lineBreakStrategy}`)
            this.attributeValue = `${item?.style?.lineBreakStrategy}`
          }
        })
      }).id('RichEditorApi3_btn1')

    }
  }
}