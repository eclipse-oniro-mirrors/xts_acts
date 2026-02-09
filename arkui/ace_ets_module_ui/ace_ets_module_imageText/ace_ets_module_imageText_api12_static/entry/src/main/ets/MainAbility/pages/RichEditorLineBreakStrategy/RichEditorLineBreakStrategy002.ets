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
  Entry,RichEditorParagraphResult,LineBreakStrategy,
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
struct RichEditorLineBreakStrategy002 {
  controller: RichEditorController = new RichEditorController();
  @State attributeValue: string = ''
  @State lineBreakOptionStr: string[] = new Array<string>('GREEDY', 'HIGH_QUALITY', 'BALANCED')
build() {

    Column() {
      Column(){
        Text('linebreak attributeValue:' + this.attributeValue).fontSize(20).fontColor(Color.Black).id('attributeValue')
      }.margin({bottom: 10} as Margin)

      Button('get linebreak attributeValue').onClick((e: ClickEvent) => {
        let spanParagraphs = this.controller!.getParagraphs({ start: -1, end: -1 })
        console.log('RichEditor getParagraphs:' + JSON.stringify(spanParagraphs))
        spanParagraphs!.forEach(item => {
          if(typeof(item as RichEditorParagraphResult)?.style!= 'undefined'){
            this.attributeValue = ''
            console.info('lineBreakStrategy:'+ `${(item as RichEditorParagraphResult).style.lineBreakStrategy}`)
            this.attributeValue += this.lineBreakOptionStr[Number(`${(item as RichEditorParagraphResult).style.lineBreakStrategy}`) as int];
          }
        })
      }).id('getAttr')

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
                fontSize: 30
              },
              paragraphStyle:
              {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            })
        })
        .id('RichEditorLineBreakStrategy002')

    }
  }
}