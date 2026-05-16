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
struct RichEditorPreventDefault006 {
  controller: RichEditorController = new RichEditorController();
  @State callOnClick: boolean = false;
  @State richEditorCallOnClick: boolean = false;
build() {

    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onClick((e: ClickEvent) => {
          this.richEditorCallOnClick = true;
          console.log('RichEditorController click event');
        })
        .onReady((): void => {
          this.controller!.addTextSpan('a', {
            style:
            {
              fontColor: Color.Orange,
              fontSize: 50
            },
            gesture:
            {
              onClick: (event?: ClickEvent) => {
                if (event != undefined && event.preventDefault) {
                  console.log('RichEditorController text span click event');
                  event.preventDefault();
                }
                this.callOnClick = true;
              }
            }
          })

          this.controller!.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['50px', '50px'],
                layoutStyle: {
                  margin: 5,
                  borderRadius: 15
                }
              },
              gesture:
              {
                onClick: (event?: ClickEvent) => {
                  if (event != undefined && event.preventDefault) {
                    console.log('RichEditorController image span click event');
                    event.preventDefault();
                  }
                  this.callOnClick = true;
                }
              }
            })
        })
        .id('RichEditorPreventDefault006')

      Column(){
        Text('callOnClick:' + this.callOnClick).fontSize(20).fontColor(Color.Black).id('callOnClick')
        Text('richEditorCallOnClick:' + this.richEditorCallOnClick).fontSize(20).fontColor(Color.Black).id('richEditorCallOnClick')
      }.margin({bottom: 10} as Margin)
    }
  }
}