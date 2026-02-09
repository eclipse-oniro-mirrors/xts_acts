'use static';
/**
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
  Entry,TextDecorationType,RichEditorImageSpanStyleResult,RichEditorImageSpanResult,RichEditorUpdateTextSpanStyleOptions,
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
struct RichEditorUxConFormance005 {
  controller: RichEditorController = new RichEditorController();
  @State spanInfo: string = '';
  private content: string = '';
build() {

    Column() {
      Text('spanInfo:' + this.spanInfo).id('spanInfo')

      Button('updateSpanStyle').onClick((e: ClickEvent) => {
        console.log('RichEditorController updateSpanStyle');
        this.controller!.updateSpanStyle({
          start: 0,
          end: this.controller!.getCaretOffset(),
          textStyle:
          {
            fontSize: -1
          }
        } as RichEditorUpdateTextSpanStyleOptions)
      }).id('updateSpanStyle')

      Button('get spans').onClick((e: ClickEvent) => {
        this.content = '';
        this.controller!.getSpans({
          start: 0,
          end: this.controller!.getCaretOffset()
        })!.forEach(item => {
          if (item instanceof RichEditorImageSpanResult) {
            this.content += (item as RichEditorImageSpanResult).valueResourceStr;
            if ( ((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)?.layoutStyle) {
              console.log('RichEditorController get imageStyle');
            }
            this.content += '\n'
          } else {
            if ( (item as RichEditorTextSpanResult)?.symbolSpanStyle) {
              this.content += (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize;
              this.content += '\n'
            } else {
              console.log('RichEditorController textStyle:' + JSON.stringify((item as RichEditorTextSpanResult).textStyle));
              this.spanInfo = JSON.stringify((item as RichEditorTextSpanResult).textStyle);
              this.content += (item as RichEditorTextSpanResult).value;
              this.content += '\n'
            }
          }
        })
      }).id('get_spans')

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('01ab测试AB@#$%',
            {
              style:
              {
                fontSize: 0
              }
            })
        })
        .id('RichEditorUxConFormance005')

    }
  }
}