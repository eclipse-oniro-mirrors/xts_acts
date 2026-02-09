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
,RichEditorImageSpanResult,RichEditorImageSpanStyleResult} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorQueryLayout021 {
  controller: RichEditorController = new RichEditorController();
  @State layoutStyle: string = '';
  @State paragraphStyle: string = '';

build() {

    Column() {

      Text('layoutStyle:' + this.layoutStyle).id('layoutStyle')
      Text('paragraphStyle:' + this.paragraphStyle).id('paragraphStyle')

      Button('getSelection').onClick((e: ClickEvent) => {
        this.controller!.setSelection(-1, -1);
        let selection = this.controller!.getSelection()!;
        selection.spans!.forEach(item => {

              if (item instanceof RichEditorImageSpanResult) {
              if ( ((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)?.layoutStyle) {
                this.layoutStyle =
                  JSON.stringify(((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)
                    .layoutStyle);
                console.log('RichEditorController this.layoutStyle:' + this.layoutStyle);
              }
            } else {
              if ( (item as RichEditorTextSpanResult)?.symbolSpanStyle) {
                console.log('RichEditorController get content get symbolSpanStyle');
              } else {
                this.paragraphStyle += JSON.stringify((item as RichEditorTextSpanResult).paragraphStyle);
                console.log('RichEditorController this.paragraphStyle:' + this.paragraphStyle);
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
          this.controller!.addTextSpan('0123', {
            style: {
              fontColor: Color.Pink,
              fontSize: '32',
            },
            paragraphStyle: {
              textAlign: TextAlign.End,
              leadingMargin: 16
            }
          })

          this.controller!.addImageSpan($r('app.media.app_icon'), {
            imageStyle: {
              size: ['80px', '80px'],
              layoutStyle: {
                borderRadius: '50px',
                margin: '40px'
              }
            }
          })
        })
        .id('rich_struct')

    }
  }
}