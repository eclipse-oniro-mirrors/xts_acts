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
  Component,Dimension,
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
,RichEditorImageSpanResult,RichEditorImageSpanStyleResult} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorQueryLayout013 {
  controller: RichEditorController = new RichEditorController();
  @State style: string = ''
  leadingMargin: number = -20

build() {

    Column() {

      Button('get spans').onClick((e: ClickEvent) => {
        this.style = '';
        this.controller!.getSpans({
          start: 0,
          end: 6
        })!.forEach(item => {
          if (item instanceof RichEditorImageSpanResult) {
            this.style += (item as RichEditorImageSpanResult).valueResourceStr;
            if (((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)?.layoutStyle) {
              this.style =
                JSON.stringify(((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)
                  .layoutStyle);
            }
            this.style += '\n'
          } else {
            if ((item as RichEditorTextSpanResult)?.symbolSpanStyle) {
              console.log('get content get symbolSpanStyle');
              this.style += (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize;
              this.style += '\n'
            } else {
              this.style += JSON.stringify((item as RichEditorTextSpanResult).paragraphStyle);
            }
          }
        })
      }).id('get_content')

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('01234567', {
            style: {
              fontColor: Color.Pink,
              fontSize: '32',
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: this.leadingMargin as Dimension
            }
          })
        })
        .id('rich_struct')

      Text('style:' + this.style).id('style')

    }
  }
}