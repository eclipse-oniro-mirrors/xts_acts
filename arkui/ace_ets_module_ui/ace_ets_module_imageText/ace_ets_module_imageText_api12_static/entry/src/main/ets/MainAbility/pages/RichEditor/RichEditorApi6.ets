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
import { ColorMetrics } from '@ohos.arkui.node';

import {
  Entry,Grid,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,Padding,FlexAlign,VerticalAlign,GridItem,
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
struct RichEditorApi6 {
  controller: RichEditorController = new RichEditorController()
  @State height1:string|number = '80%'
  @State height2:number = 100
  @State supportAvoidance:boolean = true;

  // 自定义键盘组件
  @Builder CustomKeyboardBuilder() {
    Column() {
      Row(){
        Button('增加特表情包').onClick((e: ClickEvent) => {
          this.controller!.addTextSpan("\uD83D\uDE0A",
            {
              style:
              {
                fontColor: Color.Orange,
              }
            })
        })
      }
      Grid() {
        ForEach(new Array<number | string>(1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'), (item: number | string) => {
          GridItem() {
            Button(item + "")
              .width(110).onClick((e: ClickEvent) => {
              this.controller!.addTextSpan(item + '', {
                offset: this.controller!.getCaretOffset(),
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
              this.controller!.setCaretOffset(this.controller!.getCaretOffset() as int + String(item).length)
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }


build() {
    Column() {
      Row(){
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Bottom)
      .height(this.height1)
      .width("100%")
      .padding({bottom:50} as Padding)
      RichEditor({ controller: this.controller } as RichEditorOptions)
        // 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder,{ supportAvoidance: this.supportAvoidance }).margin(10).border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width("100%")
        .id('RichEditorApi6_richEditor1')
        .focusBox({
          strokeColor:ColorMetrics.rgba(255,0,0)
        })
    }
  }
}