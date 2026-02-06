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
  Component,RichEditorUpdateTextSpanStyleOptions,TextDecorationStyle,TextDecorationType,
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
struct RichEditorStabillity002 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State pointPosition: int = -1;
  @State style: string = '';

build() {
    Column() {

      Column() {
        Text('' + this.pointPosition).id('pointPosition');
        Text('style:' + this.style).id('style');
        Button('get Point Position').onClick((e: ClickEvent) => {
          this.pointPosition = this.controller!.getCaretOffset() as int;
          console.log('this.pointPosition:' + this.pointPosition);
        }).id('getPosition')
        Button('get spans').onClick((e: ClickEvent) => {
          this.style = '';
          this.controller!.getSpans({
            start: -1,
            end: -1
          })!.forEach(item => {
            this.style = JSON.stringify((item as RichEditorTextSpanResult));
            console.log('RichEditorController  this.style:' +  JSON.stringify(this.style));
          })
        }).id('getSpans')
        Button('UpdateSpanStyles').onClick((e: ClickEvent) => {
          setTimeout(() => {
            this.controller!.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Brown,
                fontSize: 20
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          }, 200)
          setTimeout(() => {
            this.controller!.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Red,
                fontSize: 20
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          }, 400)
          setTimeout(() => {
            this.controller!.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 40
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          }, 600)
          setTimeout(() => {
            this.controller!.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 40,
                fontWeight: FontWeight.Bolder
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          }, 800)
          setTimeout(() => {
            this.controller!.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 30,
                fontWeight: FontWeight.Bolder,
                fontFamily: CommonFunc.FONT_FAMILY
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          }, 1000)
          setTimeout(() => {
            this.controller!.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 40,
                fontWeight: FontWeight.Bolder,
                fontFamily: CommonFunc.FONT_FAMILY,
                fontStyle: FontStyle.Italic
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          }, 1200)
          setTimeout(() => {
            this.controller!.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Blue,
                fontSize: 30,
                fontWeight: FontWeight.Bolder,
                fontFamily: CommonFunc.FONT_FAMILY,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.LineThrough,
                  color: Color.Black, style: TextDecorationStyle.SOLID }
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          }, 1400)
        }).id('UpdateSpanStyles')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Column() {
        RichEditor(this.options)
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
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
          .id('RichEditorStabillity002')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}